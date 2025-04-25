using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class TiendasController : Controller
    {
        private RepositoryTienda repoTienda; 
        private RepositoryUsuario repoUsuario;

        public TiendasController(RepositoryTienda repoTienda, RepositoryUsuario repoUsuario)
        {
            this.repoTienda = repoTienda;
            this.repoUsuario = repoUsuario;
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
            List<Usuario> usuarios = await this.repoUsuario.GetUsuariosAsync((int)tiendaId);
            return View(usuarios);
        }

        [HttpPost]
        public IActionResult VerificarCodigoJefe(string codigoJefe)
        {
            if (codigoJefe == "1234") // o consulta en base de datos si prefieres
            {
                HttpContext.Session.SetString("TienePermisos", "true");
            }
            return RedirectToAction("Index"); // o donde quieras volver
        }


        [HttpPost]
        public async Task<IActionResult> CambiarEstado(int idusuario)
        {
            
            var usuario = await this.repoUsuario.GetUsuarioByIdAsync(idusuario);

            if (usuario == null)
            {
                return NotFound();
            }

            usuario.Estado = !usuario.Estado;

            await this.repoUsuario.UpdateUsuarioAsync(usuario);

            return Json(new { success = true, nuevoEstado = usuario.Estado });

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
                HttpContext.Session.SetString("TienePermisos", "false");
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

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Tienda t)
        {
            await this.repoTienda.InsertTiendaAsync(t.Nombre, t.Direccion, t.Correo, t.Contraseña);
            return Json(new { success = true, message = "¡Te has registrado correctamente!", redirectUrl = Url.Action("Login") });
        }

    }
}
