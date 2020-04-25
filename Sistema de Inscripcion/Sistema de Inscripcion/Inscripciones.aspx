<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inscripciones.aspx.cs" Inherits="Sistema_de_Inscripcion.Inscripciones" %>

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
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div id="dividinscripciones" runat="server">

                        <br />
                        <h3><b>Inscripciones</b></h3>
                        <br />
                        <asp:Button ID="Nuevains" runat="server" OnClick="Nuevains_Click" Text="Nueva Inscripcion" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Inscripcion" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" Width="689px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID_Inscripcion" HeaderText="ID_Inscripcion" SortExpression="ID_Inscripcion" InsertVisible="False" ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" ValidateRequestMode="Enabled" Visible="False" />
                                <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                                <asp:BoundField DataField="ID_Alumno" HeaderText="ID_Alumno" SortExpression="ID_Alumno" Visible="False" />
                                <asp:BoundField DataField="ID_Estado" HeaderText="ID_Estado" SortExpression="ID_Estado" Visible="False" />
                                <asp:BoundField DataField="Obsevaciones" HeaderText="Obsevaciones" SortExpression="Obsevaciones" Visible="False" />
                                <asp:BoundField DataField="ID_Condicion" HeaderText="ID_Condicion" SortExpression="ID_Condicion" Visible="False" />
                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha" />
                                <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                                <asp:BoundField DataField="Expr1" HeaderText="Fecha Mesa" DataFormatString="{0:dd-M-yyyy}" SortExpression="Expr1" />
                                <asp:BoundField DataField="Expr2" HeaderText="Hora Mesa" SortExpression="Expr2" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                <asp:BoundField DataField="Expr3" HeaderText="Estado" SortExpression="Expr3" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" OnClientClick="return confirm('Esta Seguro');" title="Cancelar"></>
                            <img style="height: 35px" src="Fotos/cancelar.jpg" />
                                        </asp:LinkButton>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Inscripcion] WHERE [ID_Inscripcion] = @ID_Inscripcion" InsertCommand="INSERT INTO [Inscripcion] ([ID_Usuario], [Fecha], [Hora], [ID_Mesa], [ID_Alumno], [ID_Estado], [Obsevaciones], [ID_Condicion]) VALUES (@ID_Usuario, @Fecha, @Hora, @ID_Mesa, @ID_Alumno, @ID_Estado, @Obsevaciones, @ID_Condicion)" SelectCommand="SELECT Inscripcion.ID_Inscripcion, Inscripcion.ID_Usuario, Inscripcion.Hora, Inscripcion.ID_Mesa, Inscripcion.ID_Alumno, Inscripcion.ID_Estado, Inscripcion.Obsevaciones, Inscripcion.ID_Condicion, Inscripcion.Fecha, Alumno.Apellido, Alumno.Nombre, Mesa.Fecha AS Expr1, Mesa.Hora AS Expr2, Mesa.Descripcion, Estados.Nombre AS Expr3 FROM Inscripcion INNER JOIN Alumno ON Inscripcion.ID_Alumno = Alumno.ID_Alumno INNER JOIN Mesa ON Inscripcion.ID_Mesa = Mesa.ID_Mesa INNER JOIN Estados ON Inscripcion.ID_Estado = Estados.ID_Estado" UpdateCommand="UPDATE [Inscripcion] SET [ID_Usuario] = @ID_Usuario, [Fecha] = @Fecha, [Hora] = @Hora, [ID_Mesa] = @ID_Mesa, [ID_Alumno] = @ID_Alumno, [ID_Estado] = @ID_Estado, [Obsevaciones] = @Obsevaciones, [ID_Condicion] = @ID_Condicion WHERE [ID_Inscripcion] = @ID_Inscripcion">
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
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col-sm">
                    <div id="divnuevains" runat="server">

                        <br />
                        <br />
                        <h3><b>Nueva inscripcion</b></h3>
                        <asp:TextBox ID="TextBox1" runat="server" Wrap="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                Fecha de Examen<br />
                                <asp:DropDownList ID="DropMesMesa" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionarMesa">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [MesMesa]"></asp:SqlDataSource>
                                <asp:Label ID="Label3" runat="server" Text="No hay fechas de examenes en los siguientes meses" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Asegurese de haber seleccionado una fecha de examen" Visible="False"></asp:Label>
                                <br />
                                <br />
                                Mesa<br />
                                <asp:DropDownList ID="DropMesa" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SeleccionarMesa">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Mesa.ID_Mesa, Mesa.Descripcion, Mesa.ID_Materia, Mesa.Fecha, Mesa.Hora, Mesa.ID_MesMesa, Mesa.ID_ProfesorTitular, Mesa.ID_ProfesorVocal1, Mesa.ID_ProfesorVocal2, Materia.ID_Carrera, MesMesa.ID_MesMesa AS Expr1, Materia.Nombre FROM Mesa INNER JOIN Materia ON Mesa.ID_Materia = Materia.ID_Materia INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa"></asp:SqlDataSource>
                                <br />
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <br />
                        <br />
                        <!--Alumno<br /> !-->
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Apellido" DataValueField="ID_Alumno" Visible="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Alumno]"></asp:SqlDataSource>
                        <br />
                        <br />
                        Condicion<br />
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Descripcion" DataValueField="ID_Condicion">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Condiciom]"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="No se pudo hacer la inscripcion" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Guardarins" runat="server" OnClick="Guardarins_Click" Text="Guardar" />
                        <br />


                    </div>
                </div>
                <div class="col-sm">
                </div>
            </div>

        </div>

    </form>
</body>
</html>
