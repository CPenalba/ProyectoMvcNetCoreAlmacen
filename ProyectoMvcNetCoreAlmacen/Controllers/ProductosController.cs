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

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");
            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            List<Producto> productos = await this.repoProducto.GetProductosAsync((int)tiendaId);
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
                productos = await this.repoProducto.GetProductosByIdAsync(idProducto, (int)tiendaId);
            }
            else if (!string.IsNullOrEmpty(marca))
            {
                productos = await this.repoProducto.GetProductosByMarcaAsync(marca, (int)tiendaId);
            }
            else
            {
                productos = await this.repoProducto.GetProductosAsync((int)tiendaId);
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
                productos = await this.repoProducto.GetProductosByIdAsync(idProducto, (int)tiendaId);
            }
            else if (!string.IsNullOrEmpty(marca))
            {
                productos = await this.repoProducto.GetProductosByMarcaAsync(marca, (int)tiendaId);
            }
            else
            {
                productos = await this.repoProducto.GetProductosAsync((int)tiendaId);
            }

            return PartialView("_ProductosPartial", productos);
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

        [HttpPost]
        public async Task<IActionResult> ActualizarStock(int idproducto, int cantidad, bool sumar)
        {
            var producto = await repoProducto.FindProductoAsync(idproducto);
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
                producto.Stock = Math.Max(0, producto.Stock - cantidad); // Evita stock negativo
            }

            await repoProducto.UpdateProductoStockAsync(producto.IdProducto, producto.Stock);
            return RedirectToAction("Index");
        }

        [HttpPost]
public async Task<IActionResult> CambiarEstado(int idproducto)
{
    var producto = await repoProducto.FindProductoAsync(idproducto);
    if (producto == null)
    {
        return NotFound();
    }

    // Cambiar el estado del producto a 'false'
    producto.Estado = false;

    // Actualizar el producto en la base de datos
    await repoProducto.UpdateProductoAsync(producto);

    return Json(new { success = true });
}

        public async Task<IActionResult> Edit(int idproducto)
        {
            Producto p = await this.repoProducto.FindProductoAsync(idproducto);
            var proveedores = await this.repoProveedor.GetProveedoresAsync();
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
            // Asignar el IdTienda al producto
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

            await this.repoProducto.UpdateProductoAsync(p);
            return RedirectToAction("Index");
        }
    }
}
