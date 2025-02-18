using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class DetallesVentasController : Controller
    {
        private RepositoryDetalleVenta repo;

        public DetallesVentasController(RepositoryDetalleVenta repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            List<DetalleVenta> detalles = await this.repo.GetDetallesVentasAsync();
            return View(detalles);
        }
    }
}
