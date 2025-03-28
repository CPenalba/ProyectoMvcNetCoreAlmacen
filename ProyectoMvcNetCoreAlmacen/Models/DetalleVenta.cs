using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("DetalleVenta")]
    public class DetalleVenta
    {
        [Key]
        [Column("Id")]
        public int IdDetalleVenta { get; set; }
        [Column("Fecha")]
        public DateTime Fecha { get; set; }
        [Column("IdProducto")]
        public int IdProducto { get; set; }
        [Column("IdTienda")]
        public int IdTienda { get; set; }
        [Column("Cantidad")]
        public int Cantidad { get; set; }
        [Column("Precio")]
        public decimal Precio { get; set; }
        [Column("PrecioTotalVenta")]
        public decimal PrecioTotalVenta { get; set; }
        [ForeignKey("IdProducto")]
        public Producto Producto { get; set; }
    }
}
