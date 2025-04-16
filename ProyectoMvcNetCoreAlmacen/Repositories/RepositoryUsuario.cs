using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Models;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryUsuario
    {
        private AlmacenContext context;

        public RepositoryUsuario(AlmacenContext context)
        {
            this.context = context;
        }

        public async Task<List<Usuario>> GetUsuariosAsync(int idTienda)
        {
            return await this.context.Usuarios.Include(p => p.Tienda).Where(p => p.IdTienda == idTienda).ToListAsync();
        }

        public async Task<Usuario> GetUsuarioByIdAsync(int idUsuario)
        {

            return await this.context.Usuarios
                .Include(u => u.Tienda) // opcional, si necesitas incluir la tienda
                .FirstOrDefaultAsync(u => u.IdUsuario == idUsuario);
        }
        public async Task<bool> CambiarContraseñaAsync(int idUsuario, string nuevaContraseña)
        {
            var usuario = await this.GetUsuarioByIdAsync(idUsuario);
            if (usuario == null)
                return false;

            // Hash de la nueva contraseña
            string hash = BCrypt.Net.BCrypt.HashPassword(nuevaContraseña);
            usuario.Contraseña = hash;

            await context.SaveChangesAsync();
            return true;
        }

        public async Task UpdateUsuarioAsync(Usuario usuario)
        {
            this.context.Usuarios.Update(usuario);
            await this.context.SaveChangesAsync();
        }
    }
}
