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
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            Tienda tienda = null;

            if (tiendaId != null)
            {
                // Si hay un TiendaId, buscar la tienda en la base de datos
                tienda = await this.repoTienda.GetTiendaByIdAsync((int)tiendaId);
            }

            // Si no hay tienda logueada, redirigir a Login
            if (tienda == null)
            {
                return RedirectToAction("Login");
            }

            // Si hay una tienda logueada, pasar la tienda a la vista
            ViewData["Tienda"] = tienda;
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string correo, string contraseña)
        {
            Tienda tienda = await this.repoTienda.LoginAsync(correo, contraseña);
            if (tienda != null)
            {
                HttpContext.Session.SetInt32("TiendaId", tienda.IdTienda);

                ViewBag.Message = "Has iniciado sesión correctamente.";
                return RedirectToAction("Index"); // Redirige a la vista de Index con la tienda
            }
            else
            {
                ViewBag.Message = "Correo o contraseña incorrectos.";
                return View();
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Remove("TiendaId"); // Elimina el IdTienda de la sesión
            return RedirectToAction("Login");
        }


    }
}
