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
    public partial class Barra_Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.MenuHTML.Text = "";
            string conn = "";
            conn = ConfigurationManager.ConnectionStrings["Sistema de InscripcionConnectionString1"].ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            DataSet ds = new DataSet();
            try
            {
                objsqlconn.Open();
                SqlCommand objcmd = new SqlCommand("MostrarCarreras", objsqlconn);
                objcmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter objAdp = new SqlDataAdapter(objcmd);
                objAdp.Fill(ds);
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                objsqlconn.Close();
            }

            for(int i=0; i < ds.Tables[0].Rows.Count; i++)
            {
                string idcarrera1 = ds.Tables[0].Rows[i]["ID_Carrera"].ToString();
                string nombre = ds.Tables[0].Rows[i]["Nombre"].ToString();
                this.MenuHTML.Text += "<li class='dropdown-submenu'> <a  class='dropdown-item' tabindex='-1' href='Profesores.aspx'>" + nombre + "</a>  <ul class='dropdown-menu'>";

                for(int j=0; j < ds.Tables[1].Rows.Count; j++)
                {
                    string idcarrera2 = ds.Tables[1].Rows[j]["ID_Carrera"].ToString();
                    if(idcarrera1 == idcarrera2)
                    {
                        nombre = ds.Tables[1].Rows[j]["Curso"].ToString().Trim();
                        if(nombre == "1")
                        {
                            nombre = "Primero";
                        }
                        if (nombre == "2")
                        {
                            nombre = "Segundo";
                        }
                        if (nombre == "3")
                        {
                            nombre = "Tercero";
                        }
                        this.MenuHTML.Text += "<li class='dropdown-item'><a href='#'>" + nombre + " </a></li>";
                    }
                    
                }
                this.MenuHTML.Text += "</ul> </li>";
            }

            if(MenuHTML.Text == "Desarrollo de Software")
            {
                Response.Redirect("Profesores.aspx");
            }
            
            int user = (int)Session["ID_User"];
            string sql = "select * from Usuarios where ID_Usuario =" + user.ToString();
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int tipo = int.Parse(t.Rows[0]["ID_Tipo_Usuario"].ToString()); 
            if (tipo == 3)
            {
                Inscribir.HRef = "Inscripciones-Alumno.aspx";
                Usuario.Visible = false;
                Alumno.Visible = false;
                Materia.Visible = false;
                Mesa.HRef = "Mesa-Alumno.aspx";
                Fecha.Visible = false;
                Estadistica.Visible = false;
                Profesor.Visible = false;
            }
            if(tipo == 2)
            {
                Usuario.Visible = false;
                Alumno.Visible = false;
                Materia.Visible = false;
                Mesa.HRef = "Mesas-Profe.aspx";
                Fecha.Visible = false;
                Estadistica.Visible = false;
                Inscribir.HRef = "Inscripciones-Profe.aspx";
                Profesor.Visible = false;

            }
            /*
            if(tipo == 6)
            {
                Mesa.HRef = "Mesas-Secretaria(Prueba).aspx";
            }
             */
            
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}