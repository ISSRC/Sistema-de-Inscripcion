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
    public partial class Mesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.divmesa.Visible = true;
            this.divnuevamesa.Visible = false;
            this.diceditarmesas.Visible = false;
            if(!IsPostBack)
            {
                IniciarllenadoDrops();
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string SQL = "select * from Mesa where ID_Mesa=" + Request.QueryString["id"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.divmesa.Visible = false;
                    this.diceditarmesas.Visible = true;
                    TextBox2.Text = Convert.ToDateTime(t.Rows[0]["Fecha"].ToString()).ToString("dd/MM/yyyy");
                    TextBox3.Text = t.Rows[0]["Hora"].ToString();
                    TextBox1.Text = t.Rows[0]["Descripcion"].ToString();
                    DropDownList1.SelectedValue = t.Rows[0]["ID_Materia"].ToString();
                    DropDownList2.SelectedValue = t.Rows[0]["ID_MesMesa"].ToString();
                    DropDownList3.SelectedValue = t.Rows[0]["ID_ProfesorTitular"].ToString();
                    DropDownList4.SelectedValue = t.Rows[0]["ID_ProfesorVocal1"].ToString();
                    DropDownList5.SelectedValue = t.Rows[0]["ID_ProfesorVocal2"].ToString();

                }
                else
                {
                    this.diceditarmesas.Visible = false;

                }
            }

        }

        protected void nueva_mesa_Click(object sender, EventArgs e)
        {
            Response.Redirect("Nueva-Mesa.aspx");
        }

        protected void Alta_mesa_Click(object sender, EventArgs e)
        {
            if ((int.Parse(Fecha_alta_mesa.Text)) > (int.Parse(DateTime.Today.ToShortDateString())))
            {
                if ((Prof_titular_altamesa.SelectedValue != Prof_vocal1_altamesa.SelectedValue) && (Prof_vocal1_altamesa.SelectedValue != Prof_vocal2_altamesa.SelectedValue))
                {
                    AdminDB db = new AdminDB();
                    bool r = db.Alta_Mesa(Descrip_alta_mesa.Text, int.Parse(Materia_alta_mesa.Text), DateTime.Parse(Fecha_alta_mesa.Text), Hora_alta_mesa.Text, int.Parse(Mes_alta_mesa.Text), int.Parse(Prof_titular_altamesa.Text), int.Parse(Prof_vocal1_altamesa.Text), int.Parse(Prof_vocal2_altamesa.Text));
                    if (r == true)
                    {
                        Label_aviso_altamesa.Text = "Nueva mesa agregada";
                        Response.Redirect("Mesas.aspx");
                    }
                }
                else
                {
                    Label_aviso_altamesa.Text = "Error al agregar la mesa";
                }
            }
            else
            {
                Label1.Text = "La fecha tiene que ser mayor a la del dia de hoy";
                Fecha_alta_mesa.Text = "";
            }

            
        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {
            Response.Redirect("ImprimirMesas.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int id = int.Parse(Request.QueryString["id"]);
            string fecha_mesa = Convert.ToDateTime(TextBox2.Text).ToString("dd/MM/yyyy");
            bool r = db.Editar_Mesa2(TextBox1.Text, int.Parse(DropDownList1.SelectedValue), fecha_mesa, TextBox3.Text, int.Parse(DropDownList2.SelectedValue), int.Parse(DropDownList3.SelectedValue), int.Parse(DropDownList4.SelectedValue), int.Parse(DropDownList5.SelectedValue), id);
            if (r == true)
            {
                Response.Redirect("Mesas.aspx");
            }
            else
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string sql = "Select * from Mesa_Examen where Mesa like '%" + TextBox4.Text + "%'";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where Mesa.ID_Materia = " + DropDownList8.SelectedValue + " ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource8.SelectCommand = sql;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where MesMesa.ID_Carrera =" + DropDownList7.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource8.SelectCommand = sql;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string sql = "select Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido, Materia.ID_Materia from Profesor join Materia on Materia.ID_Profesor = Profesor.ID_Profesor where ID_Materia = " + DropDownList1.SelectedValue;
            DropDownList3.SelectedValue = sql;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            this.divfiltros.Visible = true;
        }

        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where Mesa.Fecha ='" + Convert.ToDateTime(DropDownList9.SelectedValue.ToString()).ToString("dd-MM-yyyy") + "' ORDER BY Mesa_Examen.Fecha DESC ";
            SqlDataSource8.SelectCommand = sql;
        }

        private void IniciarllenadoDrops()
        {
            
            AdminDB db = new AdminDB();
            Materia_alta_mesa.DataSource = db.procesarselect("SELECT [ID_Materia], [Nombre] FROM [Materia]");
            Materia_alta_mesa.DataTextField = "Nombre";
            Materia_alta_mesa.DataValueField = "ID_Materia";
            Materia_alta_mesa.DataBind();
            //Se le agrega al principio del dropdown un Item seleccionar
            Materia_alta_mesa.Items.Insert(0, new ListItem("[Seleccionar una Materia]", "0"));
            Prof_titular_altamesa.Items.Insert(0, new ListItem("[Seleccionar un Profesor]", "0"));

        }
        protected void SeleccionarMateria(object sender, EventArgs e)
        {
            //se hace el llenado del dropdown Profesor Titular a corde de lo que se selcciono en el dropdown Materia
            AdminDB db = new AdminDB();
            int MateriaID = Convert.ToInt32(Materia_alta_mesa.SelectedValue);
            Prof_titular_altamesa.DataSource = db.procesarselect("select Profesor.ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido,Materia.Nombre, Materia.ID_Profesor as ID_Prof, Materia.ID_Materia from Profesor join Materia on Profesor.ID_Profesor = Materia.ID_Profesor where Materia.ID_Materia =" + MateriaID);
            Prof_titular_altamesa.DataTextField = "NombreApellido";
            Prof_titular_altamesa.DataValueField = "ID_Profesor";
            Prof_titular_altamesa.DataBind();
            Prof_titular_altamesa.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }


    }
}