<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mesa-Alumno.aspx.cs" Inherits="Sistema_de_Inscripcion.Mesa_Alumno" %>

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
        <div id="mesaalumno" runat="server">

            <br />
            <br />
            <h3><b>Mesas de Examenes </b></h3>
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    Filtrar Por Carrera:<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Carrera" AutoPostBack="True" OnSelectedIndexChanged="Button1_Click"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />
                    <br />
                    <br />
                </div>
                <div class="col-sm">
                    Filtrar Por Materia:<br />
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="ID_Materia" AutoPostBack="True" OnSelectedIndexChanged="Button2_Click"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [ID_Materia], [Nombre] FROM [Materia]"></asp:SqlDataSource>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" Visible="False" />
                    <br />
                    <br />
                </div>
                <div class="col-sm">

                    Filtrar por Fecha:<br />
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Fecha" DataValueField="Fecha" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                    </asp:DropDownList>

                </div>
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" AllowPaging="True">
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
                <asp:BoundField DataField="Fecha_Inicio_Mesa_Hasta" HeaderText="Fecha_Inicio_Mesa_Hasta" SortExpression="Fecha_Inicio_Mesa_Hasta" Visible="False" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="Nueva-Incripcion-Alumno.aspx?idmesa=<%# Eval("ID_Mesa")%>" title="Inscribirse"></>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera, MesMesa.Fecha_Inicio_Mesa_Hasta FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa 
Where MesMesa.Fecha_Inicio_Mesa_Hasta &gt; GetDate()
ORDER BY Mesa_Examen.Fecha DESC"></asp:SqlDataSource>
    </form>
</body>
</html>
