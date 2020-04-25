<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImprimirMesas.aspx.cs" Inherits="Sistema_de_Inscripcion.ImprimirMesas" %>

<%@ Register Src="~/Barra_Menu.ascx" TagPrefix="uc1" TagName="Barra_Menu" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>


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
        <div id="divimprimir" runat="server">
    <div class="container">
  <div class="row">
    <div class="col-sm">
        <br />
    </div>
    <div class="col-sm">
        <br />
        <br />
        <br />
        <h3><b> Instituto Superior Santa Rosa de Calamuchita </b></h3>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Mesa" HeaderText="Mesa" SortExpression="Mesa" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                <asp:BoundField DataField="Titular" HeaderText="Titular" SortExpression="Titular" />
                <asp:BoundField DataField="Vocal1" HeaderText="Vocal1" SortExpression="Vocal1" />
                <asp:BoundField DataField="Vocal2" HeaderText="Vocal2" SortExpression="Vocal2" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Mesa_Examen]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <input id="Imprimi_mesas" type="button" value="Imprimir" onclick="window.print();"/>
        <!--<asp:Button ID="Imprimir" runat="server" OnClientClick="return printpage()" Text="Imprimir las Mesas" />!--> 

    </div>
    <div class="col-sm">
      <br />
    </div>
  </div>
</div>
            </div>
    </div>
    </form>
      <script>
          function printpage() {

              var getpanel = document.getElementById("ImprimirMesas.aspx");
              var MainWindow = window.open('', '', 'height=500,width=800');
              MainWindow.document.write('<html><head><title>Print Page</title>');
              MainWindow.document.write('</head><body>');
              MainWindow.document.write(getpanel.innerHTML);
              MainWindow.document.write('</body></html>');
              MainWindow.document.close();
              setTimeout(function () {
                  MainWindow.print();
              }, 500);
              return false;

          }

    </script>
</body>
</html>
