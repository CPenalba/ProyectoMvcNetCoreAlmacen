using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoMvcNetCoreAlmacen.Models
{
    [Table("Usuario")]
    public class Usuario
    {
        [Key]
        [Column("Id")]
        public int IdUsuario { get; set; }
        [Column("Nombre")]
        public string Nombre { get; set; }
        [Column("Imagen")]
        public string? Imagen { get; set; }
        [Column("Correo")]
        public string Correo { get; set; }
        [Column("Contraseña")]
        public string Contraseña { get; set; }
        [Column("Rol")]
        public string Rol { get; set; }
        [Column("Estado")]
        public bool Estado { get; set; } = true;
        [Column("IdTienda")]
        public int IdTienda { get; set; }
        [ForeignKey("IdTienda")]
        public Tienda Tienda { get; set; }
    }
}
