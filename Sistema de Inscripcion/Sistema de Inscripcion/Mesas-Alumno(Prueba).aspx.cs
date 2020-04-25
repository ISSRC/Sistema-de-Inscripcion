using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Sistema_de_Inscripcion
{
    public partial class Mesas_Alumno_Prueba_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int user = (int)Session["ID_User"];
            string sql = "select * from Alumno where ID_Usuario =" + user;
            DataTable t = db.procesarselect(sql);
            string nombre = t.Rows[0]["Nombre"].ToString();
            string apellido = t.Rows[0]["Apellido"].ToString();
            Label1.Text = "" + nombre + " " + apellido;

            string fecha = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where Mesa.Fecha > '" + DateTime.Today.ToShortDateString() + "' ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = fecha;


        }
    }
}