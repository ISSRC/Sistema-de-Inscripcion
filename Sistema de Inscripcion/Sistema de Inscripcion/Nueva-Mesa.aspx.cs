using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_de_Inscripcion
{
    public partial class Nueva_Mesa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ni bien se carga la pagina se hace el llenado de los dropsdown 
                IniciarllenadoDrops();
            }
        }

        protected void Calcel_new_mesa_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mesas.aspx");
        }

        protected void Guardar_new_Mesa_Click(object sender, EventArgs e)
        {
            //se comprueba que la fecha del la mesa sea mayor a la fecha actual
            if ( Convert.ToDateTime(TextBoxFecha.Text).Date > DateTime.Today.Date)
            {
                //se comprueba que los profesores no se repitan
                if ((DropProfeTitular.SelectedValue != DropProfeVocal1.SelectedValue) && (DropProfeVocal1.SelectedValue != DropProfeVocal2.SelectedValue))
                {
                    AdminDB db = new AdminDB();
                    bool r = db.Alta_Mesa("", int.Parse(DropMateria.Text), DateTime.Parse(TextBoxFecha.Text), TextBoxHora.Text, int.Parse(DropMesMesa.Text), int.Parse(DropProfeTitular.Text), int.Parse(DropProfeVocal1.Text), int.Parse(DropProfeVocal2.Text));
                    if (r == true)
                    {
                        LabelMesaAgregada.Text = "Nueva mesa agregada";
                        Response.Redirect("Mesas.aspx");
                    }
                }
                else
                {
                    LabelError.Text = "Error al agregar la mesa";
                }
            }
            else
            {
                LabelFecha.Text = "La fecha tiene que ser mayor a la del dia de hoy";
                TextBoxFecha.Text = "";
            }
        }

        private void IniciarllenadoDrops()
        {
            //se llenan el Drop de la Materia
            AdminDB db = new AdminDB();
            DropMateria.DataSource = db.procesarselect("SELECT [ID_Materia], [Nombre] FROM [Materia]");
            DropMateria.DataTextField = "Nombre";
            DropMateria.DataValueField = "ID_Materia";
            DropMateria.DataBind();
            //se llena el drop de el profesor vocal
            DropProfeVocal1.DataSource = db.procesarselect("select ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor");
            DropProfeVocal1.DataTextField = "NombreApellido";
            DropProfeVocal1.DataValueField = "ID_Profesor";
            DropProfeVocal1.DataBind();
            //se llena el drop de el profesor vocal 2
            DropProfeVocal2.DataSource = db.procesarselect("select ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor");
            DropProfeVocal2.DataTextField = "NombreApellido";
            DropProfeVocal2.DataValueField = "ID_Profesor";
            DropProfeVocal2.DataBind();
            //Se le agrega al principio del dropdown un Item seleccionar
            DropMateria.Items.Insert(0, new ListItem("[Seleccionar una Materia]", "0"));
            DropProfeTitular.Items.Insert(0, new ListItem("[Seleccionar un Profesor]", "0"));

        }

        protected void SeleccionarMateria(object sender, EventArgs e)
        {
            //se ejecuta el metodo SeleccionarMateria
            //se pone que el profesor titular se el que dicta la materia
            AdminDB db = new AdminDB();
            int MateriaID = Convert.ToInt32(DropMateria.SelectedValue);
            DropProfeTitular.DataSource = db.procesarselect("select Profesor.ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido,Materia.Nombre, Materia.ID_Profesor as ID_Prof, Materia.ID_Materia from Profesor join Materia on Profesor.ID_Profesor = Materia.ID_Profesor where Materia.ID_Materia =" + MateriaID);
            DropProfeTitular.DataTextField = "NombreApellido";
            DropProfeTitular.DataValueField = "ID_Profesor";
            DropProfeTitular.DataBind();
        }

        protected void SeleccionarVocal1(object sender, EventArgs e)
        {
            //se pone que el Drop de profe vocal2 no tenga el profe seleccionado en el Drop de profe vocal1
            AdminDB db = new AdminDB();
            int ProfeID = Convert.ToInt32(DropProfeVocal1.SelectedValue);
            DropProfeVocal2.DataSource = db.procesarselect("select ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor where Profesor.ID_Profesor !=" + ProfeID);
            DropProfeVocal2.DataTextField = "NombreApellido";
            DropProfeVocal2.DataValueField = "ID_Profesor";
            DropProfeVocal2.DataBind();
        }

        protected void SeleccionarVocal2(object sender, EventArgs e)
        {
            //se pone que el Drop de profe vocal1 no tenga el profe seleccionado en el Drop de profe vocal2
            AdminDB db = new AdminDB();
            int Profe2ID = Convert.ToInt32(DropProfeVocal2.SelectedValue);
            DropProfeVocal1.DataSource = db.procesarselect("select ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor where Profesor.ID_Profesor !=" + Profe2ID);
            DropProfeVocal1.DataTextField = "NombreApellido";
            DropProfeVocal1.DataValueField = "ID_Profesor";
            DropProfeVocal1.DataBind();
        }
    }
}