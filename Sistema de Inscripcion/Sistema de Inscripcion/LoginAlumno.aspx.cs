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
    public partial class LoginAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Iniciar_Click(object sender, EventArgs e)
        {
            string sql = "select * from Alumno where Nombre ='" + TextBox1.Text + "' and DNI = '" + TextBox2.Text + "' and Aprobado = 0";
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);


            if (t != null)
            {
                if (t.Rows.Count > 0)
                {

                    int ID = int.Parse(t.Rows[0]["ID_Usuario"].ToString());
                    Session.Add("ID_User", ID);
                    Response.Redirect("Menu.aspx");


                }
                else
                {
                    //Label1.Visible = true;
                }
            }
        }

    }
}