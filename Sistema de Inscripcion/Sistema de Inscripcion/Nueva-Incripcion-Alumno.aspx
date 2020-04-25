<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nueva-Incripcion-Alumno.aspx.cs" Inherits="Sistema_de_Inscripcion.Nueva_Incripcion_Alumno" %>

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
        <div id="divnuevaincrip" runat="server">
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
                        <asp:Label ID="Label2" runat="server" Text="Asegurese de que la fecha sea correcta" Visible="False"></asp:Label>
                        <br />
                        <br />
                        Fecha de Examen<br />
                        <asp:DropDownList ID="DropMesMesa" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionarMesMesa">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="LabelLimite" runat="server"></asp:Label>
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        Mesa<br />
                        <asp:DropDownList ID="DropMesa" runat="server" AutoPostBack="True"></asp:DropDownList>
                        <br />
                        <asp:Label ID="LabelMesaRepe" runat="server"></asp:Label>
                        <br />
                        Condicion<br />
                        <asp:DropDownList ID="DropCondicion" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="ID_Condicion"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Condiciom]"></asp:SqlDataSource>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="No se ha podido hacer la inscripcion compruebe los datos" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Cancel_inscrip" runat="server" Text="Cancelar" OnClick="Cancel_inscrip_Click" />
&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Guardar_inscrip" runat="server" Text="Guardar" OnClick="Guardar_inscrip_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
