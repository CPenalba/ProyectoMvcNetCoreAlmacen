using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class AlertasStocksController : Controller
    {
        private RepositoryAlertaStock repo;

        public AlertasStocksController(RepositoryAlertaStock repo)
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

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(AlertaStock a)
        {
            await this.repo.InsertAlertaAsync(a.IdAlertaStock, a.IdProducto, a.IdTienda, a.FechaAlerta, a.Descripcion, a.Estado);
            TempData["AlertMessage"] = "Alerta creada exitosamente!!!";
            return RedirectToAction("Calendar");
        }
        public async Task<IActionResult> Delete(int idalerta)
        {
            await this.repo.DeleteAlertaAsync(idalerta);
            TempData["AlertMessage"] = "Alerta eliminada exitosamente!!!";
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int idalerta)
        {
            AlertaStock a = await this.repo.FindAlertaAsync(idalerta);
            return View(a);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(AlertaStock a)
        {
            await this.repo.UpdateAlertaAsync(a.IdAlertaStock, a.IdProducto, a.IdTienda, a.FechaAlerta, a.Descripcion, a.Estado);
            TempData["AlertMessage"] = "Alerta editada exitosamente!!!";
            return RedirectToAction("Index");
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
                // Obtener el nombre del producto
                var producto = await this.repo.GetProductoByIdAsync(a.IdProducto);

                var item = new
                {
                    id = a.IdAlertaStock,
                    title = a.Descripcion,
                    start = a.FechaAlerta.ToString("yyyy-MM-ddTHH:mm:ss"),
                    end = a.FechaAlerta.AddHours(1),
                    estado = a.Estado,
                    productoNombre = producto?.Nombre // Suponiendo que 'Nombre' es la propiedad en la clase Producto
                };
                items.Add(item);
            }

            ViewBag.Eventos = JsonConvert.SerializeObject(items);
            return View();
        }
    }
}
