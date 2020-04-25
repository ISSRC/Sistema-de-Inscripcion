<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mesas-Alumno(Prueba).aspx.cs" Inherits="Sistema_de_Inscripcion.Mesas_Alumno_Prueba_" %>

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
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h3><b><asp:Label ID="Label1" runat="server"></asp:Label></b></h3>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Mesa" HeaderText="Mesa" SortExpression="Mesa" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha" />
                <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                <asp:BoundField DataField="Titular" HeaderText="Titular" SortExpression="Titular" />
                <asp:BoundField DataField="Vocal1" HeaderText="Vocal1" SortExpression="Vocal1" />
                <asp:BoundField DataField="Vocal2" HeaderText="Vocal2" SortExpression="Vocal2" />
                <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                <asp:BoundField DataField="ID_Carrera" HeaderText="ID_Carrera" SortExpression="ID_Carrera" Visible="False" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="Inscripciones.aspx?idmesa=<%# Eval("ID_Mesa")%>" title="Inscribirse"></>
                            <img style="height: 35px" src="Fotos/inscribirse.png" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa ORDER BY Mesa_Examen.Fecha DESC"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
