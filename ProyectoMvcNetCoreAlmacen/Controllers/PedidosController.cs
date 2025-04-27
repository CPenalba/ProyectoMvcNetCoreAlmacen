using Microsoft.AspNetCore.Mvc;
using NugetProyectoAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class PedidosController : Controller
    {
        private RepositoryAlmacen repo;

        public PedidosController(RepositoryAlmacen repo)
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
            List<Pedido> pedidos = await this.repo.GetPedidosAsync((int)tiendaId);
            return View(pedidos);
        }

        public async Task<IActionResult> Create(int? idProducto, int? idProveedor, decimal? precio)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            ViewBag.IdProducto = idProducto;
            ViewBag.IdProveedor = idProveedor;
            ViewBag.Precio = precio;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Pedido p)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            p.IdTienda = tiendaId.Value;
            p.FechaPedido = DateTime.Now;
            p.FechaEntrega = p.FechaPedido.AddDays(7);
            p.PrecioTotalPedido = p.Precio * p.Cantidad;
            p.Estado = "Pendiente";

            await this.repo.InsertPedidoAsync(p.IdPedido, p.IdProveedor, p.IdTienda, p.IdProducto, p.FechaPedido, p.FechaEntrega, p.Estado, p.Cantidad, p.Precio, p.PrecioTotalPedido);

            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> CambiarEstado(int IdPedido, string Estado)
        {
            await this.repo.UpdateEstadoPedidoAsync(IdPedido, Estado);
            return RedirectToAction("Index");
        }
    }
}
