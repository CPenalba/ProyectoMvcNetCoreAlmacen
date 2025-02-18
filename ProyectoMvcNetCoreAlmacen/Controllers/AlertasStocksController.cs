using Microsoft.AspNetCore.Mvc;
using ProyectoMvcNetCoreAlmacen.Models;
using ProyectoMvcNetCoreAlmacen.Repositories;

namespace ProyectoMvcNetCoreAlmacen.Controllers
{
    public class AlertasStocksController : Controller
    {
        private RepositoryAlertaStock repo;

        public AlertasStocksController(RepositoryAlertaStock repo)
        {
            this.repo = repo;
        }
        public async Task<IActionResult> Index()
        {
            List<AlertaStock> alertas = await this.repo.GetAlertasStocksAsync();
            return View(alertas);
        }
    }
}
