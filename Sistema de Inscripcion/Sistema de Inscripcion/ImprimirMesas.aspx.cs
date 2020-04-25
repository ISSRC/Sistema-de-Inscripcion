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
    public partial class ImprimirMesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            AdminDB db = new AdminDB();
            DataTable t = db.procesarselect("SELECT dbo.MesMesa.Descripcion AS Mesa, dbo.Materia.Nombre AS Materia, dbo.Mesa.Fecha, dbo.Mesa.Hora, p.Apellido AS Titular, pp.Apellido AS Vocal1, ppp.Apellido AS Vocal2, dbo.Mesa.ID_Mesa, dbo.MesMesa.ID_MesMesa FROM dbo.Mesa INNER JOIN dbo.MesMesa ON dbo.Mesa.ID_MesMesa = dbo.MesMesa.ID_MesMesa INNER JOIN dbo.Materia ON dbo.Mesa.ID_Materia = dbo.Materia.ID_Materia INNER JOIN dbo.Profesor AS p ON p.ID_Profesor = dbo.Mesa.ID_ProfesorTitular INNER JOIN dbo.Profesor AS pp ON pp.ID_Profesor = dbo.Mesa.ID_ProfesorVocal1 INNER JOIN dbo.Profesor AS ppp ON ppp.ID_Profesor = dbo.Mesa.ID_ProfesorVocal2");
            for (int i = 0; i < t.Rows.Count;i++)
            {
                //if(t.Rows[i]["ID_MesMesa"] == )
                //{

                Label1.Text += "<table class='ble table-bordered'>";
                Label1.Text += "<thead>";
                Label1.Text += "<tr>";
                Label1.Text += "<td colspan='3'>" + t.Rows[0]["Mesa"] + "</td>";
                Label1.Text += "</tr>";
                Label1.Text += "</thead>";
                Label1.Text += "<tbody>";
                Label1.Text += "<tr>";
                Label1.Text += "<td>" + t.Rows[0]["Materia"] + "</td>";
                Label1.Text += "<td>" + t.Rows[0]["Fecha"] + "<br/>" + t.Rows[0]["Hora"] + "</td>";
                Label1.Text += "<td>" + t.Rows[0]["Titular"] + " " + t.Rows[0]["Vocal1"] + " " + t.Rows[0]["Vocal2"] + "</td>";
                Label1.Text += "</tbody>";
                Label1.Text += "</table>";

                //}
            }


            
        }

    }
}