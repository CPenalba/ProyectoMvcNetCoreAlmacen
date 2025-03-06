using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("Pedido")]

    public class Pedido
    {
        [Key]
        [Column("Id")]
        public int IdPedido { get; set; }
        [Column("IdProveedor")]
        public int IdProveedor { get; set; }
        [Column("IdTienda")]
        public int IdTienda { get; set; }
        [Column("IdProducto")]
        public int IdProducto { get; set; }
        [Column("FechaPedido")]
        public DateTime FechaPedido { get; set; }
        [Column("FechaEntrega")]
        public DateTime FechaEntrega { get; set; }
        [Column("Estado")]
        public string Estado { get; set; }
        [Column("Cantidad")]
        public int Cantidad { get; set; }
        [Column("Precio")]
        public decimal Precio { get; set; }
        [Column("PrecioTotalPedido")]
        public decimal PrecioTotalPedido { get; set; }
    }
}
