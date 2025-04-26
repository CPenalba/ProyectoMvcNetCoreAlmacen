using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class ProductosController : Controller
    {

        private RepositoryAlmacen repo;

        public ProductosController(RepositoryAlmacen repo)
        {
            this.repo = repo;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            List<Producto> productos = await this.repo.GetProductosAsync((int)tiendaId);
            return View(productos);
        }

        [HttpPost]
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
                productos = await this.repo.GetProductosByIdAsync(idProducto, (int)tiendaId);
            }
            else if (!string.IsNullOrEmpty(marca))
            {
                productos = await this.repo.GetProductosByMarcaAsync(marca, (int)tiendaId);
            }
            else
            {
                productos = await this.repo.GetProductosAsync((int)tiendaId);
            }

            return View(productos);
        }

        [HttpGet]
        public async Task<IActionResult> BuscarProductos(string? idproducto, string? marca)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }

            List<Producto> productos;

            if (!string.IsNullOrEmpty(idproducto) && int.TryParse(idproducto, out int idProducto))
            {
                productos = await this.repo.GetProductosByIdAsync(idProducto, (int)tiendaId);
            }
            else if (!string.IsNullOrEmpty(marca))
            {
                productos = await this.repo.GetProductosByMarcaAsync(marca, (int)tiendaId);
            }
            else
            {
                productos = await this.repo.GetProductosAsync((int)tiendaId);
            }

            return PartialView("_ProductosPartial", productos);
        }


        public async Task<IActionResult> Create()
        {
            var proveedores = await this.repo.GetProveedoresAsync();
            ViewBag.Proveedores = new SelectList(proveedores, "IdProveedor", "Nombre");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Producto p, IFormFile imagen)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            p.IdTienda = tiendaId.Value;
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
            await this.repo.InsertProductoAsync(p.IdProducto, p.Nombre, p.Descripcion, p.Stock, p.Precio, p.Imagen, p.Marca, p.Modelo, p.IdProveedor, p.IdTienda);
            return RedirectToAction("Index");
        }


        public async Task<IActionResult> Details(int idproducto)
        {
            Producto p = await this.repo.FindProductoAsync(idproducto);
            return View(p);
        }

        [HttpPost]
        public async Task<IActionResult> ActualizarStock(int idproducto, int cantidad, bool sumar)
        {
            var producto = await repo.FindProductoAsync(idproducto);
            if (producto == null)
            {
                return NotFound();
            }

            if (sumar)
            {
                producto.Stock += cantidad;
            }
            else
            {
                producto.Stock = Math.Max(0, producto.Stock - cantidad); 
            }

            await repo.UpdateProductoStockAsync(producto.IdProducto, producto.Stock);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> CambiarEstado(int idproducto)
        {
            var producto = await repo.FindProductoAsync(idproducto);
            if (producto == null)
            {
                return NotFound();
            }
            producto.Estado = !producto.Estado;
            await repo.UpdateProductoAsync(producto);
            return Json(new { success = true, nuevoEstado = producto.Estado });
        }

        public async Task<IActionResult> Edit(int idproducto)
        {
            Producto p = await this.repo.FindProductoAsync(idproducto);
            var proveedores = await this.repo.GetProveedoresAsync();
            ViewBag.Proveedores = new SelectList(proveedores, "IdProveedor", "Nombre");
            if (p == null)
            {
                return NotFound();
            }
            return View(p);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Producto p, IFormFile imagen)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            p.IdTienda = tiendaId.Value;
            if (imagen != null && imagen.Length > 0)
            {
                var fileName = Path.GetFileName(imagen.FileName);
                var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "imagenes");

                var filePath = Path.Combine(directoryPath, fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await imagen.CopyToAsync(stream);
                }
                p.Imagen = fileName;
            }

            await this.repo.UpdateProductoAsync(p);
            return RedirectToAction("Index");
        }
    }
}
