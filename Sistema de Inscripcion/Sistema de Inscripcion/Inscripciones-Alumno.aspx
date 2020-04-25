<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscripciones-Alumno.aspx.cs" Inherits="Sistema_de_Inscripcion.Inscripciones_Alumno" %>

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
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <div id="dividinscripciones" runat="server">

                            <br />
                            <h3><b>Mis Inscripciones</b></h3>
                            <asp:Button ID="Nueva_inscripcion" runat="server" Text="Nueva Inscripcion" OnClick="Nueva_inscripcion_Click" />
                            <br />
                            <br />
                            <h4><b>Inscripciones Pendientes</b></h4>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="No se inscripto a ninguna mesa hasta el momento" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="689px" DataKeyNames="ID_Inscripcion">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="ID_Inscripcion" HeaderText="ID_Inscripcion" SortExpression="ID_Inscripcion" InsertVisible="False" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" Visible="False" />
                                    <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                                    <asp:BoundField DataField="ID_Alumno" HeaderText="ID_Alumno" SortExpression="ID_Alumno" Visible="False" />
                                    <asp:BoundField DataField="ID_Estado" HeaderText="ID_Estado" SortExpression="ID_Estado" Visible="False" />
                                    <asp:BoundField DataField="Obsevaciones" HeaderText="Obsevaciones" SortExpression="Obsevaciones" Visible="False" />
                                    <asp:BoundField DataField="ID_Condicionn" HeaderText="ID_Condicionn" SortExpression="ID_Condicionn" Visible="False" />
                                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                    <asp:BoundField DataField="Fechas" HeaderText="Fechas" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fechas" />
                                    <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" />
                                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                    <asp:BoundField DataField="Condicion" HeaderText="Condicion" SortExpression="Condicion" />
                                    <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                    <asp:BoundField DataField="ID_ProfesorTitular" HeaderText="ID_ProfesorTitular" SortExpression="ID_ProfesorTitular" Visible="False" />
                                    <asp:BoundField DataField="ID_Profesor" HeaderText="ID_Profesor" SortExpression="ID_Profesor" Visible="False" />
                                    <asp:CheckBoxField DataField="Confirmado" HeaderText="Confirmado" SortExpression="Confirmado" Visible="False" />
                                    <asp:CheckBoxField DataField="Cancelado" HeaderText="Cancelado" SortExpression="Cancelado" Visible="False" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Inscripcion] WHERE [ID_Inscripcion] = @ID_Inscripcion" InsertCommand="INSERT INTO [Inscripcion] ([ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion]) VALUES (@ID_Usuario, @Fecha, @Hora, @ID_Mesa, @ID_Alumno, @ID_Estado, @Obsevaciones, @ID_Condicion)" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Confirmado = 0 and Cancelado = 0" UpdateCommand="UPDATE [Inscripcion] SET [ID_Usuario] = @ID_Usuario, [Fecha] = @Fecha, [Hora] = @Hora, [ID_Mesa] = @ID_Mesa, [ID_Alumno] = @ID_Alumno, [ID_Estado] = @ID_Estado, [Obsevaciones] = @Obsevaciones, [ID_Condicion] = @ID_Condicion WHERE [ID_Inscripcion] = @ID_Inscripcion">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_Inscripcion" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Fecha" Type="String" />
                                    <asp:Parameter Name="Hora" Type="String" />
                                    <asp:Parameter Name="ID_Mesa" Type="Int32" />
                                    <asp:Parameter Name="ID_Alumno" Type="Int32" />
                                    <asp:Parameter Name="ID_Estado" Type="Int32" />
                                    <asp:Parameter Name="Obsevaciones" Type="String" />
                                    <asp:Parameter Name="ID_Condicion" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Fecha" Type="String" />
                                    <asp:Parameter Name="Hora" Type="String" />
                                    <asp:Parameter Name="ID_Mesa" Type="Int32" />
                                    <asp:Parameter Name="ID_Alumno" Type="Int32" />
                                    <asp:Parameter Name="ID_Estado" Type="Int32" />
                                    <asp:Parameter Name="Obsevaciones" Type="String" />
                                    <asp:Parameter Name="ID_Condicion" Type="Int32" />
                                    <asp:Parameter Name="ID_Inscripcion" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                        </div>
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <h4><b>Inscripciones Confirmadas</b></h4>
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Inscripcion" DataSourceID="SqlDataSource3" EmptyDataText="No se le ha confirmado ninguna inscripcion " ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID_Inscripcion" HeaderText="ID_Inscripcion" InsertVisible="False" ReadOnly="True" SortExpression="ID_Inscripcion" Visible="False" />
                                <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" Visible="False" />
                                <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                                <asp:BoundField DataField="ID_Alumno" HeaderText="ID_Alumno" SortExpression="ID_Alumno" Visible="False" />
                                <asp:BoundField DataField="ID_Estado" HeaderText="ID_Estado" SortExpression="ID_Estado" Visible="False" />
                                <asp:BoundField DataField="Obsevaciones" HeaderText="Obsevaciones" SortExpression="Obsevaciones" Visible="False" />
                                <asp:BoundField DataField="ID_Condicionn" HeaderText="ID_Condicionn" SortExpression="ID_Condicionn" Visible="False" />
                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                <asp:BoundField DataField="Fechas" HeaderText="Fechas" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fechas" />
                                <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                <asp:BoundField DataField="Condicion" HeaderText="Condicion" SortExpression="Condicion" />
                                <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                <asp:BoundField DataField="ID_ProfesorTitular" HeaderText="ID_ProfesorTitular" SortExpression="ID_ProfesorTitular" Visible="False" />
                                <asp:BoundField DataField="ID_Profesor" HeaderText="ID_Profesor" SortExpression="ID_Profesor" Visible="False" />
                                <asp:CheckBoxField DataField="Confirmado" HeaderText="Confirmado" SortExpression="Confirmado" Visible="False" />
                                <asp:CheckBoxField DataField="Cancelado" HeaderText="Cancelado" SortExpression="Cancelado" Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Inscripcion] WHERE [ID_Inscripcion] = @ID_Inscripcion" InsertCommand="INSERT INTO [Inscripcion] ([ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (@ID_Usuario, @Fecha, @Hora, @ID_Mesa, @ID_Alumno, @ID_Estado, @Obsevaciones, @ID_Condicion, @Confirmado, @Cancelado)" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Confirmado = 1" UpdateCommand="UPDATE [Inscripcion] SET [ID_Usuario] = @ID_Usuario, [Fecha] = @Fecha, [Hora] = @Hora, [ID_Mesa] = @ID_Mesa, [ID_Alumno] = @ID_Alumno, [ID_Estado] = @ID_Estado, [Obsevaciones] = @Obsevaciones, [ID_Condicion] = @ID_Condicion, [Confirmado] = @Confirmado, [Cancelado] = @Cancelado WHERE [ID_Inscripcion] = @ID_Inscripcion">
                            <DeleteParameters>
                                <asp:Parameter Name="ID_Inscripcion" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                <asp:Parameter Name="Fecha" Type="String" />
                                <asp:Parameter Name="Hora" Type="String" />
                                <asp:Parameter Name="ID_Mesa" Type="Int32" />
                                <asp:Parameter Name="ID_Alumno" Type="Int32" />
                                <asp:Parameter Name="ID_Estado" Type="Int32" />
                                <asp:Parameter Name="Obsevaciones" Type="String" />
                                <asp:Parameter Name="ID_Condicion" Type="Int32" />
                                <asp:Parameter Name="Confirmado" Type="Boolean" />
                                <asp:Parameter Name="Cancelado" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                <asp:Parameter Name="Fecha" Type="String" />
                                <asp:Parameter Name="Hora" Type="String" />
                                <asp:Parameter Name="ID_Mesa" Type="Int32" />
                                <asp:Parameter Name="ID_Alumno" Type="Int32" />
                                <asp:Parameter Name="ID_Estado" Type="Int32" />
                                <asp:Parameter Name="Obsevaciones" Type="String" />
                                <asp:Parameter Name="ID_Condicion" Type="Int32" />
                                <asp:Parameter Name="Confirmado" Type="Boolean" />
                                <asp:Parameter Name="Cancelado" Type="Boolean" />
                                <asp:Parameter Name="ID_Inscripcion" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <h4><b>Inscripciones Canceladas</b></h4>
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Inscripcion" DataSourceID="SqlDataSource2" EmptyDataText="No se le ah cancelado ninguna inscripcion" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID_Inscripcion" HeaderText="ID_Inscripcion" InsertVisible="False" ReadOnly="True" SortExpression="ID_Inscripcion" Visible="False" />
                                <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" Visible="False" />
                                <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                                <asp:BoundField DataField="ID_Alumno" HeaderText="ID_Alumno" SortExpression="ID_Alumno" Visible="False" />
                                <asp:BoundField DataField="ID_Estado" HeaderText="ID_Estado" SortExpression="ID_Estado" Visible="False" />
                                <asp:BoundField DataField="ID_Condicionn" HeaderText="ID_Condicionn" SortExpression="ID_Condicionn" Visible="False" />
                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                <asp:BoundField DataField="Fechas" HeaderText="Fechas" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fechas" />
                                <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                <asp:BoundField DataField="Condicion" HeaderText="Condicion" SortExpression="Condicion" />
                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                <asp:BoundField DataField="Obsevaciones" HeaderText="Obsevaciones" SortExpression="Obsevaciones" />
                                <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                                <asp:BoundField DataField="ID_ProfesorTitular" HeaderText="ID_ProfesorTitular" SortExpression="ID_ProfesorTitular" Visible="False" />
                                <asp:BoundField DataField="ID_Profesor" HeaderText="ID_Profesor" SortExpression="ID_Profesor" Visible="False" />
                                <asp:CheckBoxField DataField="Confirmado" HeaderText="Confirmado" SortExpression="Confirmado" Visible="False" />
                                <asp:CheckBoxField DataField="Cancelado" HeaderText="Cancelado" SortExpression="Cancelado" Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Inscripcion] WHERE [ID_Inscripcion] = @ID_Inscripcion" InsertCommand="INSERT INTO [Inscripcion] ([ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (@ID_Usuario, @Fecha, @Hora, @ID_Mesa, @ID_Alumno, @ID_Estado, @Obsevaciones, @ID_Condicion, @Confirmado, @Cancelado)" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Cancelado = 1" UpdateCommand="UPDATE [Inscripcion] SET [ID_Usuario] = @ID_Usuario, [Fecha] = @Fecha, [Hora] = @Hora, [ID_Mesa] = @ID_Mesa, [ID_Alumno] = @ID_Alumno, [ID_Estado] = @ID_Estado, [Obsevaciones] = @Obsevaciones, [ID_Condicion] = @ID_Condicion, [Confirmado] = @Confirmado, [Cancelado] = @Cancelado WHERE [ID_Inscripcion] = @ID_Inscripcion">
                            <DeleteParameters>
                                <asp:Parameter Name="ID_Inscripcion" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                <asp:Parameter Name="Fecha" Type="String" />
                                <asp:Parameter Name="Hora" Type="String" />
                                <asp:Parameter Name="ID_Mesa" Type="Int32" />
                                <asp:Parameter Name="ID_Alumno" Type="Int32" />
                                <asp:Parameter Name="ID_Estado" Type="Int32" />
                                <asp:Parameter Name="Obsevaciones" Type="String" />
                                <asp:Parameter Name="ID_Condicion" Type="Int32" />
                                <asp:Parameter Name="Confirmado" Type="Boolean" />
                                <asp:Parameter Name="Cancelado" Type="Boolean" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                <asp:Parameter Name="Fecha" Type="String" />
                                <asp:Parameter Name="Hora" Type="String" />
                                <asp:Parameter Name="ID_Mesa" Type="Int32" />
                                <asp:Parameter Name="ID_Alumno" Type="Int32" />
                                <asp:Parameter Name="ID_Estado" Type="Int32" />
                                <asp:Parameter Name="Obsevaciones" Type="String" />
                                <asp:Parameter Name="ID_Condicion" Type="Int32" />
                                <asp:Parameter Name="Confirmado" Type="Boolean" />
                                <asp:Parameter Name="Cancelado" Type="Boolean" />
                                <asp:Parameter Name="ID_Inscripcion" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
