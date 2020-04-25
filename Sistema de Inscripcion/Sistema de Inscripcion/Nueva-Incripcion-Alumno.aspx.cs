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
    public partial class Nueva_Incripcion_Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxFecha.Text = DateTime.Today.ToShortDateString();
            if(!IsPostBack)
            {
                IniciarllenadoDrop();
            }

            if(!IsPostBack)
            {
                if(Request.QueryString["idmesa"] != null)
                {
                    int mesa = int.Parse(Request.QueryString["idmesa"]);
                    string SQL = "select * from Mesa where ID_Mesa =" + mesa;
                    AdminDB DB = new AdminDB();
                    DataTable y = DB.procesarselect(SQL);
                    DropMesMesa.SelectedValue = y.Rows[0]["ID_MesMesa"].ToString();
                    DropMesa.SelectedValue = y.Rows[0]["ID_Materia"].ToString();
                    DropMesMesa.Enabled = false;
                    DropMesa.Enabled = false;
                }
            }
            //se establece en el dropdown que el mes de la mesa sea mayor a la fecha actual
            AdminDB db = new AdminDB();
            string sql2 = "select * from MesMesa "; //where Fecha_Iscripcion_Hasta > '" + DateTime.Today.ToShortDateString() + "'";
            DataTable i = db.procesarselect(sql2);
            if (i.Rows.Count == 0)
            {
                DropMesMesa.Enabled = false;
                DropMesMesa.ClearSelection();
                LabelLimite.Text = "No hay fechas de exmanes en los siguientes meses";
                //int limite = int.Parse(i.Rows[0]["ID_MesMesa"].ToString());
                //DropMesMesa.SelectedValue = limite.ToString();
            }
        }

        protected void Cancel_inscrip_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inscripciones-Alumno.aspx");
        }

        protected void Guardar_inscrip_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int ID = (int)Session["ID_User"];
            string sql4 = "select * from Alumno where ID_Usuario = " + ID;
            DataTable o = db.procesarselect(sql4);
            int ida = int.Parse(o.Rows[0]["ID_ALumno"].ToString());
            DataTable A = db.procesarselect("select * from Inscripcion where ID_Alumno =" + ida + " and ID_Mesa =" + DropMesa.SelectedValue);
            if (A.Rows.Count == 0)
            {
                if (DropMesMesa.Enabled == true)
                {
                    bool r = db.Insert_Inscripcion(TextBoxFecha.Text, DateTime.Now.ToShortTimeString(), int.Parse(DropMesa.SelectedValue), ida, 1, "", int.Parse(DropCondicion.SelectedValue), ID);
                    //int.Parse(DropDownList2.SelectedValue)
                    if (r == true)
                    {
                        //se obtiene el mail del alumno y se hace el envio del email
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
                        Response.Redirect("Inscripciones-Alumno.aspx");
                    }
                    else
                    {
                        Label3.Visible = true;
                    }
                }
                else
                {
                    Label2.Visible = true;
                    Label1.Visible = true;
                    Label1.Text = "Asegurese de que la fecha este dentro de la fecha de examen seleccionada ";

                }
            }
            else
            {
                LabelMesaRepe.Text = "Ya esta inscripto a esta mesa";
            }
        }

        private void IniciarllenadoDrop()
        {
            //Se hace el llenado de los datos del dropdown de MesMesa
            AdminDB db = new AdminDB();
            DropMesMesa.DataSource = db.procesarselect("Select * from MesMesa "); //where Fecha_Iscripcion_Hasta > '" + DateTime.Today.ToShortDateString() + "'");
            DropMesMesa.DataTextField = "Descripcion";
            DropMesMesa.DataValueField = "ID_MesMesa";
            DropMesMesa.DataBind();
            //Se le agrega al principio del dropdown un Item seleccionar
            DropMesMesa.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
            DropMesa.Items.Insert(0, new ListItem("[Seleccionar]", "0"));
        }

        protected void SeleccionarMesMesa(object sender, EventArgs e)
        {
            //se hace el llenado del dropdown Mesa a corde de lo que se selcciono en el dropdown MesMesa
            AdminDB db = new AdminDB();
            int MesMesaID = Convert.ToInt32(DropMesMesa.SelectedValue);
            DropMesa.DataSource = db.procesarselect("SELECT Mesa.ID_Mesa, Mesa.Descripcion, Mesa.ID_Materia, Mesa.Fecha, Mesa.Hora, Mesa.ID_MesMesa, Mesa.ID_ProfesorTitular, Mesa.ID_ProfesorVocal1, Mesa.ID_ProfesorVocal2, Materia.ID_Carrera, MesMesa.ID_MesMesa AS Expr1, Materia.Nombre FROM Mesa INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where Mesa.ID_MesMesa =" + MesMesaID);
            DropMesa.DataTextField = "Nombre";
            DropMesa.DataValueField = "ID_Mesa";
            DropMesa.DataBind();
        }
    }
}