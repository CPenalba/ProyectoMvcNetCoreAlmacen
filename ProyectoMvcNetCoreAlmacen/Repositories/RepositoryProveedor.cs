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
    }
}
