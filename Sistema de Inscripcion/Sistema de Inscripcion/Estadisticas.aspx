<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estadisticas.aspx.cs" Inherits="Sistema_de_Inscripcion.Estadisticas" %>

<%@ Register assembly="WebChart" namespace="WebChart" tagprefix="Web" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
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

            <br />
            <br />
            <h3><b>Estadisticas Generales</b></h3>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        <h5><b>Alumnos inscriptos por carrera</b></h5>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                            <series>
                                <asp:Series Name="Software" YValuesPerPoint="4" XValueMember="Nombre" YValueMembers="Cantidad_de_Alumnos">
                                </asp:Series>
                                <asp:Series ChartArea="ChartArea1" Name="Turismo">
                                </asp:Series>
                                <asp:Series ChartArea="ChartArea1" Name="Trecking">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </chartareas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Carrera.Nombre, COUNT(*) AS Cantidad_de_Alumnos FROM Alumno FULL OUTER JOIN Inscripcion ON Alumno.ID_Alumno = Inscripcion.ID_Alumno FULL OUTER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa FULL OUTER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia FULL OUTER JOIN Carrera ON Materia.ID_Carrera = Carrera.ID_Carrera GROUP BY Carrera.ID_Carrera, Carrera.Nombre"></asp:SqlDataSource>
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <h5><b>Alumnos inscriptos por mesas</b></h5>
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                            <Series>
                                <asp:Series Name="Alumnos" IsValueShownAsLabel="True" XValueMember="Mesa" YValueMembers="Cantidad_de_Alumnos">
                                </asp:Series>
                                <asp:Series ChartArea="ChartArea1" Name="Series1">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Mesa, Alumno, Cantidad_de_Alumnos FROM AlumnosXMesas"></asp:SqlDataSource>
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <h5><b>Porcentaje de alumnos regulares y libres por carrera</b></h5>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Alumnos_Regulares]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
