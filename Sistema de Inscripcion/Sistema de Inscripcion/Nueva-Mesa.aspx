<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nueva-Mesa.aspx.cs" Inherits="Sistema_de_Inscripcion.Nueva_Mesa" %>

<%@ Register Src="~/Barra_Menu.ascx" TagPrefix="uc1" TagName="Barra_Menu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:Barra_Menu runat="server" ID="Barra_Menu" />
        </div>
        <div id="divnuevamesa" runat="server">
            <br />
            <br />
            <h3><b>Nueva Mesa de Examen</b></h3>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        Materia<br />
                        <asp:DropDownList ID="DropMateria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionarMateria"></asp:DropDownList>
                        <br />
                        <br />
                        Fecha<br />
                        <asp:TextBox ID="TextBoxFecha" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="TextBoxFecha_CalendarExtender" runat="server" TargetControlID="TextBoxFecha" />
                        <br />
                        <asp:Label ID="LabelFecha" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <br />
                        Hora<br />
                        <asp:TextBox ID="TextBoxHora" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        Mesa de Examen<br />
                        <asp:DropDownList ID="DropMesMesa" runat="server" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="ID_MesMesa"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [Descripcion], [ID_MesMesa] FROM [MesMesa]"></asp:SqlDataSource>
                        <br />
                        <br />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm">
                                    <div>
                                        Profesor Tutular<br />
                                        <asp:DropDownList ID="DropProfeTitular" runat="server" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm">
                                    <div>
                                        Profesor Vocal 1<br />
                                        <asp:DropDownList ID="DropProfeVocal1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionarVocal1">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Button ID="Calcel_new_mesa" runat="server" OnClick="Calcel_new_mesa_Click" Text="Cancelar" />
                                    </div>
                                </div>
                                <div class="col-sm">
                                    <div>
                                        Profesor Vocal 2<br />
                                        <asp:DropDownList ID="DropProfeVocal2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionarVocal2">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelMesaAgregada" runat="server"></asp:Label>
                                        <br />
                                        <asp:Label ID="LabelError" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Button ID="Guardar_new_Mesa" runat="server" Text="Guardar" OnClick="Guardar_new_Mesa_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
