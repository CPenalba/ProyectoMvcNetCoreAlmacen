using Microsoft.AspNetCore.Mvc;
using NugetProyectoAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class ProveedoresController : Controller
    {

        private RepositoryAlmacen repo;

        public ProveedoresController(RepositoryAlmacen repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            List<Proveedor> proveedores = await this.repo.GetProveedoresAsync();
            return View(proveedores);
        }

        public async Task<IActionResult> Details(int idproveedor)
        {
            Proveedor p = await this.repo.FindProveedorAsync(idproveedor);
            return View(p);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Proveedor p)
        {
            await this.repo.InsertProveedorAsync(p.IdProveedor, p.Nombre, p.Telefono, p.Correo, p.Direccion);
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int idproveedor)
        {
            Proveedor p = await this.repo.FindProveedorAsync(idproveedor);
            return View(p);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Proveedor p)
        {
            await this.repo.UpdateProveedorAsync(p);
            return RedirectToAction("Index");
        }
    }
}
