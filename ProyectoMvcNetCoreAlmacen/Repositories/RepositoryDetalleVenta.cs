using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryDetalleVenta
    {
        private AlmacenContext context;

        public RepositoryDetalleVenta(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<DetalleVenta>> GetDetallesVentasAsync()
        {
            var consulta = from datos in this.context.DetallesVentas select datos;
            return await consulta.ToListAsync();
        }
    }
}
