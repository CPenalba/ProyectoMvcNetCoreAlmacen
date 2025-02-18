using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;
using Microsoft.EntityFrameworkCore;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryTienda
    {
        private AlmacenContext context;

        public RepositoryTienda(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<Tienda>> GetTiendasAsync()
        {
            var consulta = from datos in this.context.Tiendas select datos;
            return await consulta.ToListAsync();
        }

        public async Task<Tienda> LoginAsync(string correo, string contraseña)
        {
            return await this.context.Tiendas
                .FirstOrDefaultAsync(t => t.Correo == correo && t.Contraseña == contraseña);
        }

        public async Task<Tienda> GetTiendaByIdAsync(int tiendaId)
        {
            return await this.context.Tiendas
                .FirstOrDefaultAsync(t => t.IdTienda == tiendaId);
        }
    }
}
