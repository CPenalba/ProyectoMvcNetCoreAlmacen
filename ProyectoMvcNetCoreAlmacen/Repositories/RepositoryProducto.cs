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

        public async Task<List<Producto>> GetProductosAsync(int idTienda)
        {
            return await this.context.Productos
                         .Where(p => p.IdTienda == idTienda) 
                         .Include(p => p.Proveedor)
                         .Include(p => p.Tienda)
                         .ToListAsync();
        }

        public async Task InsertProductoAsync(int idProducto, string nombre, string descripcion, int stock, decimal precio, string? imagen, string marca, string modelo, int idProveedor, int idTienda)
        {
            Producto p = new Producto();
            p.IdProducto = idProducto;
            p.Nombre = nombre;
            p.Descripcion = descripcion;
            p.Stock = stock;
            p.Precio = precio;
            p.Imagen = imagen;
            p.Marca = marca;
            p.Modelo = modelo;
            p.IdProveedor = idProveedor;
            p.IdTienda = idTienda;
            await this.context.Productos.AddAsync(p);
            await this.context.SaveChangesAsync();
        }

        public async Task<Producto> FindProductoAsync(int idProducto)
        {
            return await this.context.Productos
                             .Include(p => p.Proveedor)
                             .FirstOrDefaultAsync(p => p.IdProducto == idProducto);
        }

        public async Task<List<Producto>> GetProductosByIdAsync(int idProducto, int idTienda)
        {
            return await this.context.Productos
                         .Where(p => p.IdProducto.ToString().StartsWith(idProducto.ToString()) && p.IdTienda == idTienda)
                         .Include(p => p.Proveedor)
                         .Include(p => p.Tienda)
                         .ToListAsync();
        }

        public async Task<List<Producto>> GetProductosByMarcaAsync(string marca, int idTienda)
        {
            return await this.context.Productos
                         .Where(p => p.Marca.StartsWith(marca) && p.IdTienda == idTienda)
                         .Include(p => p.Proveedor)
                         .Include(p => p.Tienda)
                         .ToListAsync();
        }
    }
}
