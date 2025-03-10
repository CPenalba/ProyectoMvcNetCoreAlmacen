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
        public async Task<IActionResult> Index(string? idproducto, string? marca)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }

            List<Producto> productos;

            if (!string.IsNullOrEmpty(idproducto) && int.TryParse(idproducto, out int idProducto))
            {
                productos = await this.repoProducto.GetProductosByIdAsync(idProducto);
            }
            else if (!string.IsNullOrEmpty(marca))
            {
                productos = await this.repoProducto.GetProductosByMarcaAsync(marca);
            }
            else
            {
                productos = await this.repoProducto.GetProductosAsync((int)tiendaId);
            }

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
            // Obtener el IdTienda desde la sesión del usuario (esto depende de cómo esté configurada tu autenticación)
            // Aquí se supone que el IdTienda se guarda en la sesión.
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            // Asignar el IdTienda al producto
            p.IdTienda = tiendaId.Value;

            // Procesar la imagen si existe
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

            // Insertar el producto en la base de datos
            await this.repoProducto.InsertProductoAsync(p.IdProducto, p.Nombre, p.Descripcion, p.Stock, p.Precio, p.Imagen, p.Marca, p.Modelo, p.IdProveedor, p.IdTienda);

            return RedirectToAction("Index");
        }


        public async Task<IActionResult> Details(int idproducto)
        {
            Producto p = await this.repoProducto.FindProductoAsync(idproducto);
            return View(p);
        }
    }
}
