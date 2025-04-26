using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class DetallesVentasController : Controller
    {
        private RepositoryAlmacen repo;

        public DetallesVentasController(RepositoryAlmacen repo)
        {
            this.repo = repo;
        }

        public async Task<IActionResult> Index(int? año)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            var añosDisponibles = await this.repo.GetAñosVentasAsync((int)tiendaId);
            ViewBag.Años = new SelectList(añosDisponibles, año ?? DateTime.Now.Year);
            var datosVentas = await this.repo.GetVentasPorMesAsync((int)tiendaId, año ?? DateTime.Now.Year);
            ViewBag.DatosVentas = datosVentas;
            var productosMasVendidos = await this.repo.GetProductosMasVendidosAsync((int)tiendaId);
            ViewBag.ProductosMasVendidos = productosMasVendidos;
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

            var productos = await this.repo.GetProductosAsync((int)tiendaId);
            ViewBag.Productos = productos;


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
            v.IdTienda = tiendaId.Value;
            v.PrecioTotalVenta = v.Precio * v.Cantidad;
            await this.repo.InsertVentaAsync(v.IdDetalleVenta, v.Fecha, v.IdProducto, v.IdTienda, v.Cantidad, v.Precio, v.PrecioTotalVenta);
            return RedirectToAction("Index");
        }
    }
}
