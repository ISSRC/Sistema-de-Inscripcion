<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nueva-Inscripcion.aspx.cs" Inherits="Sistema_de_Inscripcion.Nueva_Inscripcion" %>

<%@ Register Src="~/Barra_Menu.ascx" TagPrefix="uc1" TagName="Barra_Menu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Barra_Menu runat="server" ID="Barra_Menu" />
    </div>
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        <br />
                        <h3><b>Nueva Inscripcion</b></h3>
                        <br />
                        <br />
                        Fecha<br />
                        <asp:TextBox ID="TextBoxFecha" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="LabelFecha" runat="server" Visible="False"></asp:Label>
                        <br />
                        <br />
                        Fecha de Examen<br />
                        <asp:DropDownList ID="DropMesMesa" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelccionarMesMesa"></asp:DropDownList>
                        <br />
                        <asp:Label ID="LabelLimite" runat="server"></asp:Label>
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        Mesa<br />
                        <asp:DropDownList ID="DropMesa" runat="server"></asp:DropDownList>
                        <br />
                        <br />
                        Alumno<br />
                        <asp:DropDownList ID="DropAlumno" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreApellido" DataValueField="ID_Alumno"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="Select ID_Alumno, Alumno.Apellido + ' ' + Alumno.Nombre as NombreApellido from Alumno"></asp:SqlDataSource>
                        <br />
                        <br />
                        Condicion<br />
                        <asp:DropDownList ID="DropCondicion" runat="server" DataSourceID="SqlDataSource2" DataTextField="Descripcion" DataValueField="ID_Condicion"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Condiciom]"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="LabelError" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Guardar" runat="server" Text="Guardar" OnClick="Button2_Click" />
                    &nbsp;
                        <asp:Button ID="Cancelar" runat="server" Text="Cancelar" OnClick="Button1_Click" />
                    </div>
                    <div class="col-sm">

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
