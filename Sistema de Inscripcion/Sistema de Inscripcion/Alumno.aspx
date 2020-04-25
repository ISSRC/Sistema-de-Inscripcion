<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumno.aspx.cs" Inherits="Sistema_de_Inscripcion.Alumno" %>

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
                    <div id="divalumnos" runat="server">

                        <br />
                        <br />
                        <h3><b>Alumnos</b></h3>
                        <br />
                        &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Nuevo Alumno" />
                        &nbsp;
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Buscar" runat="server" OnClick="Buscar_Click" Text="Buscar" />
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" DataKeyNames="ID_Alumno" Width="432px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID_Alumno" HeaderText="ID_Alumno" SortExpression="ID_Alumno" Visible="False" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                <asp:BoundField DataField="DNI" HeaderText="DNI" SortExpression="DNI" />
                                <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                                <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                                <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" Visible="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href="Alumno.aspx?id=<%# Eval("ID_Alumno")%>" title="Editar"></>
                                            <img style="height: 25px" src="Fotos/edit.png" />
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
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Alumno] WHERE [ID_Alumno] = @ID_Alumno" InsertCommand="INSERT INTO [Alumno] ([Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario]) VALUES (@Nombre, @Apellido, @DNI, @Mail, @Celular, @ID_Usuario)" ProviderName="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1.ProviderName %>" SelectCommand="SELECT [ID_Alumno], [Nombre], [Apellido], [DNI], [Mail], [Celular], [ID_Usuario] FROM [Alumno]" UpdateCommand="UPDATE [Alumno] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [DNI] = @DNI, [Mail] = @Mail, [Celular] = @Celular, [ID_Usuario] = @ID_Usuario WHERE [ID_Alumno] = @ID_Alumno">
                            <DeleteParameters>
                                <asp:Parameter Name="ID_Alumno" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="Apellido" Type="String" />
                                <asp:Parameter Name="DNI" Type="String" />
                                <asp:Parameter Name="Mail" Type="String" />
                                <asp:Parameter Name="Celular" Type="Decimal" />
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="Apellido" Type="String" />
                                <asp:Parameter Name="DNI" Type="String" />
                                <asp:Parameter Name="Mail" Type="String" />
                                <asp:Parameter Name="Celular" Type="Decimal" />
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                <asp:Parameter Name="ID_Alumno" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </div>
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>

        <div id="divnuevoalumno" runat="server">

            <br />
            <h3><b>Nuevo alumno</b></h3>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        Nombre<br />
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Labelnom" runat="server"></asp:Label>
                        <br />
                        <br />
                        Apellido<br />
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="LabelApe" runat="server"></asp:Label>
                        <br />
                        <br />
                        DNI<br />
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Labeldni" runat="server"></asp:Label>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        Mail<br />
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="Labelmail" runat="server"></asp:Label>
                        <br />
                        <br />
                        Telefono<br />
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        Usuario<br />
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="LabelUsu" runat="server"></asp:Label>
                        <br />
                        <br />
                        Contraseña<br />
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Labelcontra" runat="server"></asp:Label>
                        <br />
                        <br />
                        Carrera<br />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Carrera">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Cancelar_alum" runat="server" OnClick="Cancelar_alum_Click" Text="Cancelar" />
                        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Guardar_alum" runat="server" OnClick="Guardar_alum_Click" Text="Guardar" />
                        &nbsp;&nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </div>
        <div id="editaralumno" runat="server">
            <br />
            <br />
            <h3><b>Editar Alumno</b></h3>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        Nombre<br />
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        Apellido<br />
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        DNI<br />
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        Mail<br />
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        Telefono<br />
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        Carrera<br />
                        <asp:DropDownList ID="DropCarreEd" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Carrera">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="Guar_Actu_Alumno" runat="server" Text="Guardar" OnClick="Guar_Actu_Alumno_Click" />

                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Cancel_edit_alum" runat="server" OnClick="Cancel_edit_alum_Click" Text="Cancelar" />

                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
