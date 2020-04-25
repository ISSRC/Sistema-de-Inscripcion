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
    public partial class MesMesa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.nuevafecha.Visible = false;
            this.mesMesa.Visible = true;
            this.editarmesmesa.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string SQL = "SELECT MesMesa.ID_MesMesa AS Expr1, MesMesa.Descripcion AS Expr2, MesMesa.ID_Carrera AS Expr3, MesMesa.Fecha_Inscripcion_Desde AS Expr4, MesMesa.Fecha_Iscripcion_Hasta AS Expr5, Carrera.Nombre, MesMesa.* FROM MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera where ID_MesMesa=" + Request.QueryString["id"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    //this.divmesa.Attributes.Add("style", "display:none");
                    this.mesMesa.Visible = false;
                    this.editarmesmesa.Visible = true;
                    TextBox10.Text = Convert.ToDateTime(t.Rows[0]["Fecha_Inicio_Mesa_Hasta"].ToString()).ToString("dd-MM-yyyy");
                    TextBox9.Text = Convert.ToDateTime(t.Rows[0]["Fecha_Inicio_Mesa_Desde"].ToString()).ToString("dd-MM-yyyy");
                    TextBox8.Text = Convert.ToDateTime(t.Rows[0]["Fecha_Confirm_incrip_Hasta"].ToString()).ToString("dd-MM-yyyy");
                    TextBox7.Text = Convert.ToDateTime(t.Rows[0]["Fecha_Confirm_incrip_Desde"].ToString()).ToString("dd-MM-yyyy");
                    TextBox6.Text = Convert.ToDateTime(t.Rows[0]["Fecha_Iscripcion_Hasta"].ToString()).ToString("dd-MM-yyyy");
                    TextBox5.Text = Convert.ToDateTime(t.Rows[0]["Fecha_Inscripcion_Desde"].ToString()).ToString("dd-MM-yyyy");
                    TextBox4.Text = t.Rows[0]["Descripcion"].ToString();
                    DropDownList2.SelectedValue = t.Rows[0]["ID_Carrera"].ToString();

                }
                else
                {
                    this.editarmesmesa.Visible = false;

                }
            }
        }

        protected void New_fecha_Click(object sender, EventArgs e)
        {
            this.mesMesa.Visible = false;
            this.nuevafecha.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //se convierten los textbox a un tipo de variable aceptada 
            string fecha_inscrip_desde = Convert.ToDateTime(TextBox2.Text).ToString("dd/MM/yyyy");
            string fecha_inscrip_hasta = Convert.ToDateTime(TextBox3.Text).ToString("dd/MM/yyyy");
            string fecha_confirm_desde = Convert.ToDateTime(TextBox11.Text).ToString("dd/MM/yyyy");
            string fecha_confirm_hasta = Convert.ToDateTime(TextBox12.Text).ToString("dd/MM/yyyy");
            string fecha_examen_desde = Convert.ToDateTime(TextBox13.Text).ToString("dd/MM/yyyy");
            string fecha_examen_hasta = Convert.ToDateTime(TextBox14.Text).ToString("dd/MM/yyyy");

            //se comprueba que la fecha_confirm_hasta sea menor a fecha_examen_desde
            if (DateTime.Parse(fecha_confirm_hasta) < DateTime.Parse(fecha_examen_desde))
            {
                //se comprueba que la fecha_inscrip_hasta se menor a la fecha_confirm_desde
                if (DateTime.Parse(fecha_inscrip_hasta) < DateTime.Parse(fecha_confirm_desde))
                {
                    AdminDB db = new AdminDB();
                    bool r = db.Insert_MesMesa(TextBox1.Text, int.Parse(DropDownList1.SelectedValue), fecha_inscrip_desde, fecha_inscrip_hasta, fecha_confirm_desde, fecha_confirm_hasta, fecha_examen_desde, fecha_examen_hasta);
                    if (r == true)
                    {
                        Response.Redirect("MesMesa.aspx");
                    }

                }
            }
            else
            {
                Label1.Text = "No se pudo cargar correctamente la fecha";
            }

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //se ejecuta la funcion a guardar la edicion de la fecha de examen
            AdminDB db = new AdminDB();
            string fecha_inscrip_desde_edit = Convert.ToDateTime(TextBox5.Text).ToString("dd/MM/yyyy");
            string fecha_inscrip_hasta_edit = Convert.ToDateTime(TextBox6.Text).ToString("dd/MM/yyyy");
            string fecha_confirm_desde_edit = Convert.ToDateTime(TextBox7.Text).ToString("dd/MM/yyyy");
            string fecha_confirm_hasta_edit = Convert.ToDateTime(TextBox8.Text).ToString("dd/MM/yyyy");
            string fecha_examen_desde_edit = Convert.ToDateTime(TextBox9.Text).ToString("dd/MM/yyyy");
            string fecha_examen_hasta_edit = Convert.ToDateTime(TextBox10.Text).ToString("dd/MM/yyyy");
            int id = int.Parse(Request.QueryString["id"]);
            bool r = db.Actualizar_MesMesa(TextBox4.Text, int.Parse(DropDownList2.SelectedValue), fecha_inscrip_desde_edit, fecha_inscrip_hasta_edit, fecha_confirm_desde_edit, fecha_confirm_hasta_edit, fecha_examen_desde_edit, fecha_examen_hasta_edit, id);
            if (r == true)
            {
                Response.Redirect("MesMesa.aspx");
            }
            else
            {
                Label1.Text = "No se pudieron cambiar los datos correctamente";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            string sql = "SELECT MesMesa.ID_MesMesa AS Expr1, MesMesa.Descripcion AS Expr2, MesMesa.ID_Carrera AS Expr3, MesMesa.Fecha_Inscripcion_Desde AS Expr4, MesMesa.Fecha_Iscripcion_Hasta AS Expr5, Carrera.Nombre, MesMesa.* FROM MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera where MesMesa.ID_Carrera =" + DropDownList3.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource3.SelectCommand = sql;
        }
    }
}