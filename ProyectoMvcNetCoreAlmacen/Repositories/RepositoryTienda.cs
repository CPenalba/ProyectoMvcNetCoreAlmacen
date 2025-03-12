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
            return await this.context.Tiendas.FirstOrDefaultAsync(t => t.Correo == correo && t.Contraseña == contraseña);
        }

        public async Task<Tienda> GetTiendaByIdAsync(int tiendaId)
        {
            return await this.context.Tiendas.FirstOrDefaultAsync(t => t.IdTienda == tiendaId);
        }

        public async Task InsertTiendaAsync(string nombre, string direccion, string correo, string contraseña)
        {
            int maxId = (await this.context.Tiendas.MaxAsync(t => (int?)t.IdTienda) ?? 0) + 1;
            Tienda t = new Tienda();
            t.IdTienda = maxId;
            t.Nombre = nombre;
            t.Direccion = direccion;
            t.Correo = correo;
            t.Contraseña = contraseña;
            await this.context.Tiendas.AddAsync(t);
            await this.context.SaveChangesAsync();
        }
    }
}
