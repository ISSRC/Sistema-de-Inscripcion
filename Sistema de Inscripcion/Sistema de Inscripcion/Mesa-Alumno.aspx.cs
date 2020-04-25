using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_de_Inscripcion
{
    public partial class Mesa_Alumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa where ID_Carrera =" + DropDownList1.SelectedValue + " ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = sql;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa  where Mesa.ID_Materia =" + DropDownList2.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = sql;
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa  where Mesa.Fecha =" + DropDownList2.SelectedValue + "ORDER BY Mesa_Examen.Fecha DESC";
            SqlDataSource1.SelectCommand = sql;
        }
    }
}