using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("Proveedor")]
    public class Proveedor
    {
        [Key]
        [Column("Id")]
        public int IdProveedor { get; set; }
        [Column("Nombre")]
        public string Nombre { get; set; }
        [Column("Telefono")]
        public string Telefono { get; set; }
        [Column("Correo")]
        public string Correo { get; set; }
        [Column("Direccion")]
        public string Direccion { get; set; }
    }
}
