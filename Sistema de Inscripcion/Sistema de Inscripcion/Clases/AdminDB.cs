using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Sistema_de_Inscripcion
{
    public class AdminDB
    {
        private ConnectionStringSettings cadena;

        public AdminDB()   //metodo constructor
        {
            this.cadena = ConfigurationManager.ConnectionStrings["Sistema de InscripcionConnectionString1"];

        }

        public DataTable procesarselect(string consulta)
        {
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, this.cadena.ConnectionString);
            DataSet ds = new DataSet();
            DataTable tabla = null;
            adaptador.Fill(ds);
            tabla = ds.Tables[0];
            return tabla;

        }

        public bool Validar_Usuario(string idusu)
        {
            string sqlstring = "select * from Usuarios where Usuario ='" + idusu + "'";
            DataTable t = procesarselect(sqlstring);
            bool retorno = true;
            if (t != null)
            {
                if(t.Rows.Count > 0)
                {
                    retorno = false;
                }
            }

            return retorno;
        }

        public bool Validar_Mail(string mail)
        {
            string sqlstring = "select * from Usuarios where Mail ='" + mail + "'";
            DataTable t = procesarselect(sqlstring);
            bool retorno = true;
            if (t != null)
            {
                if (t.Rows.Count > 0)
                {
                    retorno = false;
                }
            }

            return retorno;
        }

        public bool Validar_Mail_Alumno(string mail)
        {
            string sqlstring = "select * from Alumno where Mail ='" + mail + "'";
            DataTable t = procesarselect(sqlstring);
            bool retorno = true;
            if (t != null)
            {
                if (t.Rows.Count > 0)
                {
                    retorno = false;
                }
            }

            return retorno;
        }

        public bool Validar_Mail_Profesor(string mail)
        {
            string sqlstring = "select * from Profesor where Mail ='" + mail + "'";
            DataTable t = procesarselect(sqlstring);
            bool retorno = true;
            if (t != null)
            {
                if (t.Rows.Count > 0)
                {
                    retorno = false;
                }
            }

            return retorno;
        }

        public string Nuevo_Usuario(string usuario, string contraseña, string mail, string id_tipo)
        {
            string sqlstring = "execute InsertUsuario @usu, @Contra, @Mail, @idtipo";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            string retorno = "";
            try
            {
                // cargamos los parametros definidos con @ en el SQL
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@usu", usuario);
                cmd.Parameters.AddWithValue("@Contra", contraseña);
                cmd.Parameters.AddWithValue("@Mail", mail);
                cmd.Parameters.AddWithValue("@idtipo", id_tipo);
                s.Open();  //abre conexion
                int id = (int)cmd.ExecuteScalar();

                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = "";
            }
            string sql = "select Top(1)* from Usuarios order by ID_Usuario Desc";
            DataTable t = procesarselect(sql);
            retorno = t.Rows[0]["ID_Usuario"].ToString();
            return retorno;    // si hay error retorna false
        }

        public bool ActualizarUsuario(string Usuario, string contraseña, string mail, string idtipo, int ID)
        {
            string sqlstring = "update Usuarios set Usuario=@usu, Contraseña=@contra, Mail=@mail, ID_Tipo_Usuario=@tipo where ID_Usuario=@d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                // cargamos los parametros definidos con @ en el SQL
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@contra", contraseña);
                cmd.Parameters.AddWithValue("@usu", Usuario);
                cmd.Parameters.AddWithValue("@tipo", idtipo);
                cmd.Parameters.AddWithValue("@mail", mail);
                cmd.Parameters.AddWithValue("@d", ID);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;    // si hay error retorna false
        }

        public bool Alta_Profesor(string Nombre, string Apellido, string DNI, string Mail, string Telefono, int idusu)
        {
            string sqlstring = " execute InsertProfesor @Nombre, @Apellido, @DNI, @Mail, @Telefono, @ID_Usuario";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@Apellido", Apellido);
                cmd.Parameters.AddWithValue("@DNI", DNI);
                cmd.Parameters.AddWithValue("@Mail", Mail);
                cmd.Parameters.AddWithValue("@Telefono", Telefono);
                cmd.Parameters.AddWithValue("@ID_Usuario", idusu);
                cmd.Parameters.AddWithValue("@idcrear", 0);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                string id = cmd.Parameters["@idcrear"].Value.ToString();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Alta_Mesa(string Descripcion, int IDMateria, DateTime Fecha, string Hora, int IDMesmesa, int IDProftitular, int IDProfvocal1, int IDProfvocal2)
        {
            string sqlstring = " execute InsertMesa @Descripcion, @ID_Materia, @Fecha, @Hora, @ID_MesMesa, @ID_ProfesorTitular, @ID_ProfesorVocal1, @ID_ProfesorVocal2";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@ID_Materia", IDMateria);
                cmd.Parameters.AddWithValue("@Fecha", Fecha);
                cmd.Parameters.AddWithValue("@Hora", Hora);
                cmd.Parameters.AddWithValue("@ID_MesMesa", IDMesmesa);
                cmd.Parameters.AddWithValue("@ID_ProfesorTitular", IDProftitular);
                cmd.Parameters.AddWithValue("@ID_ProfesorVocal1", IDProfvocal1);
                cmd.Parameters.AddWithValue("@ID_ProfesorVocal2", IDProfvocal2);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Editar_Mesa(string Mesa, int Materia, DateTime Fecha, string Hora, int Titular, int Vocal1, int Vocal2, int ID)
        {
            string sqlstring = " update Mesa_Examen set Mesa=@mesa, Materia=@mat, Fecha=@fecha, Hora=@hora, Titular=@titu, Vocal1=@voc1, Vocal2=@voc2 where ID_Mesa = @d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@mesa", Mesa);
                cmd.Parameters.AddWithValue("@mat", Materia);
                cmd.Parameters.AddWithValue("@fecha", Fecha);
                cmd.Parameters.AddWithValue("@hora", Hora);
                cmd.Parameters.AddWithValue("@titu", Titular);
                cmd.Parameters.AddWithValue("@voc1", Vocal1);
                cmd.Parameters.AddWithValue("@voc2", Vocal2);
                cmd.Parameters.AddWithValue("@d", ID);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Editar_Mesa2(string Descripcion, int ID_Materia, string Fecha, string Hora, int ID_MesMesa, int Titular, int Vocal1, int Vocal2, int ID)
        {
            string sqlstring = " update Mesa set Descripcion=@desc, ID_Materia=@idmat, Fecha=@fecha, Hora=@hora, ID_MesMesa=@mes, ID_ProfesorTitular=@titu, ID_ProfesorVocal1=@voc1, ID_ProfesorVocal2=@voc2 where ID_Mesa = @d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@desc", Descripcion);
                cmd.Parameters.AddWithValue("@idmat", ID_Materia);
                cmd.Parameters.AddWithValue("@fecha", Fecha);
                cmd.Parameters.AddWithValue("@hora", Hora);
                cmd.Parameters.AddWithValue("@titu", Titular);
                cmd.Parameters.AddWithValue("@voc1", Vocal1);
                cmd.Parameters.AddWithValue("@voc2", Vocal2);
                cmd.Parameters.AddWithValue("@d", ID);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public int Obtener_id_Alumno()
        {
            string idalum = "select top(1) * from Alumno order by ID_Alumno Desc";
            DataTable t = procesarselect(idalum);
            int idalumno = int.Parse(t.Rows[0]["ID_Alumno"].ToString());
            return idalumno;
        }

        public bool insert_AlumnoxCarrera(int idalumno, int idcarrera)
        {
            idalumno = Obtener_id_Alumno();
            string sqlstring = "insert into AlumnoXCarrera (ID_Alumno, ID_Carrera) values (@idalumno, @idcarrera)";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@idalumno", idalumno);
                cmd.Parameters.AddWithValue("@idcarrera", idcarrera);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Alta_Alumno(string Nombre, string Apellido, string DNI, string Mail, string Celular, int idusuario, int idcarrera)
        {
            string sqlstring = " execute InsertAlumno @Nombre, @Apellido, @DNI, @Mail, @Celular, @ID_Usuario";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@Apellido", Apellido);
                cmd.Parameters.AddWithValue("@DNI", DNI);
                cmd.Parameters.AddWithValue("@Mail", Mail);
                cmd.Parameters.AddWithValue("@Celular", Celular);
                cmd.Parameters.AddWithValue("@ID_Usuario", idusuario);
                cmd.Parameters.AddWithValue("@idcrear", 0);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                string id = cmd.Parameters["@idcrear"].Value.ToString();
                bool ok = insert_AlumnoxCarrera(int.Parse(id), idcarrera);
                s.Close();  // cierra conexion
            }
            catch
           {
                retorno = false;
           }
            return retorno;
        }

        public bool Cambiar_Autotizacion(int idalumno)
        {
            string sqlstring = "update Alumno set Aptobado = True where ID_Alumno = @idalumno";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@idalumno", idalumno);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Actualizar_Alumno(string Nombre, string Apellido, string DNI, string Mail, string Celular, int IDCarrera, int idal)
        {
            string sqlstring = " update Alumno set Nombre=@nom, Apellido=@ape, DNI=@dni, Mail=@mail, Celular=@celu, ID_Carrera=@carre where ID_Alumno=@d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@nom", Nombre);
                cmd.Parameters.AddWithValue("@ape", Apellido);
                cmd.Parameters.AddWithValue("@dni", DNI);
                cmd.Parameters.AddWithValue("@mail", Mail);
                cmd.Parameters.AddWithValue("@celu", Celular);
                cmd.Parameters.AddWithValue("@carre", Celular);
                cmd.Parameters.AddWithValue("@d", idal);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Insert_Inscripcion(string Fecha, string Hora, int IDMesa, int IDAlumno, int IDEstado, string Observaciones, int Condicion, int IDUsuario)
        {
            string sqlstring = "insert into Inscripcion (Fecha, Hora, ID_Mesa, ID_Alumno, ID_Estado, Obsevaciones, ID_Condicion, ID_Usuario, Confirmado, Cancelado) values (@Fecha, @Hora, @IDMesa, @IDAlumno, @IDEstado, @Obsevaciones, @IDCondicion, @ID_Usuario, 0, 0)";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Fecha", Fecha);
                cmd.Parameters.AddWithValue("@Hora", Hora);
                cmd.Parameters.AddWithValue("@IDMesa", IDMesa);
                cmd.Parameters.AddWithValue("@IDAlumno", IDAlumno);
                cmd.Parameters.AddWithValue("@IDEstado", IDEstado);
                cmd.Parameters.AddWithValue("@Obsevaciones", Observaciones);
                cmd.Parameters.AddWithValue("@IDCondicion", Condicion);
                cmd.Parameters.AddWithValue("@ID_Usuario", IDUsuario);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Insert_MesMesa(string Descripcion, int idcarrera, string Fecha_incrip_Desde, string Fecha_incrip_Hasta, string Fecha_Confirm_incrip_Desde, string Fecha_Confirm_incrip_Hasta, string Fecha_Inicio_Mesa_Desde, string Fecha_Inicio_Mesa_Hasta)
        {
            //string sqlstring = "excecute InsertMesMesa @Descripcion, @ID_Carrera, @Fecha_Inscripcion_Desde, @Fecha_Inscripcion_Hasta, @Fecha_Confirm_incrip_Desde, @Fecha_Confirm_incrip_Hasta, @Fecha_Inicio_Mesa_Desde, @Fecha_Inicio_Mesa_Hasta ";
            string sqlstring = " execute InsertMesMesa @Descripcion, @ID_Carrera,  @Fecha_Inscripcion_Desde, @Fecha_Inscripcion_Hasta, @Fecha_Confirm_incrip_Desde, @Fecha_Confirm_incrip_Hasta, @Fecha_Inicio_Mesa_Desde, @Fecha_Inicio_Mesa_Hasta ";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@ID_Carrera", idcarrera);
                cmd.Parameters.AddWithValue("@Fecha_Inscripcion_Desde", Fecha_incrip_Desde);
                cmd.Parameters.AddWithValue("@Fecha_Inscripcion_Hasta", Fecha_incrip_Hasta);
                cmd.Parameters.AddWithValue("@Fecha_Confirm_incrip_Desde", Fecha_Confirm_incrip_Desde);
                cmd.Parameters.AddWithValue("@Fecha_Confirm_incrip_Hasta", Fecha_Confirm_incrip_Hasta);
                cmd.Parameters.AddWithValue("@Fecha_Inicio_Mesa_Desde", Fecha_Inicio_Mesa_Desde);
                cmd.Parameters.AddWithValue("@Fecha_Inicio_Mesa_Hasta", Fecha_Inicio_Mesa_Hasta);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Actualizar_Profesor(string Nombre, string Apellido, string DNI, string Mail, int Telefono, int ID)
        {
            string sqlstring = "update Profesor set Nombre=@nom, Apellido=@ape, DNI=@dni, Mail=@mail, Telefono=@tel where ID_Profesor=@d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                // cargamos los parametros definidos con @ en el SQL
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@nom", Nombre);
                cmd.Parameters.AddWithValue("@ape", Apellido);
                cmd.Parameters.AddWithValue("@dni", DNI);
                cmd.Parameters.AddWithValue("@mail", Mail);
                cmd.Parameters.AddWithValue("@tel", Telefono);
                cmd.Parameters.AddWithValue("@d", ID);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;    // si hay error retorna false
        }
        public bool Actualizar_MesMesa(string Descripcion, int ID_Carrera, string Fecha_incrip_Desde, string Fecha_incrip_Hasta, string Fecha_Confirm_incrip_Desde, string Fecha_Confirm_incrip_Hasta, string Fecha_Inicio_Mesa_Desde, string Fecha_Inicio_Mesa_Hasta, int ID)
        {
            string sqlstring = "update MesMesa set Descripcion=@des, ID_Carrera=@idcar, Fecha_Inscripcion_Desde=@FechaD, Fecha_Iscripcion_Hasta=@FechaH, Fecha_Confirm_incrip_Desde=@ConfirmD, Fecha_Confirm_incrip_Hasta=@ConfirmH, Fecha_Inicio_Mesa_Desde=@MesaD, Fecha_Inicio_Mesa_Hasta=@MesaH where ID_MesMesa=@d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                // cargamos los parametros definidos con @ en el SQL
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@des", Descripcion);
                cmd.Parameters.AddWithValue("@idcar", ID_Carrera);
                cmd.Parameters.AddWithValue("@FechaD", Fecha_incrip_Desde);
                cmd.Parameters.AddWithValue("@FechaH", Fecha_incrip_Hasta);
                cmd.Parameters.AddWithValue("@ConfirmD", Fecha_Confirm_incrip_Desde);
                cmd.Parameters.AddWithValue("@ConfirmH", Fecha_Confirm_incrip_Hasta);
                cmd.Parameters.AddWithValue("@MesaD", Fecha_Inicio_Mesa_Desde);
                cmd.Parameters.AddWithValue("@MesaH", Fecha_Inicio_Mesa_Hasta);
                cmd.Parameters.AddWithValue("@d", ID);
                s.Open();  //abre conexion
                cmd.ExecuteNonQuery();
                s.Close();  // cierra conexion
            }
            catch
            {
                retorno = false;
            }
            return retorno;    // si hay error retorna false
        }

        public bool Cambiar_Estado(string idinscrip)
        {
            string sqlstring = "update Iscripcion set ID_Estado = 2 where ID_Inscripcion = @idincrip";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@idincrip", idinscrip);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Cambiar_Condicion(int idcondi, int idinscrip)
        {
            string sqlstring = "update Inscripcion set ID_Condicion = @idcon, Confirmado = 1, ID_Estado = 2 where ID_Inscripcion = @idincrip";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@idcon", idcondi);
                cmd.Parameters.AddWithValue("@idincrip", idinscrip);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Insert_Materia (string Nombre, int idcarrera, string curso, int idprofesor)
        {
            string sqlstring = "execute InsertMaterias @Nombre ,@ID_Carrera, @Curso, @ID_Profesor";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@ID_Carrera", idcarrera);
                cmd.Parameters.AddWithValue("@Curso", curso);
                cmd.Parameters.AddWithValue("@ID_Profesor", idprofesor);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Editar_Materia (string Nombre, int idcarrera, string curso, int idprofesor, int ID)
        {
            string sqlstring = "update Materia  set Nombre=@Nombre , ID_Carrera=@ID_Carrera, Curso=@Curso, ID_Profesor=@ID_Profesor where ID_Materia= @d";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@ID_Carrera", idcarrera);
                cmd.Parameters.AddWithValue("@Curso", curso);
                cmd.Parameters.AddWithValue("@ID_Profesor", idprofesor);
                cmd.Parameters.AddWithValue("@d", ID);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Nueva_Carrera (string Nombre)
        {
            string sqlstring = "insert into Carrera (Nombre) values (@Nombre)";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Poner_Motivo (string Motivo, int ID)
        {
            string sqlstring = "update Inscripcion set Observaciones = @obser, Cancelado = 1, ID_Estado = 3 where ID_Inscripcion = @idincrip";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@obser", Motivo);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

        public bool Actualizar_Carrera (string Nombre, int ID)
        {
            string sqlstring = "update Carrera set Nombre=@nom where ID_Carrera = @idcar";
            SqlConnection s = new SqlConnection(this.cadena.ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, s);
            bool retorno = true;
            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@nom", Nombre);
                cmd.Parameters.AddWithValue("@idcar", ID);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            catch
            {
                retorno = false;
            }
            return retorno;
        }

    }
}