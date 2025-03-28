using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class DetallesVentasController : Controller
    {
        private RepositoryDetalleVenta repo;
        private RepositoryProducto repoProducto;


        public DetallesVentasController(RepositoryDetalleVenta repo, RepositoryProducto repoProducto)
        {
            this.repo = repo;
            this.repoProducto = repoProducto;
        }
        public async Task<IActionResult> Index()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            List<DetalleVenta> detalles = await this.repo.GetDetallesVentasAsync((int)tiendaId);
            return View(detalles);
        }

        public async Task<IActionResult> Create()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }

            var productos = await this.repoProducto.GetProductosAsync((int)tiendaId);
            ViewBag.Productos = new SelectList(productos, "IdProducto", "Nombre");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(DetalleVenta v)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }

            // Asignar el IdTienda al producto
            v.IdTienda = tiendaId.Value;
            v.PrecioTotalVenta = v.Precio * v.Cantidad;

            await this.repo.InsertVentaAsync(v.IdDetalleVenta, v.Fecha, v.IdProducto, v.IdTienda, v.Cantidad, v.Precio, v.PrecioTotalVenta);
            return RedirectToAction("Index");
        }
    }
}
