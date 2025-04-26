using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class TiendasController : Controller
    {
        private RepositoryAlmacen repo; 

        public TiendasController(RepositoryAlmacen repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            var tiendaId = HttpContext.Session.GetInt32("TiendaId");

            Tienda tienda = null;

            if (tiendaId != null)
            {
                tienda = await this.repo.GetTiendaByIdAsync((int)tiendaId);
            }
            if (tienda == null)
            {
                return RedirectToAction("Login");
            }
            ViewData["Tienda"] = tienda;
            List<Usuario> usuarios = await this.repo.GetUsuariosAsync((int)tiendaId);
            return View(usuarios);
        }

        [HttpPost]
        public IActionResult VerificarCodigoJefe(string codigoJefe)
        {
            if (codigoJefe == "1234") 
            {
                HttpContext.Session.SetString("TienePermisos", "true");
            }
            return RedirectToAction("Index"); 
        }


        [HttpPost]
        public async Task<IActionResult> CambiarEstado(int idusuario)
        {
            
            var usuario = await this.repo.GetUsuarioByIdAsync(idusuario);

            if (usuario == null)
            {
                return NotFound();
            }

            usuario.Estado = !usuario.Estado;

            await this.repo.UpdateUsuarioAsync(usuario);

            return Json(new { success = true, nuevoEstado = usuario.Estado });

        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string correo, string contraseña)
        {
            Tienda tienda = await this.repo.LoginAsync(correo, contraseña);
            if (tienda != null)
            {
                HttpContext.Session.SetInt32("TiendaId", tienda.IdTienda);
                HttpContext.Session.SetString("TienePermisos", "false");
                ViewBag.Message = "Has iniciado sesión correctamente.";
                return RedirectToAction("Index"); 
            }
            else
            {
                ViewBag.Message = "Correo o contraseña incorrectos.";
                return View();
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Remove("TiendaId"); 
            return RedirectToAction("Login");
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Tienda t)
        {
            await this.repo.InsertTiendaAsync(t.Nombre, t.Direccion, t.Correo, t.Contraseña);
            return Json(new { success = true, message = "¡Te has registrado correctamente!", redirectUrl = Url.Action("Login") });
        }
    }
}
