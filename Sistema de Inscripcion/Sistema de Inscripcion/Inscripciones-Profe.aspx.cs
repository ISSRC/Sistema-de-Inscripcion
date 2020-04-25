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
    public partial class Inscripciones_Profe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //se le consigue el ID de usuario del profesor
            //acorde del ID del profesor se le muestran las inscripciones en las que el es titular
            int user = (int)Session["ID_User"];
            string sql = "select * from Profesor where ID_Usuario =" + user.ToString();
            AdminDB db = new AdminDB();
            DataTable y = db.procesarselect(sql);
            int idpro = int.Parse(y.Rows[0]["ID_Usuario"].ToString());
            DataTable u = db.procesarselect("select * from Profesor where ID_Usuario =" + idpro);
            int id = int.Parse(u.Rows[0]["ID_Profesor"].ToString());
            string mesa = "SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Inscripcion.Confirmado = 0 and Inscripcion.Cancelado = 0 and Mesa.ID_ProfesorTitular =" + id;
            SqlDataSource1.SelectCommand = mesa;

            this.cancelar.Visible = false;

            //al seleccionar confirmar se le muestra los drops para editarlos
            if (!IsPostBack)
            {
                if (Request.QueryString["confirmar"] != null)
                {
                    string SQL = "SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido + ' ' + Alumno.Nombre as ApellidoNombre, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Mesa.Descripcion, Estados.Nombre AS Estado, Condiciom.Descripcion AS Expr1 FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion where ID_Inscripcion=" + Request.QueryString["confirmar"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.inscripciones.Visible = false;
                    this.confirminscrip.Visible = true;
                    TextBox1.Text = t.Rows[0]["ApellidoNombre"].ToString();
                    //TextBox3.Text = t.Rows[0]["Apellido"].ToString();
                    TextBox4.Text = t.Rows[0]["Horas"].ToString();
                    TextBox5.Text = t.Rows[0]["Fechas"].ToString();
                    TextBox6.Text = t.Rows[0]["Descripcion"].ToString();
                    DropDownList1.SelectedValue = t.Rows[0]["ID_Condicionn"].ToString();
                    
                }
                else
                {
                    this.confirminscrip.Visible = false;

                }

                if (Request.QueryString["cancelar"] != null)
                {
                    this.inscripciones.Visible = false;
                    this.cancelar.Visible = true;

                }
            }
        }

        protected void Acep_confirm_Click(object sender, EventArgs e)
        {
            //se hace el proceso de confimar la inscripcion
            string sql = "SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido + ' ' + Alumno.Nombre as ApellidoNombre, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Mesa.Descripcion, Estados.Nombre AS Estado, Condiciom.Descripcion AS Expr1 FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion where ID_Inscripcion=" + Request.QueryString["confirmar"];
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int estado = int.Parse(t.Rows[0]["ID_Estado"].ToString());
            int alum = int.Parse(t.Rows[0]["ID_Alumno"].ToString());
            //se obtuvo el id del alumno para luego conseguir el mail
            string sql2 = "select * from Alumno where ID_Alumno =" + alum;
            DataTable y = db.procesarselect(sql2);
            string correo = y.Rows[0]["Mail"].ToString();
            int idinscrip = int.Parse(Request.QueryString["confirmar"]);
            string mesa = t.Rows[0]["Descripcion"].ToString();
            bool r = db.Cambiar_Condicion(int.Parse(DropDownList1.SelectedValue), idinscrip);
            if (correo != null)
            {
                if (r == true)
                {
                    //se le hace le envio del mail avisando que le confirmo su incripcion a la mesa 
                    CCorreo objcorreo = new CCorreo(correo, "Aviso de Confirmacion", "Se te a aprobado la inscripcion a la mesa " + mesa);
                    if (objcorreo.Estado)
                    {
                        Response.Write("");
                    }
                    else
                    {
                        Response.Write("");
                    }
                }
                else
                {
                    Label1.Text = "No se pudo cambiar el estado del alumno ";
                }
            }
            else
            {

            }
        }

        protected void Acept_cancel_Click(object sender, EventArgs e)
        {
            //se hace el proceso de cancelar la inscripcion}
            string sql = "SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Confirmado = 0 and Cancelado = 0";
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int alum = int.Parse(t.Rows[0]["ID_Alumno"].ToString());
            int IDincrip = int.Parse(Request.QueryString["cancelar"]);
            bool r = db.Poner_Motivo(TextBoxMotivo.Text, IDincrip);
            if (r == true)
            {
                //se obtuvo el id del alumno para luego conseguir el mail
                string sql2 = "select * from Alumno where ID_Alumno =" + alum;
                DataTable y = db.procesarselect(sql2);
                string correo = y.Rows[0]["Mail"].ToString();
                string motivo = t.Rows[0]["Observaciones"].ToString();
                string mesa = t.Rows[0]["Descripcion"].ToString();
                //se le hace le envio del mail
                //mostrando en el mail el motivo recien agregado
                CCorreo objcorreo = new CCorreo(correo, "Aviso de Cancelacion", "Se te a Cancelado la inscripciona a la mesa " + mesa + " el motivo de dicha cancelacion es :" + motivo);
                if (objcorreo.Estado)
                {
                    Response.Write("");
                }
                else
                {
                    Response.Write("");
                }
            }
            else
            {
                Label1.Text = "No se pudo cancelar la inscripcion ";
            }
        }

        protected void Cancelar_confirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inscripciones-Profe.aspx");
        }

        protected void Cancel_Confirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inscripciones-Profe.aspx");
        }

         
    }
}