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
    public partial class PaginaExamen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            string sql = "Select * from Inscripcion";
            DataTable t = db.procesarselect(sql);
            int conta = 0;
            int y = int.Parse(TextBox1.Text);
            for (int i = 0; i < t.Rows.Count;i++)
            {
                int u = int.Parse(t.Rows[i]["ID_Alumno"].ToString());
                if(u == y)
                {
                    conta = conta + 1;
                    Label1.Text = conta.ToString();
                    int b = int.Parse(t.Rows[i]["ID_Mesa"].ToString());
                    string sql1 = "select * from Mesa_Examen where ID_Mesa =" + b;
                    DataTable a = db.procesarselect("select * from Mesa_Examen where ID_Mesa =" + b);   
                    Label2.Text += " <div class='card'>"; 
                    Label2.Text += "<h5 class='card-header'>" + a.Rows[0]["Fecha"].ToString() + "</h5>";
                    Label2.Text += "<div class='card-body'>";
                    Label2.Text += "<h5 class='card-title'>" + a.Rows[0]["Titular"].ToString() + "</h5>";
                    Label2.Text += "<p class='card-text'>" + " - " + a.Rows[0]["Vocal1"].ToString()  + " - " + a.Rows[0]["Vocal2"].ToString() + " - " + a.Rows[0]["Materia"].ToString() + "</p>";
                    Label2.Text += "</div>";
                    Label2.Text += "</div>";
                    /*
                    Label2.Text = Label2.Text + " - " + a.Rows[0]["Fecha"].ToString();
                    Label3.Text = Label3.Text + " - " + a.Rows[0]["Titular"].ToString();
                    Label4.Text = Label4.Text + " - " + a.Rows[0]["Vocal1"].ToString();
                    Label5.Text = Label5.Text + " - " + a.Rows[0]["Vocal2"].ToString();
                    Label6.Text = Label6.Text + " - " + a.Rows[0]["Materia"].ToString();
                     */
                }
            }

        }
    }
}