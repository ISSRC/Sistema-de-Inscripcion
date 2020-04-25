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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Iniciar_Click(object sender, EventArgs e)
        {

            
            /*
            string sql2 = "select * from Alumno where Aprobado = 'True'";
            AdminDB db2 = new AdminDB();
            DataTable y = db2.procesarselect(sql2);

            if (y == null)
            {
                Response.Redirect("Menu.aspx");
            }
            */
        }

        protected void Iniciar_Click1(object sender, EventArgs e)
        {
            string sql = "select * from Usuarios where Usuario ='" + UsuarioTBox.Text + "' and Contraseña = '" + ContraseñaTBox.Text + "'";
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);


            if (t != null)
            {
                if (t.Rows.Count > 0)
                {
                    int IDTipo = int.Parse(t.Rows[0]["ID_Tipo_Usuario"].ToString());
                    int ID = int.Parse(t.Rows[0]["ID_Usuario"].ToString());
                    Session.Add("ID_User", ID);
                    Session.Add("ID_Tipo", IDTipo);
                    Response.Redirect("Menu.aspx");

                }
                else
                {
                    Label1.Visible = true;
                    UsuarioTBox.Text = "";
                    ContraseñaTBox.Text = "";
                }
            }
        }
    }

    
}