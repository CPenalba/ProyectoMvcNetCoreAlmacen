using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("Producto")]
    public class Producto
    {
        [Key]
        [Column("Id")]
        public int IdProducto { get; set; }
        [Column("Nombre")]
        public string Nombre { get; set; }
        [Column("Descripcion")]
        public string Descripcion { get; set; }
        [Column("Stock")]
        public int Stock { get; set; }
        [Column("Precio")]
        public decimal Precio { get; set; }
        [Column("Imagen")]
        public string? Imagen { get; set; }
        [Column("Marca")]
        public string Marca { get; set; }
        [Column("Modelo")]
        public string Modelo { get; set; }
        [Column("IdProveedor")]
        public int IdProveedor { get; set; }
        [Column("IdTienda")]
        public int IdTienda { get; set; }
        [Column("Estado")]
        public bool Estado { get; set; } = true;
        [ForeignKey("IdProveedor")]
        public Proveedor Proveedor { get; set; }
        [ForeignKey("IdTienda")]
        public Tienda Tienda { get; set; }
    }
}
