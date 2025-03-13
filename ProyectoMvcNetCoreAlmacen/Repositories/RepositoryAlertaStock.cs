using Humanizer.DateTimeHumanizeStrategy;
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

        public async Task<List<AlertaStock>> GetAlertasStocksAsync(int idTienda)
        {
            return await this.context.AlertasStocks
                         .Where(p => p.IdTienda == idTienda)
                         .ToListAsync();
        }

        public async Task<AlertaStock> FindAlertaAsync(int idAlerta)
        {
            var consulta = from datos in this.context.AlertasStocks where datos.IdAlertaStock == idAlerta select datos;
            return await consulta.FirstOrDefaultAsync();
        }

        public async Task InsertAlertaAsync(int idAlerta, int idProducto, int idTienda, DateTime fechaAlerta, string descripcion, string estado)
        {
            int maxId = (await this.context.AlertasStocks.MaxAsync(t => (int?)t.IdAlertaStock) ?? 0) + 1;
            AlertaStock a = new AlertaStock();
            a.IdAlertaStock = maxId;
            a.IdProducto = idProducto;
            a.IdTienda = idTienda;
            a.FechaAlerta = fechaAlerta;
            a.Descripcion = descripcion;
            a.Estado = estado;
            await this.context.AlertasStocks.AddAsync(a);
            await this.context.SaveChangesAsync();
        }

        public async Task UpdateAlertaAsync(int idAlertaStock, int idProducto, int idTienda, DateTime fechaAlerta, string descripcion, string estado)
        {
            AlertaStock a = await this.FindAlertaAsync(idAlertaStock);
            a.IdAlertaStock = idAlertaStock;
            a.IdProducto = idProducto;
            a.IdTienda = idTienda;
            a.FechaAlerta = fechaAlerta;
            a.Descripcion = descripcion;
            a.Estado = estado;
            await this.context.SaveChangesAsync();
        }

        public async Task DeleteAlertaAsync(int idAlertaStock)
        {
            AlertaStock a = await this.FindAlertaAsync(idAlertaStock);
            this.context.AlertasStocks.Remove(a);
            await this.context.SaveChangesAsync();
        }

        public async Task<Producto> GetProductoByIdAsync(int idProducto)
        {
            return await this.context.Productos
                                     .Where(p => p.IdProducto == idProducto)
                                     .FirstOrDefaultAsync();
        }

    }
}
