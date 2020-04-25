<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscripciones-Profe.aspx.cs" Inherits="Sistema_de_Inscripcion.Inscripciones_Profe" %>

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
        <div id="inscripciones" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <h3><b>Inscripciones Pendientes</b></h3>
                        <asp:Label ID="Label2" runat="server" Text="No tiene alumnos inscriptos a una mesa" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Inscripcion" DataSourceID="SqlDataSource1" EmptyDataText="No tiene alumnos incriptos hasta el momento" ForeColor="#333333" GridLines="None">
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
                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                <asp:BoundField DataField="Fechas" HeaderText="Fechas" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fechas" />
                                <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                <asp:BoundField DataField="Condicion" HeaderText="Condicion" SortExpression="Condicion" />
                                <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                                <asp:BoundField DataField="ID_ProfesorTitular" HeaderText="ID_ProfesorTitular" SortExpression="ID_ProfesorTitular" Visible="False" />
                                <asp:BoundField DataField="ID_Profesor" HeaderText="ID_Profesor" SortExpression="ID_Profesor" Visible="False" />
                                <asp:CheckBoxField DataField="Confirmado" HeaderText="Confirmado" SortExpression="Confirmado" Visible="False" />
                                <asp:CheckBoxField DataField="Cancelado" HeaderText="Cancelado" SortExpression="Cancelado" Visible="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href="Inscripciones-Profe.aspx?confirmar=<%# Eval("ID_Inscripcion")%>" title="Confimar Inscripcion"></>
                                            <img style="height: 25px" src="Fotos/confirmar.png" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href="Inscripciones-Profe.aspx?cancelar=<%# Eval("ID_Inscripcion")%>" title="Cancelar Inscripcion"></>
                                            <img style="height: 25px" src="Fotos/cancelarr.png" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Inscripcion] WHERE [ID_Inscripcion] = @ID_Inscripcion" InsertCommand="INSERT INTO [Inscripcion] ([ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion]) VALUES (@ID_Usuario, @Fecha, @Hora, @ID_Mesa, @ID_Alumno, @ID_Estado, @Obsevaciones, @ID_Condicion)" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Inscripcion.Confirmado = 0 and Inscripcion.Cancelado = 0" UpdateCommand="UPDATE [Inscripcion] SET [ID_Usuario] = @ID_Usuario, [Fecha] = @Fecha, [Hora] = @Hora, [ID_Mesa] = @ID_Mesa, [ID_Alumno] = @ID_Alumno, [ID_Estado] = @ID_Estado, [Obsevaciones] = @Obsevaciones, [ID_Condicion] = @ID_Condicion WHERE [ID_Inscripcion] = @ID_Inscripcion">
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
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <h3><b>Inscripciones Confirmadas</b></h3>
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Inscripcion" DataSourceID="SqlDataSource4" EmptyDataText="No tiene inscripciones confirmadas" ForeColor="#333333" GridLines="None" AllowPaging="True">
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Inscripcion.Confirmado = 1">
                        </asp:SqlDataSource>
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <h3><b>Inscripciones Canceladas</b></h3>
                        <br />
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Inscripcion" DataSourceID="SqlDataSource3" EmptyDataText="No tiene oncripciones canceladas" ForeColor="#333333" GridLines="None">
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Inscripcion] WHERE [ID_Inscripcion] = @ID_Inscripcion" InsertCommand="INSERT INTO [Inscripcion] ([ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion], [Confirmado], [Cancelado]) VALUES (@ID_Usuario, @Fecha, @Hora, @ID_Mesa, @ID_Alumno, @ID_Estado, @Obsevaciones, @ID_Condicion, @Confirmado, @Cancelado)" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion AS ID_Condicionn, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Fechas, Mesa.Hora AS Horas, Estados.Nombre AS Estado, Condiciom.Descripcion AS Condicion, Mesa.ID_Materia, Materia.Nombre AS Materia, Mesa.ID_ProfesorTitular, Materia.ID_Profesor, Inscripcion.Confirmado, Inscripcion.Cancelado FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado INNER JOIN Condiciom ON Inscripcion.ID_Condicion = Condiciom.ID_Condicion INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia where Inscripcion.Cancelado = 1" UpdateCommand="UPDATE [Inscripcion] SET [ID_Usuario] = @ID_Usuario, [Fecha] = @Fecha, [Hora] = @Hora, [ID_Mesa] = @ID_Mesa, [ID_Alumno] = @ID_Alumno, [ID_Estado] = @ID_Estado, [Obsevaciones] = @Obsevaciones, [ID_Condicion] = @ID_Condicion, [Confirmado] = @Confirmado, [Cancelado] = @Cancelado WHERE [ID_Inscripcion] = @ID_Inscripcion">
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
        <div id="confirminscrip" runat="server">
            <br />
            <br />
            <h3><b>Confirmar Inscripcion</b></h3>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        Alumno<br />
                        <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        Hora<br />
                        <asp:TextBox ID="TextBox4" runat="server" Enabled="False" Width="188px"></asp:TextBox>
                        <br />
                        <br />
                        Fecha<br />
                        <asp:TextBox ID="TextBox5" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="col-sm">
                        Mesa
                        <br />
                        <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
                        <br />
                        <br />
                        Condicion<br />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Descripcion" DataValueField="ID_Condicion">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Condiciom]"></asp:SqlDataSource>

                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <br />
                        <br />

                        <asp:Button ID="Acep_confirm" runat="server" Text="Aceptar" OnClick="Acep_confirm_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Cancelar_confirm" runat="server" OnClick="Cancelar_confirm_Click" Text="Cancelar" />
                    </div>
                </div>
            </div>

        </div>
        <div id="cancelar" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        <h3><b>Cancelar Inscripcion</b></h3>
                        <br />
                        Motivo
                        <br />
                        <asp:TextBox ID="TextBoxMotivo" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Acept_cancel" runat="server" OnClick="Acept_cancel_Click" Text="Aceptar" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Cancel_Confirm" runat="server" OnClick="Cancel_Confirm_Click" Text="Cancelar" />
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
