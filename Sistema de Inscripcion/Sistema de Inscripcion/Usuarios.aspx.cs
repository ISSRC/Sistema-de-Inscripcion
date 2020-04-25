using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace Sistema_de_Inscripcion
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.elejir.Visible = false;
            this.divNuevoUsuario.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string SQL = "select * from Usuarios where ID_Usuario=" + Request.QueryString["id"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.divEditarUsuario.Visible = true;
                    this.divusuarios.Visible = false;
                    TextBox2.Text = t.Rows[0]["Contraseña"].ToString();
                    TextBox3.Text = t.Rows[0]["Mail"].ToString();
                    TextBox1.Text = t.Rows[0]["Usuario"].ToString();
                    DropDownList1.SelectedValue = t.Rows[0]["ID_Tipo_Usuario"].ToString();
                }
                else
                {
                    this.divEditarUsuario.Visible = false;

                }
            }

        }

        protected void Nuevo_Usuario_Click(object sender, EventArgs e)
        {
            //this.divNuevoUsuario.Visible = true;
            this.divusuarios.Visible = false;
            this.elejir.Visible = true;
        }

        protected void Guardar_Nuevo_Usuario_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            if (TB_Mail_Usuario.Text != "")
            {
                if (TB_Contra_Usuario.Text != "")
                {
                    if (TB_Nombre_Usuario.Text != "")
                    {

                        if (db.Validar_Mail(TB_Mail_Usuario.Text) == true)
                        {
                            if (db.Validar_Usuario(TB_Nombre_Usuario.Text) == true)
                            {
                                string r = db.Nuevo_Usuario(TB_Nombre_Usuario.Text, TB_Contra_Usuario.Text, TB_Mail_Usuario.Text, Tipo_Usuario.Text);
                                if (r != "")
                                {
                                    Label_Aviso.Text = "Nuevo usuario agregado";
                                    //this.divNuevoUsuario.Visible = false;
                                    Response.Redirect("Usuarios.aspx");
                                }
                            }
                            else
                            {
                                Label2.Text = "El nombre de Usuario ya Existe";
                                TB_Nombre_Usuario.Text = "";
                                this.divNuevoUsuario.Visible = true;
                            }
                        }

                        else
                        {
                            Label3.Text = "El Correo electronico ya existe ";
                            TB_Mail_Usuario.Text = "";
                            this.divNuevoUsuario.Visible = true;
                        }
                    }
                    else
                    {
                        LabelUsuVacio.Text = "El campo no puede estar vacio";
                        this.divNuevoUsuario.Visible = true;

                    }
                }
                else
                {
                    LabelCantraVacia.Text = "El campo no puede estar vacio";
                    this.divNuevoUsuario.Visible = true;

                }
            }
            else
            {
                LabelMailVacio.Text = "El campo no puede estar vacio";
                this.divNuevoUsuario.Visible = true;
            }
        }
                

        protected void Button_guardar_editar_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int id = int.Parse(Request.QueryString["id"]);
            if (TextBox3.Text != "")
            {
                if (TextBox2.Text != "")
                {
                    if (TextBox1.Text != "")
                    {
                        bool r = db.ActualizarUsuario(TextBox1.Text, TextBox2.Text, TextBox3.Text, DropDownList1.SelectedValue, id);
                        if (r == true)
                        {
                            Label_Actualizar_Usuario.Text = "Los datos se actualizaron correctamente";
                            //Response.Redirect("Usuarios.aspx");
                        }
                        else
                        {
                            Label_Actualizar_Usuario.Text = "Los datos no pudieron actualizarse";
                        }
                    }
                    else
                    {
                        Labelusuedit.Text = "El campo no puede estar vacio";
                    }
                }
                else
                {
                    Labelcontraedit.Text = "El campo no puede estar vacio";
                }
            }
            else
            {
                Labelmailedit.Text = "El campo no puede estar vacio";
            }
        }

        protected void Cancelar_Nuevo_Usu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void Cancelar_Edit_Usu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");

        }

        protected void Buscar_Usu_Click(object sender, EventArgs e)
        {
            string sql = "SELECT Usuarios.ID_Usuario, Usuarios.ID_Tipo_Usuario AS Expr1, Usuarios.Usuario, Usuarios.Contraseña, Usuarios.Mail, Tipo_Usuario.* FROM Usuarios INNER JOIN Tipo_Usuario ON Usuarios.ID_Tipo_Usuario = Tipo_Usuario.ID_Tipo_Usuario where (Usuario like '%" + TB_Buscar_Ussu.Text + "%') or (Contraseña like '%" + TB_Buscar_Ussu.Text + "%') or (Mail like '%" + TB_Buscar_Ussu.Text + "%')";
            SqlDataSource1.SelectCommand = sql;
        }

               
        protected void Button1_Click1(object sender, EventArgs e)
        {
            this.divNuevoUsuario.Visible = true;
            this.elejir.Visible = false;
            this.divusuarios.Visible = false;
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            this.divNuevoUsuario.Visible = true;
            this.elejir.Visible = false;
            this.divusuarios.Visible = false;
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Alumno.aspx");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Profesores.aspx");
        }

        protected void SeleccionarUsuario(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            string sql = "SELECT Usuarios.ID_Usuario, Usuarios.ID_Tipo_Usuario AS Expr1, Usuarios.Usuario, Usuarios.Contraseña, Usuarios.Mail, Tipo_Usuario.* FROM Usuarios INNER JOIN Tipo_Usuario ON Usuarios.ID_Tipo_Usuario = Tipo_Usuario.ID_Tipo_Usuario where Usuarios.ID_Tipo_Usuario =" + DropDownList2.SelectedValue;
            SqlDataSource1.SelectCommand = sql;
        }
    }
}