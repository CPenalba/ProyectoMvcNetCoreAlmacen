using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class UsuariosController : Controller
    {
        private RepositoryUsuario repo;

        public UsuariosController(RepositoryUsuario repo)
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

            return View(usuario); // Aquí puedes pasar solo el ID si no quieres mostrar más datos
        }

        [HttpPost]
        public async Task<IActionResult> CambiarContraseña(int id, string nuevaContraseña, string confirmPassword)
        {
            try
            {
                // Validaciones básicas
                if (string.IsNullOrEmpty(nuevaContraseña) || string.IsNullOrEmpty(confirmPassword))
                {
                    return Json(new { success = false, message = "Las contraseñas no pueden estar vacías" });
                }

                if (nuevaContraseña != confirmPassword)
                {
                    return Json(new { success = false, message = "Las contraseñas no coinciden" });
                }

                // Validar requisitos de contraseña (opcional, ya que el cliente también lo hace)
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
    }
}

