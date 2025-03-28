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

        public async Task<List<DetalleVenta>> GetDetallesVentasAsync(int idTienda)
        {
            return await this.context.DetallesVentas
                        .Where(p => p.IdTienda == idTienda)
                         .Include(p => p.Producto)
                        .ToListAsync();
        }

        public async Task InsertVentaAsync(int idVenta, DateTime fecha, int idProducto, int idTienda, int cantidad, decimal precio, decimal precioTotalVenta)
        {
            DetalleVenta v = new DetalleVenta();
            v.IdDetalleVenta = idVenta;
            v.Fecha = fecha;
            v.IdProducto = idProducto;
            v.IdTienda = idTienda;
            v.Cantidad = cantidad;
            v.Precio = precio;
            v.PrecioTotalVenta = precioTotalVenta;
            await this.context.DetallesVentas.AddAsync(v);
            await this.context.SaveChangesAsync();
        }
    }
}
