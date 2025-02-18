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
            var consulta = from datos in this.context.Proveedores select datos;
            return await consulta.ToListAsync();
        }
    }
}
