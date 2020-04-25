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
    public partial class Inscripciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                IniciarllenadoDrop();
            }

            //se consigue el ID del usuario ingresado
            int user = (int)Session["ID_User"];
            string sql = "select * from Usuarios where ID_Usuario =" + user.ToString();
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int tipo = int.Parse(t.Rows[0]["ID_Tipo_Usuario"].ToString()); 
            if(tipo == 3)
            {

            }

            this.divnuevains.Visible = false;

            //se actualizan los datos de los dropdown y los textboxs a los del seleccionado a editar
            if (!IsPostBack)
            {
                if (Request.QueryString["idmesa"] != null)
                {
                    int mesa = int.Parse(Request.QueryString["idmesa"]);
                    string SQL = "select * from Mesa where ID_Mesa =" + mesa;
                    AdminDB DB = new AdminDB();
                    DataTable y = DB.procesarselect(SQL);
                    this.dividinscripciones.Visible = false;
                    this.divnuevains.Visible = true;
                    DropMesMesa.SelectedValue = y.Rows[0]["ID_MesMesa"].ToString();
                    DropMesa.SelectedValue = y.Rows[0]["ID_Materia"].ToString();
                    DropMesMesa.Enabled = false;
                    DropMesa.Enabled = false;

                }
                else
                {
                    this.divnuevains.Visible = false;

                }
            }

            //se establece en el dropdown que el mes de la mesa sea mayor a la fecha actual
            string sql1 = "select * from MesMesa where Fecha_Iscripcion_Hasta > '" + DateTime.Today.ToShortDateString() + "'";
            DataTable i = db.procesarselect(sql1);
            if(i.Rows.Count > 0)
            {
                DropMesMesa.Enabled = false;
                DropMesMesa.ClearSelection();
                Label3.Visible = false;
                //int limite = int.Parse(i.Rows[0]["ID_MesMesa"].ToString());
                //DropMesMesa.SelectedValue = limite.ToString();
            }
            else
            {
                 
            }
                       
            
        }


        protected void Nuevains_Click(object sender, EventArgs e)
        {
            //se hace el proceso de una nueva inscripcion
            this.divnuevains.Visible = true;
            this.dividinscripciones.Visible = false;
            TextBox1.Text = DateTime.Today.ToShortDateString();
            int user = (int)Session["ID_User"];
            string sql = "select * from Usuarios where ID_Usuario =" + user.ToString();
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int tipo = int.Parse(t.Rows[0]["ID_Tipo_Usuario"].ToString());
            if (tipo == 3)
            {
                string sql1 = "select * from Alumno where ID_Usuario  =" + user;
                DataTable y = db.procesarselect(sql1);
                //DropDownList1.SelectedValue = y.Rows[0]["ID_Carrera"].ToString();
                //DropDownList2.SelectedValue = y.Rows[0]["ID_Alumno.Apellido"].ToString();
                DropMesa.Enabled = false;
                DropDownList2.Enabled = false;

            }
            Response.Redirect("Nueva-Inscripcion.aspx");
        }

        protected void Guardarins_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int ID = (int)Session["ID_User"];
            string sql4 = "select * from Alumno where ID_Usuario = " + ID;
            DataTable o = db.procesarselect(sql4);
            int ida = int.Parse(o.Rows[0]["ID_ALumno"].ToString());
            if (DropMesMesa.Enabled == true)
            {
                bool r = db.Insert_Inscripcion(TextBox1.Text, DateTime.Now.ToShortTimeString(), int.Parse(DropMesa.SelectedValue), ida, 1, " ", int.Parse(DropDownList3.SelectedValue), ID);
                //int.Parse(DropDownList2.SelectedValue)
                if (r == true)
                {
                    string mail = "select * from Alumno where ID_Usuario =" + ID;
                    DataTable t = db.procesarselect(mail);
                    string correo = t.Rows[0]["Mail"].ToString();
                    string sql = "select Top(1)* from Inscripcion order by ID_Inscripcion Desc";
                    DataTable y = db.procesarselect(sql);
                    int idmesa = int.Parse(y.Rows[0]["ID_Mesa"].ToString());
                    string sql2 = "select * from Mesa where ID_Mesa =" + idmesa;
                    DataTable u = db.procesarselect(sql2);
                    int idmat = int.Parse(u.Rows[0]["ID_Materia"].ToString());
                    string fecha = u.Rows[0]["Fecha"].ToString();
                    string sql3 = "Select * from Materia where ID_Materia =" + idmat;
                    DataTable i = db.procesarselect(sql3);
                    string materia = i.Rows[0]["Nombre"].ToString();
                    Convert.ToDateTime(fecha).ToShortDateString();
                    CCorreo objcorreo = new CCorreo(correo, "Aviso de Inscripcion", "Se ha inscripto a la mesa de " + materia + " la fecha de la mesa es " + fecha + ", su estado de inscripcion es Pre-Inscrpto, espere a ser aprobado");
                    if (objcorreo.Estado)
                    {
                        Response.Write("");
                    }
                    else
                    {
                        Response.Write("");
                    }
                    //this.dividinscripciones.Visible = true;
                    //Response.Redirect("Inscripciones.aspx");
                }
                else
                {
                    Label2.Visible = true;
                    
                }
            }
            else
            {
                Label4.Visible = true;
                Label5.Visible = true;
                Label5.Text = "Asegurese de que la fecha este dentro de la fecha de examen seleccionada ";

            }
        }

        private void IniciarllenadoDrop()
        {
            AdminDB db = new AdminDB();
            DropMesMesa.DataSource = db.procesarselect("Select * from MesMesa");
            DropMesMesa.DataTextField = "Descripcion";
            DropMesMesa.DataValueField = "ID_MesMesa";
            DropMesMesa.DataBind();
            //Se le agrega al principio del dropdown un Item seleccionar
            DropMesMesa.Items.Insert(0, new ListItem("[Seleccionar una Fecha de Examen]", "0"));
            DropMesa.Items.Insert(0, new ListItem("[Seleccionar una Mesa]", "0"));
        }
           

        protected void SeleccionarMesa(object sender, EventArgs e)
        {
            //se hace el llenado del dropdown Mesa a corde de lo que se selcciono en el dropdown MesMesa
            AdminDB db = new AdminDB();
            int MesMesaID = Convert.ToInt32(DropMesMesa.SelectedValue);
            DropMesa.DataSource = db.procesarselect("SELECT Mesa.ID_Mesa, Mesa.Descripcion, Mesa.ID_Materia, Mesa.Fecha, Mesa.Hora, Mesa.ID_MesMesa, Mesa.ID_ProfesorTitular, Mesa.ID_ProfesorVocal1, Mesa.ID_ProfesorVocal2, Materia.ID_Carrera, MesMesa.ID_MesMesa AS Expr1, Materia.Nombre FROM Mesa INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where Mesa.ID_MesMesa =" + MesMesaID);
            DropMesa.DataTextField = "Nombre";
            DropMesa.DataValueField = "ID_Mesa";
            DropMesa.DataBind();
            DropMesa.Items.Insert(0, new ListItem("[Seleccionar una Mesa]", "0"));   
        }


    }
}