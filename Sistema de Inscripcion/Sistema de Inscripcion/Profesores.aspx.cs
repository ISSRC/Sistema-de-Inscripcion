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
    public partial class Profesores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.divaltaprofesor.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string SQL = "select * from Profesor where ID_Profesor=" + Request.QueryString["id"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.editarprofesor.Visible = true;
                    this.divprofesor.Visible = false;
                    TextBox2.Text = t.Rows[0]["Apellido"].ToString();
                    TextBox3.Text = t.Rows[0]["Telefono"].ToString();
                    TextBox1.Text = t.Rows[0]["Nombre"].ToString();
                    TextBox4.Text = t.Rows[0]["DNI"].ToString();
                    TextBox5.Text = t.Rows[0]["Mail"].ToString();
                }
                else
                {
                    this.editarprofesor.Visible = false;

                }
            }
        }

        protected void nuevo_profesor_Click(object sender, EventArgs e)
        {
            this.divaltaprofesor.Visible = true;
            this.divprofesor.Visible = false;            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            if (AltaMailProf.Text != "")
            {
                if (TextBox7.Text != "")
                {
                    if (AltaApeProf.Text != "")
                    {
                        if (AltaNomProf.Text != "")
                        {
                            if (db.Validar_Usuario(TextBox6.Text) == true)
                            {
                                if (db.Validar_Mail_Profesor(AltaMailProf.Text) == true)
                                {
                                    int user = (int)Session["ID_User"];
                                    string idusuario = db.Nuevo_Usuario(TextBox6.Text, TextBox7.Text, AltaMailProf.Text, "2");
                                    bool r = db.Alta_Profesor(AltaNomProf.Text, AltaApeProf.Text, AltaDNIProf.Text, AltaMailProf.Text, AltaTelProf.Text, int.Parse(idusuario));
                                    if (r == true)
                                    {
                                        this.divprofesor.Visible = true;
                                        this.divaltaprofesor.Visible = false;
                                        //Response.Redirect("Profesores.aspx");
                                    }
                                    else
                                    {
                                        Label1.Text = "Error al agregar el profesor";
                                        this.divaltaprofesor.Visible = true;
                                    }
                                }
                                else
                                {
                                    Label3.Text = "El correo electronico ya existe";
                                    AltaMailProf.Text = "";
                                    this.divaltaprofesor.Visible = true;
                                }
                            }
                            else
                            {
                                Label4.Text = "El nombre se usuario ya existe";
                                TextBox6.Text = "";
                                this.divaltaprofesor.Visible = true;
                            }
                        }
                        else
                        {
                            LabelNom.Text = "Este campo es obligatorio";
                            this.divaltaprofesor.Visible = true;

                        }
                    }
                    else
                    {
                        LabelApe.Text = "Este campo es obligatorio";
                        this.divaltaprofesor.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "Este campo es obligatorio";
                    this.divaltaprofesor.Visible = true;
                }
            }
            else
            {
                Label3.Text = "Este campo es obligatorio";
                this.divaltaprofesor.Visible = true;

            }
        }

        protected void Acept_guar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            AdminDB db = new AdminDB();
            if (TextBox5.Text != "")
            {
                if (TextBox2.Text != "")
                {
                    if (TextBox1.Text != "")
                    {
                        bool r = db.Actualizar_Profesor(TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, int.Parse(TextBox3.Text), id);
                        if (r == true)
                        {
                            Response.Redirect("Profesores.aspx");
                        }
                        else
                        {
                            Label2.Text = "No se pudo guardar los cambios";
                        }
                    }
                    else
                    {
                        LabelNomE.Text = "Este campo es obligatorio";
                    }
                }
                else
                {
                    LabelApeE.Text = "Este campo es obligatorio";
                }
            }
            else
            {
                LabelMailE.Text = "Este campo es obligatorio";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            string sql = "select * from Profesor where Nombre like '%" + TextBox8.Text + "%' or Apellido like '%" + TextBox8.Text + "%'";
            SqlDataSource1.SelectCommand = sql;
        }

        protected void Cancel_new_prof_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profesores.aspx");
        }

        protected void Cancel_act_prof_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profesores.aspx");
        }
    }
}