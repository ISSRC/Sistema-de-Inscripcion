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
    public partial class Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.divnuevoalumno.Visible = false;
            this.editaralumno.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string SQL = "select * from Alumno where ID_Alumno=" + Request.QueryString["id"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.editaralumno.Visible = true;
                    this.divalumnos.Visible = false;
                    TextBox7.Text = t.Rows[0]["Nombre"].ToString();
                    TextBox8.Text = t.Rows[0]["Apellido"].ToString();
                    TextBox9.Text = t.Rows[0]["DNI"].ToString();
                    TextBox10.Text = t.Rows[0]["Mail"].ToString();
                    TextBox11.Text = t.Rows[0]["Celular"].ToString();
                    DropCarreEd.SelectedValue = t.Rows[0]["ID_Carrera"].ToString();
                }
                else
                {
                    this.editaralumno.Visible = false;

                }
            }
        }

        protected void Guardar_alum_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            //int id = int.Parse(Request.QueryString["id"]);
                if (TextBox5.Text != "")
                {
                    if (TextBox4.Text != "")
                    {
                        if (TextBox3.Text != "")
                        {
                            if (TextBox12.Text != "")
                            {
                                if (TextBox13.Text != "")
                                {
                                    if (TextBox2.Text != "")
                                    {
                                        if (db.Validar_Mail_Alumno(TextBox5.Text) == true)
                                        {
                                            string idusuario = db.Nuevo_Usuario(TextBox12.Text, TextBox13.Text, TextBox5.Text, "3");
                                            bool r = db.Alta_Alumno(TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, int.Parse(idusuario), int.Parse(DropDownList1.SelectedValue));
                                            if (r == true)
                                            {
                                                Response.Redirect("Alumno.aspx");
                                            }
                                            else
                                            {
                                                Label1.Text = "No se pudo cargar correctamente";
                                            }
                                        }
                                        else
                                        {
                                            Label2.Text = "El correo electronico ya existe";
                                            TextBox5.Text = "";
                                        }
                                    }
                                    else
                                    {
                                        Labelnom.Text = "Este campo es obligatorio";
                                    }
                                }
                                else
                                {
                                    Labelcontra.Text = "Este campo es obligatorio";
                                }
                            }
                            else
                            {
                                LabelUsu.Text = "Este campo es obligatorio";
                            }
                        }
                        else
                        {
                            LabelApe.Text = "Este campo es obligatorio";
                        }
                    }
                    else
                    {
                        Labeldni.Text = "Este campo es obligatorio";
                    }
                }
                else
                {
                    Labelmail.Text = "Este campo es obligatorio";
                }
         }

        protected void Cancelar_alum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alumno.aspx");
        }

        protected void Guar_Actu_Alumno_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int id = int.Parse(Request.QueryString["id"]);
            bool r = db.Actualizar_Alumno(TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, int.Parse(DropCarreEd.SelectedValue), id);
            if (r == true)
            {
                Response.Redirect("Alumno.aspx");
            }
            else
            {
                Label1.Text = "No se pudo cargar correctamente";
            }
        }

        protected void Cancel_edit_alum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alumno.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            this.divalumnos.Visible = false;
            this.divnuevoalumno.Visible = true;
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            string sql = "select * from Alumno where (Nombre like '%" + TextBox1.Text + "%') or (Apellido like '%" + TextBox1.Text + "%') or (DNI like '%" + TextBox1.Text + "%')";
            SqlDataSource1.SelectCommand = sql;
        }
    }
}