using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryPedido
    {
        private AlmacenContext context;

        public RepositoryPedido(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<Pedido>> GetPedidosAsync(int idTienda)
        {
            return await this.context.Pedidos
                         .Where(p => p.IdTienda == idTienda)
                         .Include(p => p.Proveedor)
                         .Include(p => p.Producto)
                         .ToListAsync();
        }

        public async Task InsertPedidoAsync(int idPedido, int idProveedor, int idTienda, int idProducto, DateTime fechaPedido, DateTime fechaEntrega, string estado, int cantidad, decimal precio, decimal precioTotalPedido)
        {
            Pedido p = new Pedido();
            p.IdPedido = idPedido;
            p.IdProveedor = idProveedor;
            p.IdTienda = idTienda;
            p.IdProducto = idProducto;
            p.FechaPedido = fechaPedido;
            p.FechaEntrega = fechaEntrega;
            p.Estado = estado;
            p.Cantidad = cantidad;
            p.Precio = precio;
            p.PrecioTotalPedido = precioTotalPedido;
            await this.context.Pedidos.AddAsync(p);
            await this.context.SaveChangesAsync();
        }

        public async Task UpdateEstadoPedidoAsync(int idPedido, string nuevoEstado)
        {
            var pedido = await this.context.Pedidos.FindAsync(idPedido);
            if (pedido != null)
            {
                pedido.Estado = nuevoEstado;
                await this.context.SaveChangesAsync();
            }
        }
    }
}
