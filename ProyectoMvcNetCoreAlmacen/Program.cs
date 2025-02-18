using Microsoft.EntityFrameworkCore;
using ProyectoMvcNetCoreAlmacen.Data;
using ProyectoMvcNetCoreAlmacen.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddTransient<RepositoryProducto>();
builder.Services.AddTransient<RepositoryTienda>();
builder.Services.AddTransient<RepositoryProveedor>();
builder.Services.AddTransient<RepositoryUsuario>();
builder.Services.AddTransient<RepositoryDetalleVenta>();
builder.Services.AddTransient<RepositoryAlertaStock>();
string connectionString = builder.Configuration.GetConnectionString("SqlAlmacen");
builder.Services.AddDbContext<AlmacenContext>(options => options.UseSqlServer(connectionString));

builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Ajusta según tu necesidad
    options.Cookie.IsEssential = true;
});


var app = builder.Build();

app.UseSession();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseRouting();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "login",
    pattern: "{controller=Tiendas}/{action=Login}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Tiendas}/{action=Index}/{id?}");


app.Run();
