<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Sistema_de_Inscripcion.Usuarios" %>

<%@ Register Src="~/Barra_Menu.ascx" TagPrefix="uc1" TagName="Barra_Menu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div-barra-menu">
            <uc1:Barra_Menu runat="server" ID="Barra_Menu" />
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div id="divusuarios" runat="server" style="color: #000000">
                        <h5>&nbsp;</h5>
                        <h3>Listado de Usuarios</h3>
                        <br />
                        <asp:Button ID="Nuevo_Usuario" runat="server" Text="Nuevo Usuario" Height="33px" OnClick="Nuevo_Usuario_Click" Width="118px" ForeColor="Black" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TB_Buscar_Ussu" runat="server" Width="214px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Buscar_Usu" runat="server" OnClick="Buscar_Usu_Click" Text="Buscar" ForeColor="Black" />
                        <br />
                        <br />
                        Filtrar por :
                        <asp:DropDownList ID="DropDownList2" runat="server" ForeColor="Black" OnSelectedIndexChanged="SeleccionarUsuario" AutoPostBack="True">
                            <asp:ListItem Value="3">Alumno</asp:ListItem>
                            <asp:ListItem Value="2">Profesor</asp:ListItem>
                            <asp:ListItem Value="1">Secretaria</asp:ListItem>
                            <asp:ListItem Value="4">Preceptor</asp:ListItem>
                            <asp:ListItem Value="6">Administrador</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Usuario,ID_Tipo_Usuario" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" InsertVisible="False" ReadOnly="True" Visible="False" />
                                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                                <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" SortExpression="Contraseña" />
                                <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                                <asp:BoundField DataField="Nombre" HeaderText="Rol" SortExpression="Nombre" />
                                <asp:BoundField DataField="ID_Tipo_Usuario" HeaderText="ID_Tipo_Usuario" InsertVisible="False" ReadOnly="True" SortExpression="ID_Tipo_Usuario" Visible="False" />
                                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a href="Usuarios.aspx?id=<%# Eval("ID_Usuario")%>" title="Editar"></>
                                            <img style="height: 25px" src="Fotos/edit.png" />
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" OnClientClick="return confirm('Esta Seguro');">
                                        <img style="height: 25px" src="Fotos/delete.png" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [ID_Usuario] = @ID_Usuario" InsertCommand="INSERT INTO [Usuarios] ([ID_Tipo_Usuario], [Usuario], [Contrase&#241;a], [Mail]) VALUES (@ID_Tipo_Usuario, @Usuario, @Contrase&#241;a, @Mail)" SelectCommand="SELECT Usuarios.ID_Usuario, Usuarios.ID_Tipo_Usuario AS Expr1, Usuarios.Usuario, Usuarios.Contraseña, Usuarios.Mail, Tipo_Usuario.* FROM Usuarios INNER JOIN Tipo_Usuario ON Usuarios.ID_Tipo_Usuario = Tipo_Usuario.ID_Tipo_Usuario" UpdateCommand="UPDATE [Usuarios] SET [ID_Tipo_Usuario] = @ID_Tipo_Usuario, [Usuario] = @Usuario, [Contrase&#241;a] = @Contrase&#241;a, [Mail] = @Mail WHERE [ID_Usuario] = @ID_Usuario">
                            <DeleteParameters>
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ID_Tipo_Usuario" Type="Int32" />
                                <asp:Parameter Name="Usuario" Type="String" />
                                <asp:Parameter Name="Contrase&#241;a" Type="String" />
                                <asp:Parameter Name="Mail" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ID_Tipo_Usuario" Type="Int32" />
                                <asp:Parameter Name="Usuario" Type="String" />
                                <asp:Parameter Name="Contrase&#241;a" Type="String" />
                                <asp:Parameter Name="Mail" Type="String" />
                                <asp:Parameter Name="ID_Usuario" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div>

                </div>
                <div class="col-sm">
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div id="divEditarUsuario" runat="server">
                        <br />
                        <h3><b>Editar Usuario </b></h3>
                        <br />
                        <br />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm">
                                    Usuario<br />
                                    <asp:TextBox ID="TextBox1" runat="server" Width="155px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="Labelusuedit" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    Contraseña<br />
                                    <asp:TextBox ID="TextBox2" runat="server" Width="153px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="Labelcontraedit" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                                <div class="col-sm">
                                    Correo Electronico<br />
                                    <asp:TextBox ID="TextBox3" runat="server" Width="208px"></asp:TextBox>
                                    <br />

                                    <asp:Label ID="Labelmailedit" runat="server"></asp:Label>

                                    <br />
                                    <br />
                                    Tipo de Usuario<br />
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Tipo_Usuario">
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Actualizar_Usuario" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Button ID="Button_guardar_editar" runat="server" OnClick="Button_guardar_editar_Click" Text="Guardar" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Cancelar_Edit_Usu" runat="server" OnClick="Cancelar_Edit_Usu_Click" Text="Cancelar" />
                                </div>
                                <div class="col-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm">
                    <div id="divNuevoUsuario" runat="server">
                        <br />
                        <br />
                        <h3><b>Nuevo Usuario </b></h3>
                        <br />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm">
                                    Usuario<br />
                                    <asp:TextBox ID="TB_Nombre_Usuario" runat="server" Width="139px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="LabelUsuVacio" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    Contraseña<br />
                                    <asp:TextBox ID="TB_Contra_Usuario" runat="server" Width="138px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelCantraVacia" runat="server"></asp:Label>
                                </div>
                                <div class="col-sm">
                                    Correo Electronico<br />
                                    <asp:TextBox ID="TB_Mail_Usuario" runat="server" Width="198px"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="LabelMailVacio" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    Tipo de Usuario<br />
                                    <asp:DropDownList ID="Tipo_Usuario" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Tipo_Usuario">
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Aviso" runat="server" ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Button ID="Guardar_Nuevo_Usuario" runat="server" OnClick="Guardar_Nuevo_Usuario_Click" Text="Guardar" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Cancelar_Nuevo_Usu" runat="server" OnClick="Cancelar_Nuevo_Usu_Click" Text="Cancelar" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Tipo_Usuario]"></asp:SqlDataSource>
                    <br />
                </div>
                <div class="col-sm">
                </div>
            </div>
        </div>
        <div id="elejir" runat="server" style="align-content: center">
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <br />
                        <h3><b>Elija el usuario a agregar</b></h3>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm">
                                    <br />
                                    <asp:Button ID="Button1" runat="server" Text="Secretaria" OnClick="Button1_Click1" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button4" runat="server" Text="Preceptor" OnClick="Button4_Click1" />
                                    <br />
                                </div>
                                <div class="col-sm">
                                    <br />
                                    <asp:Button ID="Button3" runat="server" Text="Alumno" OnClick="Button3_Click1" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button2" runat="server" Text="Profesor" OnClick="Button2_Click1" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
