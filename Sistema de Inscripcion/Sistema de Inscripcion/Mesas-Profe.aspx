<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mesas-Profe.aspx.cs" Inherits="Sistema_de_Inscripcion.Mesas_Profe" %>

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
        <div>
            <br />
            <h3><b>Mesas de Examen</b></h3>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        Filtrar por Materia:
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Materia" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Materia]"></asp:SqlDataSource>
                        <br />
                    </div>
                    <div class="col-sm">
                        Filtrar por Carrera :
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="ID_Carrera" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm">
                        Filtrar por Fecha :
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="Fecha" DataValueField="Fecha" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="No esta anotado en ninguna mesa" ForeColor="#333333" GridLines="None" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Mesa" HeaderText="Mesa" SortExpression="Mesa" />
                    <asp:BoundField DataField="Nombre" HeaderText="Carrera" SortExpression="Nombre" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha" />
                    <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                    <asp:BoundField DataField="Titular" HeaderText="Titular" SortExpression="Titular" />
                    <asp:BoundField DataField="Vocal1" HeaderText="Vocal1" SortExpression="Vocal1" />
                    <asp:BoundField DataField="Vocal2" HeaderText="Vocal2" SortExpression="Vocal2" />
                    <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                    <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                    <asp:BoundField DataField="ID_Carrera" HeaderText="ID_Carrera" SortExpression="ID_Carrera" Visible="False" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Mesa] WHERE [ID_Mesa] = @ID_Mesa" InsertCommand="INSERT INTO [Mesa] ([Descripcion], [ID_Materia], [Fecha], [Hora], [ID_MesMesa], [ID_ProfesorTitular], [ID_ProfesorVocal1], [ID_ProfesorVocal2]) VALUES (@Descripcion, @ID_Materia, @Fecha, @Hora, @ID_MesMesa, @ID_ProfesorTitular, @ID_ProfesorVocal1, @ID_ProfesorVocal2)" SelectCommand="SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera, Carrera.Nombre FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera ORDER BY Mesa_Examen.Fecha DESC" UpdateCommand="UPDATE [Mesa] SET [Descripcion] = @Descripcion, [ID_Materia] = @ID_Materia, [Fecha] = @Fecha, [Hora] = @Hora, [ID_MesMesa] = @ID_MesMesa, [ID_ProfesorTitular] = @ID_ProfesorTitular, [ID_ProfesorVocal1] = @ID_ProfesorVocal1, [ID_ProfesorVocal2] = @ID_ProfesorVocal2 WHERE [ID_Mesa] = @ID_Mesa">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Mesa" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="ID_Materia" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Fecha" />
                    <asp:Parameter Name="Hora" Type="String" />
                    <asp:Parameter Name="ID_MesMesa" Type="Int32" />
                    <asp:Parameter Name="ID_ProfesorTitular" Type="Int32" />
                    <asp:Parameter Name="ID_ProfesorVocal1" Type="Int32" />
                    <asp:Parameter Name="ID_ProfesorVocal2" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="ID_Materia" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Fecha" />
                    <asp:Parameter Name="Hora" Type="String" />
                    <asp:Parameter Name="ID_MesMesa" Type="Int32" />
                    <asp:Parameter Name="ID_ProfesorTitular" Type="Int32" />
                    <asp:Parameter Name="ID_ProfesorVocal1" Type="Int32" />
                    <asp:Parameter Name="ID_ProfesorVocal2" Type="Int32" />
                    <asp:Parameter Name="ID_Mesa" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
