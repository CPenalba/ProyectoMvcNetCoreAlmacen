using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class ProveedoresController : Controller
    {

        private RepositoryProveedor repo;

        public ProveedoresController(RepositoryProveedor repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            List<Proveedor> proveedores = await this.repo.GetProveedoresAsync();
            return View(proveedores);
        }
    }
}
