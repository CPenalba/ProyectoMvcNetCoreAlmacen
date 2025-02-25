using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class ProductosController : Controller
    {

        private RepositoryProducto repoProducto;
        private RepositoryProveedor repoProveedor;

        public ProductosController(RepositoryProducto repoProducto, RepositoryProveedor repoProveedor)
        {
            this.repoProducto = repoProducto;
            this.repoProveedor = repoProveedor;
        }
        public async Task<IActionResult> Index()
        {
            List<Producto> productos = await this.repoProducto.GetProductosAsync();
            return View(productos);
        }

        public async Task<IActionResult> Create()
        {
            var proveedores = await this.repoProveedor.GetProveedoresAsync();
            ViewBag.Proveedores = new SelectList(proveedores, "IdProveedor", "Nombre");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Producto p, IFormFile imagen)
        {
            if (imagen != null && imagen.Length > 0)
            {
                var fileName = Path.GetFileName(imagen.FileName);
                var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "imagenes");
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var filePath = Path.Combine(directoryPath, fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await imagen.CopyToAsync(stream);
                }
                p.Imagen = fileName;
            }
            await this.repoProducto.InsertProductoAsync(p.Nombre, p.Descripcion, p.Stock, p.Precio, p.Imagen, p.IdProveedor, p.IdTienda);
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Details(int idproducto)
        {
            Producto p = await this.repoProducto.FindProductoAsync(idproducto);
            return View(p);
        }
    }
}
