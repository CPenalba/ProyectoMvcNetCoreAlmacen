﻿using System.ComponentModel.DataAnnotations;
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
        [Column("Correo")]
        public string Correo { get; set; }
        [Column("Contraseña")]
        public string Contraseña { get; set; }
        [Column("Rol")]
        public string Rol { get; set; }
        [Column("Codigo_Jefe")]
        public int CodigoJefe { get; set; }
        [Column("IdTienda")]
        public int IdTienda { get; set; }
        [ForeignKey("IdTienda")]
        public Tienda Tienda { get; set; }
    }
}
