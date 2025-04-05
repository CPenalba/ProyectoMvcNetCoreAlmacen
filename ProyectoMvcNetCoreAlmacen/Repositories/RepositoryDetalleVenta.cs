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

        public async Task<List<int>> GetAñosVentasAsync(int tiendaId)
        {
            return await context.DetallesVentas
                .Where(v => v.IdTienda == tiendaId)
                .Select(v => v.Fecha.Year)
                .Distinct()
                .OrderByDescending(y => y)
                .ToListAsync();
        }

        public async Task<Dictionary<string, int>> GetVentasPorMesAsync(int tiendaId, int año)
        {
            var ventasPorMes = await context.DetallesVentas
                .Where(v => v.IdTienda == tiendaId && v.Fecha.Year == año)
                .GroupBy(v => new { v.Fecha.Month })
                .Select(g => new
                {
                    Mes = g.Key.Month,
                    TotalVentas = g.Sum(v => v.Cantidad)
                })
                .OrderBy(x => x.Mes)
                .ToListAsync();

            var meses = new[] { "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic" };

            var resultado = new Dictionary<string, int>();
            foreach (var item in ventasPorMes)
            {
                resultado[meses[item.Mes - 1]] = item.TotalVentas;
            }

            // Rellenar meses sin ventas con 0
            for (int i = 1; i <= 12; i++)
            {
                var nombreMes = meses[i - 1];
                if (!resultado.ContainsKey(nombreMes))
                {
                    resultado[nombreMes] = 0;
                }
            }

            return resultado.OrderBy(x => Array.IndexOf(meses, x.Key)).ToDictionary(x => x.Key, x => x.Value);
        }

        public async Task<List<Producto>> GetProductosMasVendidosAsync(int tiendaId, int top = 4)
        {
            return await context.DetallesVentas
                .Where(v => v.IdTienda == tiendaId)
                .GroupBy(v => v.IdProducto)
                .OrderByDescending(g => g.Sum(v => v.Cantidad))
                .Take(top)
                .Select(g => g.FirstOrDefault().Producto)
                .ToListAsync();
        }
    }
}
