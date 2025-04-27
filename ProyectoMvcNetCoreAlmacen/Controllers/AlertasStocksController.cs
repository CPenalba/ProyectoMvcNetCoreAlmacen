using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using NugetProyectoAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class AlertasStocksController : Controller
    {
        private RepositoryAlmacen repo;

        public AlertasStocksController(RepositoryAlmacen repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {

            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            List<AlertaStock> alertas = await this.repo.GetAlertasStocksAsync((int)tiendaId);
            return View(alertas);
        }

        public async Task<IActionResult> Details(int idalerta)
        {
            AlertaStock a = await this.repo.FindAlertaAsync(idalerta);
            return View(a);
        }

        public async Task<IActionResult> Create()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }

            var productos = await this.repo.GetProductosAsync((int)tiendaId);
            ViewBag.Productos = new SelectList(productos, "IdProducto", "Nombre");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(AlertaStock a)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            a.IdTienda = tiendaId.Value;
            a.Estado = "Pendiente";

            await this.repo.InsertAlertaAsync(a.IdAlertaStock, a.IdProducto, a.IdTienda, a.FechaAlerta, a.Descripcion, a.Estado);
            return Json(new { success = true, message = "Alerta creada correctamente", redirectUrl = Url.Action("Calendar") });
        }

        public async Task<IActionResult> Delete(int idalerta)
        {
            await this.repo.DeleteAlertaAsync(idalerta);
            TempData["AlertMessage"] = "Alerta eliminada exitosamente!!!";
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int idalerta)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            AlertaStock a = await this.repo.FindAlertaAsync(idalerta);

            if (a == null)
            {
                return NotFound(); 
            }
            var productos = await this.repo.GetProductosAsync((int)tiendaId);
            ViewBag.Productos = new SelectList(productos, "IdProducto", "Nombre");
            return View(a); 
        }

        [HttpPost]
        public async Task<IActionResult> Edit(AlertaStock a)
        {
            await this.repo.UpdateAlertaAsync(a);
            return RedirectToAction("Calendar");
        }

        [HttpPost]
        public async Task<IActionResult> CambiarEstado(int idAlertaStock, string estado)
        {
            var alerta = await this.repo.FindAlertaAsync(idAlertaStock);
            if (alerta == null)
            {
                return NotFound();
            }
            alerta.Estado = estado;
            await this.repo.UpdateAlertaAsync(alerta);

            return Json(new { success = true });
        }

        public async Task<IActionResult> Calendar()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }

            List<AlertaStock> alertas = await this.repo.GetAlertasStocksAsync((int)tiendaId);
            List<object> items = new List<object>();

            foreach (AlertaStock a in alertas)
            {
                var producto = await this.repo.GetProductoByIdAsync(a.IdProducto);

                var item = new
                {
                    id = a.IdAlertaStock,
                    title = a.Descripcion,
                    start = a.FechaAlerta.ToString("yyyy-MM-ddTHH:mm:ss"),
                    end = a.FechaAlerta.AddHours(1),
                    estado = a.Estado,
                    productoNombre = producto?.Nombre,
                    idProducto = a.IdProducto,
                    idProveedor = producto?.IdProveedor,
                    precio = producto?.Precio
                };
                items.Add(item);
            }

            ViewBag.Eventos = JsonConvert.SerializeObject(items);
            return View();
        }
    }
}
