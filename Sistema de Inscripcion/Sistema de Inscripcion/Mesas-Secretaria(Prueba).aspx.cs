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
    public partial class Mesas_Secretaria_Prueba_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.alumno.Visible = false;
            int user = (int)Session["ID_User"];
            string sql = "select * from Usuarios where ID_Usuario =" + user.ToString();
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int tipo = int.Parse(t.Rows[0]["ID_Tipo_Usuario"].ToString());
            if(!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    this.alumno.Visible = true;
                    string sql1 = "SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.Hora, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion, Inscripcion.Fecha, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Expr1, Mesa.Hora AS Expr2, Mesa.Descripcion, Estados.Nombre AS Expr3 FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado where Inscripcion.ID_Usuario = " + Request.QueryString["id"] + " and Mesa.Fecha > '" + DateTime.Today.ToShortDateString() + "'";
                    SqlDataSource2.SelectCommand = sql1;

                }
                else
                {
                    

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            string sql = "Select * from Alumno where Nombre like %'" + TextBox1.Text + "'% or Apellido like %'" + TextBox1.Text + "'%";
            SqlDataSource1.SelectCommand = sql;
        }
    }
}