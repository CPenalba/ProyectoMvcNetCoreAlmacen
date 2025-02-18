using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryAlertaStock
    {
        private AlmacenContext context;

        public RepositoryAlertaStock(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<AlertaStock>> GetAlertasStocksAsync()
        {
            var consulta = from datos in this.context.AlertasStocks select datos;
            return await consulta.ToListAsync();
        }
    }
}
