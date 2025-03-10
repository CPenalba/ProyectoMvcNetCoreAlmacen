using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("AlertaStock")]
    public class AlertaStock
    {
        [Key]
        [Column("Id")]
        public int IdAlertaStock { get; set; }
        [Column("IdProducto")]
        public int IdProducto { get; set; }
        [Column("IdTienda")]
        public int IdTienda { get; set; }
        [Column("FechaAlerta")]
        public DateTime FechaAlerta { get; set; }
        [Column("Descripcion")]
        public string Descripcion { get; set; }
        [Column("Estado")]
        public string Estado { get; set; }
    }
}
