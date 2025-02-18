using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class ProductosController : Controller
    {

        private RepositoryProducto repoProducto;

        public ProductosController(RepositoryProducto repoProducto)
        {
            this.repoProducto = repoProducto;
        }
        public async Task<IActionResult> Index()
        {
            List<Producto> productos = await this.repoProducto.GetProductosAsync();
            return View(productos);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Producto p, IFormFile imagen)
        {
            if (imagen != null && imagen.Length > 0)
            {
                // Generar un nombre único para la imagen
                var fileName = Path.GetFileName(imagen.FileName);

                // Generar la ruta completa para guardar la imagen en wwwroot/imagenes/
                var directoryPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "imagenes");

                // Verificar si la carpeta de imágenes existe, si no existe, crearla
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var filePath = Path.Combine(directoryPath, fileName);

                // Guardar la imagen en el servidor
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await imagen.CopyToAsync(stream);
                }

                // Asignar solo el nombre de la imagen al producto
                p.Imagen = fileName;
            }

            // Insertar el producto en la base de datos con solo el nombre de la imagen
            await this.repoProducto.InsertProductoAsync(p.Nombre, p.Descripcion, p.Stock, p.Precio, p.Imagen, p.IdProveedor, p.IdTienda);

            return RedirectToAction("Index");
        }
    }
}
