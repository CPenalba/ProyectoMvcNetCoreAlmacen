using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using NugetProyectoAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class UsuariosController : Controller
    {
        private RepositoryAlmacen repo;

        public UsuariosController(RepositoryAlmacen repo)
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
            List<Usuario> usuarios = await this.repo.GetUsuariosAsync((int)tiendaId);
            return View(usuarios);
        }

        [HttpGet]
        public async Task<IActionResult> CambiarContraseña(int id)
        {
            var usuario = await this.repo.GetUsuarioByIdAsync(id);
            if (usuario == null)
            {
                return NotFound();
            }

            return View(usuario); 
        }

        [HttpPost]
        public async Task<IActionResult> CambiarContraseña(int id, string nuevaContraseña, string confirmPassword)
        {
            try
            {
                if (string.IsNullOrEmpty(nuevaContraseña) || string.IsNullOrEmpty(confirmPassword))
                {
                    return Json(new { success = false, message = "Las contraseñas no pueden estar vacías" });
                }

                if (nuevaContraseña != confirmPassword)
                {
                    return Json(new { success = false, message = "Las contraseñas no coinciden" });
                }
                if (nuevaContraseña.Length < 8)
                {
                    return Json(new { success = false, message = "La contraseña debe tener al menos 8 caracteres" });
                }

                bool resultado = await this.repo.CambiarContraseñaAsync(id, nuevaContraseña);

                if (!resultado)
                {
                    return Json(new { success = false, message = "No se pudo actualizar la contraseña" });
                }

                return Json(new
                {
                    success = true,
                    message = "Contraseña actualizada correctamente",
                    redirectUrl = Url.Action("Index", "Tiendas")
                });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = $"Error: {ex.Message}" });
            }
        }

        public async Task<IActionResult> Create()
        {
            ViewBag.CodigoJefe = ""; 
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Usuario u, IFormFile imagen, string codigoJefe)
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            if (tiendaId == null)
            {
                return RedirectToAction("Login", "Tiendas");
            }
            u.IdTienda = tiendaId.Value;
            u.Rol = (codigoJefe == "1234") ? "Jefe" : "Trabajador";
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
                u.Imagen = fileName;
            }
            await this.repo.InsertUsuarioAsync(u.IdUsuario, u.Nombre, u.Imagen, u.Correo, u.Contraseña, u.Rol, u.IdTienda);
            return RedirectToAction("Index", "Tiendas");
        }
    }
}

