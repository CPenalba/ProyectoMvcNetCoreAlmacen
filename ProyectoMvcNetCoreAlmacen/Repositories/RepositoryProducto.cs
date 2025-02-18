using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;
using System.Data;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryProducto
    {
        private AlmacenContext context;

        public RepositoryProducto(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<Producto>> GetProductosAsync()
        {

            return await this.context.Productos
                             .Include(p => p.Proveedor) 
                             .Include(p => p.Tienda)    
                             .ToListAsync();
        }

        public async Task InsertProductoAsync(string nombre, string descripcion, int stock, decimal precio, string imagen, int idProveedor, int idTienda)
        {
            Producto p = new Producto();
            p.Nombre = nombre;
            p.Descripcion = descripcion;
            p.Stock = stock;
            p.Precio = precio;
            p.Imagen = imagen;
            p.IdProveedor = idProveedor;
            p.IdTienda = idTienda;
            await this.context.Productos.AddAsync(p);
            await this.context.SaveChangesAsync();
        }
    }
    
}
