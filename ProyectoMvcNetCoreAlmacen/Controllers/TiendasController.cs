using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class TiendasController : Controller
    {
        private RepositoryTienda repoTienda;

        public TiendasController(RepositoryTienda repoTienda)
        {
            this.repoTienda = repoTienda;
        }
        public async Task<IActionResult> Index()
        {
            List<Tienda> tiendas = await this.repoTienda.GetTiendasAsync();
            return View(tiendas);
        }
    }
}
