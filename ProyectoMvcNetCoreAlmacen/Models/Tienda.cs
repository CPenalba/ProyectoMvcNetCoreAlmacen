using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("Tienda")]
    public class Tienda
    {
        [Key]
        [Column("Id")]
        public int IdTienda { get; set; }
        [Column("Nombre")]
        public string Nombre { get; set; }
        [Column("Direccion")]
        public string Direccion { get; set; }
        [Column("Correo")]
        public string Correo { get; set; }
        [Column("Contraseña")]
        public string Contraseña { get; set; }
    }
}
