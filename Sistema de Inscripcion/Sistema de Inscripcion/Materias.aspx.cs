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
    public partial class Materias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.divnuevacarrera.Visible = false;
            this.divnuevamateria.Visible = false;
            this.diveditarmateria.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string SQL = "select * from Materia where ID_Materia=" + Request.QueryString["id"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.divmaterias.Visible = false;
                    this.diveditarmateria.Visible = true;
                    DropDownList5.SelectedValue = t.Rows[0]["ID_Profesor"].ToString();
                    DropDownList2.SelectedValue = t.Rows[0]["ID_Carrera"].ToString();
                    DropDownList3.SelectedValue = t.Rows[0]["Curso"].ToString();
                    TextBoxNomMatE.Text = t.Rows[0]["Nombre"].ToString();

                }

                else
                {
                    this.diveditarmateria.Visible = false;
                }

                if (Request.QueryString["id2"] != null)
                {
                    string SQL = "select * from Carrera where ID_Carrera=" + Request.QueryString["id2"];
                    AdminDB DB = new AdminDB();
                    DataTable t = DB.procesarselect(SQL);
                    this.divmaterias.Visible = false;
                    this.diveditarmateria.Visible = false;
                    this.diveditcarrera.Visible = true;
                    TextBoxNomCarre.Text = t.Rows[0]["Nombre"].ToString();

                }

                else
                {
                    this.diveditcarrera.Visible = false;
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //se selecciona la opcion de filtro elejida en el Drop
            string sql = "select * from Materias_Completas where ID_Carrera=" + DropDownList1.SelectedValue;

            if (DropDownList1.SelectedValue == "4")
            {
                string sql1 = "select * from Materias_Completas";
                SqlDataSource1.SelectCommand = sql1;
            }

            if (DropDownList1.SelectedValue == "0")
            {
                string sql2 = "select * from Materias_Completas order by Profesor";
                SqlDataSource1.SelectCommand = sql2;
            }



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //se busca segun lo escrito en el textbox
            AdminDB db = new AdminDB();
            string sql = "select * from Materias_Completas where Carrera like '%" + TextBox1.Text + "%' or Materia like '%" + TextBox1.Text + "%' or Profesor like '%" + TextBox1.Text + "%'";
            SqlDataSource1.SelectCommand = sql;
        }

        protected void Nueva_materia_Click(object sender, EventArgs e)
        {
            this.divmaterias.Visible = false;
            this.divnuevamateria.Visible = true;
        }

        protected void Save_new_mat_Click(object sender, EventArgs e)
        {
            //se lleva acabo el proceso de nueva materia
            //en caso de que el nombre de la materia este vacio se cancela el insert
            if (TextBox2.Text != "")
            {
                AdminDB db = new AdminDB();
                bool r = db.Insert_Materia(TextBox2.Text, int.Parse(DropDownList6.SelectedValue), DropDownList8.SelectedValue.ToString(), int.Parse(DropDownList7.SelectedValue));
                if (r == true)
                {
                    Response.Redirect("Materias.aspx");
                }
                else
                {
                    Label1.Text = "No se pudo añadir la materia ";
                }
            }
            else
            {
                LabelNommat.Text = "Este campo es obligatorio";
            }
        }

        protected void Guar_edit_mat_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int ID = int.Parse(Request.QueryString["id"]);
            bool r = db.Editar_Materia(TextBoxNomMatE.Text, int.Parse(DropDownList2.SelectedValue), DropDownList3.SelectedValue.ToString(), int.Parse(DropDownList5.SelectedValue), ID);
            if(r == true)
            {
                Response.Redirect("Materias.aspx");
            }
            else
            {
                Label2.Text = "No se pudo actualizar los datos de la materia";
            }
        }

        protected void Cancel_new_mat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Materias.aspx");
        }

        protected void Cancel_edit_mat_Click(object sender, EventArgs e)
        {
            Response.Redirect("Materias.aspx");
        }

        protected void Guardar_carre_Click(object sender, EventArgs e)
        {
            if (TextBox_new_car.Text != "")
            {
                AdminDB db = new AdminDB();
                bool r = db.Nueva_Carrera(TextBox_new_car.Text);
                if (r == true)
                {
                    Response.Redirect("Materias.aspx");
                }
                else
                {
                    Labelerrorcarre.Text = "Hubo un error al agregar la carrera";
                }
            }
            else
            {
                LabelNomCarre.Text = "Este campo no puede estar vacio";
            }
        }

        protected void Cancel_carre_Click(object sender, EventArgs e)
        {
            Response.Redirect("Materias.aspx");
        }

        protected void Nueva_carrera_Click(object sender, EventArgs e)
        {
            this.divnuevacarrera.Visible = true;
            this.divmaterias.Visible = false;
        }

        protected void Cancel_Edit_Carr_Click(object sender, EventArgs e)
        {
            Response.Redirect("Materias.aspx");
        }

        protected void Guardar_Edit_Carr_Click(object sender, EventArgs e)
        {
            AdminDB db = new AdminDB();
            int ID = int.Parse(Request.QueryString["id2"]);
            if (TextBoxNomCarre.Text != "")
            {
                bool r = db.Actualizar_Carrera(TextBoxNomCarre.Text, ID);
                if (r == true)
                {
                    Response.Redirect("Materias.aspx");
                }
                else
                {
                    LabelError.Text = "Hubo un error al editar la carrera";
                }
            }
            else
            {
                LabelNomCarE.Text = "Este campo no puede estar vacio";
            }
        }
    }
}