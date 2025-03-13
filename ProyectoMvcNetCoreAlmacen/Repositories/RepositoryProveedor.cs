using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryProveedor
    {
        private AlmacenContext context;

        public RepositoryProveedor(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<Proveedor>> GetProveedoresAsync()
        {
            return await this.context.Proveedores.ToListAsync();
        }

        public async Task<Proveedor> FindProveedorAsync(int idProveedor)
        {
            return await this.context.Proveedores.FirstOrDefaultAsync(p => p.IdProveedor == idProveedor);
        }

        public async Task InsertProveedorAsync(int idProveedor, string nombre, string telefono, string correo, string direccion)
        {
            int maxId = (await this.context.Proveedores.MaxAsync(p => (int?)p.IdProveedor) ?? 0) + 1;
            Proveedor p = new Proveedor();
            p.IdProveedor = maxId;
            p.Nombre = nombre;
            p.Telefono = telefono;
            p.Correo = correo;
            p.Direccion = direccion;
            await this.context.Proveedores.AddAsync(p);
            await this.context.SaveChangesAsync();
        }

        public async Task UpdateProveedorAsync(Proveedor p)
        {
            this.context.Proveedores.Update(p);
            await this.context.SaveChangesAsync();
        }
    }
}
