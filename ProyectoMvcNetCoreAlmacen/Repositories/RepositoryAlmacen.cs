using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using NugetProyectoAlmacen.Models;
using System.Net.Http.Headers;

namespace ProyectoMvcNetCoreAlmacen.Repositories
{
    public class RepositoryAlmacen
    {
        private AlmacenContext context;
        private string ApiUrl;

        private MediaTypeWithQualityHeaderValue Header;

        public RepositoryAlmacen(AlmacenContext context, IConfiguration configuration)
        {
            this.context = context;
            this.ApiUrl = configuration.GetValue<string>("ApiUrls:ApiAlmacen");
            this.Header = new MediaTypeWithQualityHeaderValue("application/json");
        }

        private async Task<T> CallApiAsync<T>(string request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.ApiUrl);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                HttpResponseMessage response = await client.GetAsync(request);
                if (response.IsSuccessStatusCode)
                {
                    T data = await response.Content.ReadAsAsync<T>();
                    return data;
                }
                else
                {
                    return default(T);
                }
            }
        }

        private async Task<bool> PostApiAsync<T>(string request, T data)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.ApiUrl);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                HttpResponseMessage response = await client.PostAsJsonAsync(request, data);
                return response.IsSuccessStatusCode;
            }
        }

        private async Task<bool> PutApiAsync<T>(string request, T data)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.ApiUrl);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                HttpResponseMessage response = await client.PutAsJsonAsync(request, data);
                return response.IsSuccessStatusCode;
            }
        }

        private async Task<bool> PutApiAsync2<T>(string request, T data = null) where T : class
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.ApiUrl);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);

                HttpResponseMessage response = data == null
                    ? await client.PutAsync(request, null)
                    : await client.PutAsJsonAsync(request, data);

                return response.IsSuccessStatusCode;
            }
        }

        private async Task<bool> DeleteApiAsync(string request)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri(this.ApiUrl);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(this.Header);
                HttpResponseMessage response = await client.DeleteAsync(request);
                return response.IsSuccessStatusCode;
            }
        }

        public async Task<List<AlertaStock>> GetAlertasStocksAsync(int idTienda)
        {
            return await CallApiAsync<List<AlertaStock>>($"/api/AlertasStocks/GetAlertasStocksBy/{idTienda}");
        }

        public async Task<AlertaStock> FindAlertaAsync(int idAlerta)
        {
            return await CallApiAsync<AlertaStock>($"/api/AlertasStocks/FindAlertaBy/{idAlerta}");
        }

        public async Task<Producto> GetProductoByIdAsync(int idProducto)
        {
            return await CallApiAsync<Producto>($"/api/AlertasStocks/GetProductoBy/{idProducto}");
        }

        public async Task InsertAlertaAsync(AlertaStock alerta)
        {
            await PostApiAsync("/api/AlertasStocks", alerta);
        }

        public async Task UpdateAlertaAsync(AlertaStock alerta)
        {
            await PutApiAsync("/api/AlertasStocks", alerta);
        }

        public async Task DeleteAlertaAsync(int idAlertaStock)
        {
            await DeleteApiAsync($"/api/AlertasStocks/{idAlertaStock}");
        }

        public async Task<List<DetalleVenta>> GetDetallesVentasAsync(int idTienda)
        {
            return await CallApiAsync<List<DetalleVenta>>($"/api/DetallesVentas/GetDetallesVentas/{idTienda}");
        }

        public async Task InsertVentaAsync(DetalleVenta venta)
        {
            await PostApiAsync("/api/DetallesVentas", venta);
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
            return await CallApiAsync<List<int>>($"/api/DetallesVentas/GetAniosVentas/{tiendaId}");
        }

        public async Task<Dictionary<string, int>> GetVentasPorMesAsync(int tiendaId, int año)
        {
            return await CallApiAsync<Dictionary<string, int>>($"/api/DetallesVentas/GetVentasPorAnio{tiendaId}/{año}");
        }

        public async Task<List<Producto>> GetProductosMasVendidosAsync(int tiendaId)
        {
            return await CallApiAsync<List<Producto>>($"/api/DetallesVentas/GetProductosMasVendidos/{tiendaId}");
        }

        public async Task<List<Pedido>> GetPedidosAsync(int idTienda)
        {
            return await CallApiAsync<List<Pedido>>($"/api/Pedidos/GetPedidosBy/{idTienda}");
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
            await PutApiAsync<string>($"/api/Pedidos/UpdateEstadoPedido/{idPedido}/{nuevoEstado}", nuevoEstado);
        }


        public async Task<List<Producto>> GetProductosAsync(int idTienda)
        {
            return await CallApiAsync<List<Producto>>($"/api/Productos/GetProductosBy/{idTienda}");
        }

        public async Task<Producto> FindProductoAsync(int idProducto)
        {
            return await CallApiAsync<Producto>($"/api/Productos/FindProductoBy/{idProducto}");
        }

        public async Task<List<Producto>> GetProductosByIdAsync(int idProducto, int idTienda)
        {
            return await CallApiAsync<List<Producto>>($"/api/Productos/SearchProductosBy/{idProducto}/{idTienda}");
        }

        public async Task<List<Producto>> GetProductosByMarcaAsync(string marca, int idTienda)
        {
            return await CallApiAsync<List<Producto>>($"/api/Productos/GetProductosByMarca/{marca}/{idTienda}");
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

        public async Task UpdateProductoAsync(Producto producto)
        {
            this.context.Productos.Update(producto);
            await this.context.SaveChangesAsync();
        }

        public async Task UpdateProductoStockAsync(int idProducto, int nuevoStock)
        {
            await PutApiAsync<int>($"/api/Productos/UpdateStock/{idProducto}/{nuevoStock}", nuevoStock);
        }

        public async Task<List<Proveedor>> GetProveedoresAsync()
        {
            return await CallApiAsync<List<Proveedor>>("/api/Proveedores/GetProveedores");
        }

        public async Task<Proveedor> FindProveedorAsync(int idProveedor)
        {
            return await CallApiAsync<Proveedor>($"/api/Proveedores/GetProveedorById/{idProveedor}");
        }

        public async Task InsertProveedorAsync(Proveedor proveedor)
        {
            await PostApiAsync("/api/Proveedores", proveedor);
        }

        public async Task UpdateProveedorAsync(Proveedor proveedor)
        {
            await PutApiAsync("/api/Proveedores", proveedor);
        }

        public async Task<Tienda> GetTiendaByIdAsync(int tiendaId)
        {
            return await CallApiAsync<Tienda>($"/api/Tiendas/GetTiendaById/{tiendaId}");
        }

        public async Task<Tienda> LoginAsync(string correo, string contraseña)
        {
            // Primero obtener la tienda por correo para verificar si existe
            var tienda = await CallApiAsync<Tienda>($"/api/Tiendas/GetTiendaByCorreo/{correo}");
            if (tienda == null)
            {
                return null; // No existe tienda con ese correo
            }

            // Verificar contraseña localmente (como lo hacías antes)
            if (BCrypt.Net.BCrypt.Verify(contraseña, tienda.Contraseña))
            {
                return tienda;
            }
            return null;
        }

       

        public string HashPwd(string contraseña)
        {
            return BCrypt.Net.BCrypt.HashPassword(contraseña);
        }


        public async Task InsertTiendaAsync(Tienda tienda)
        {
            await PostApiAsync("/api/Tiendas/insertar", tienda);
        }

        public async Task<List<Usuario>> GetUsuariosAsync(int idTienda)
        {
            return await CallApiAsync<List<Usuario>>($"/api/Usuarios/GetUsuariosBy/{idTienda}");
        }

        public async Task<Usuario> GetUsuarioByIdAsync(int idUsuario)
        {
            return await CallApiAsync<Usuario>($"/api/Usuarios/GetUsuarioBy/{idUsuario}");
        }
        public async Task<bool> CambiarContraseñaAsync(int idUsuario, string nuevaContraseña)
        {
            var usuario = await this.GetUsuarioByIdAsync(idUsuario);
            if (usuario == null)
                return false;
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

        public async Task InsertUsuarioAsync(int id, string nombre, string imagen, string correo, string contraseña, string rol, int idTienda)
        {
            Usuario u = new Usuario();
            u.IdUsuario = id;
            u.Nombre = nombre;
            u.Imagen = imagen;
            u.Correo = correo;
            u.Contraseña = BCrypt.Net.BCrypt.HashPassword(contraseña);
            u.Rol = rol;
            u.IdTienda = idTienda;
            await this.context.Usuarios.AddAsync(u);
            await this.context.SaveChangesAsync();
        }
    }
}
