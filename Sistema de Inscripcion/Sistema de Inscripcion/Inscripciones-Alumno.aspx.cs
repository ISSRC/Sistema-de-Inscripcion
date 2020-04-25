using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Sistema_de_Inscripcion
{
    public partial class Inscripciones_Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int user = (int)Session["ID_User"];
            string sql = "select ID_Alumno from Alumno where ID_Usuario =" + user.ToString();
            AdminDB db = new AdminDB();
            DataTable y = db.procesarselect(sql);
            int idal = int.Parse(y.Rows[0]["ID_Alumno"].ToString());
            string mesa = "SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Inscripcion.ID_Usuario =" + user;
            SqlDataSource1.SelectCommand = mesa;
        }

        protected void Nueva_inscripcion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nueva-incripcion-Alumno.aspx");
        }
    }
}