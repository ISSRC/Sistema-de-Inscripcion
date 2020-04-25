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
    public partial class Mesas_Profe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int user = (int)Session["ID_User"];
            string sql = "select * from Usuarios where ID_Usuario =" + user;
            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect(sql);
            int idusu = int.Parse(t.Rows[0]["ID_Usuario"].ToString());
            string prof = "select * from Profesor where ID_Usuario =" + idusu;
            DataTable y = db.procesarselect(prof);
            //if (y != null)
            //{
                int idpro = int.Parse(y.Rows[0]["ID_Profesor"].ToString());
                string sql1 = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera, Carrera.Nombre FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera  where ID_ProfesorTitular =" + idpro + " ORDER BY Mesa_Examen.Fecha DESC";
                SqlDataSource1.SelectCommand = sql1;
            //}
            //else
            //{
                //Label1.Text = "Usted no tiene mesas asiganda hasta el momento";
            //}
            
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera, Carrera.Nombre FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera where Mesa.ID_Materia =" + DropDownList2.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = sql;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql1 = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera, Carrera.Nombre FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera where MesMesa.ID_Carrea =" + DropDownList1.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = sql1;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql1 = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera, Carrera.Nombre FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera where Mesa.Fecha =" + DropDownList3.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = sql1;
        }
    }
}