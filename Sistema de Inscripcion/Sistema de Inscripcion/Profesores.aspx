<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profesores.aspx.cs" Inherits="Sistema_de_Inscripcion.Profesores" %>

<%@ Register Src="~/Barra_Menu.ascx" TagPrefix="uc1" TagName="Barra_Menu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:Barra_Menu runat="server" ID="Barra_Menu" />
        </div>
        <div>
            <div id="divprofesor" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <br />
                            <h3><b>Listado de Profesores </b></h3>
                            <br />
                            <asp:Button ID="nuevo_profesor" runat="server" OnClick="nuevo_profesor_Click" Text="Nuevo Profesor" Width="120px" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Buscar" />
                            <br />
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Profesor" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="ID_Profesor" HeaderText="ID_Profesor" ReadOnly="True" SortExpression="ID_Profesor" Visible="False" />
                                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                    <asp:BoundField DataField="DNI" HeaderText="DNI" SortExpression="DNI" />
                                    <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                                    <asp:BoundField DataField="ID_Usuario" HeaderText="ID_Usuario" SortExpression="ID_Usuario" Visible="False" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href="Profesores.aspx?id=<%# Eval("ID_Profesor")%>" title="Editar"></>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Profesor] WHERE [ID_Profesor] = @ID_Profesor" InsertCommand="INSERT INTO [Profesor] ([Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario]) VALUES (@Nombre, @Apellido, @DNI, @Mail, @Telefono, @ID_Usuario)" ProviderName="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1.ProviderName %>" SelectCommand="SELECT [ID_Profesor], [Nombre], [Apellido], [DNI], [Mail], [Telefono], [ID_Usuario] FROM [Profesor]" UpdateCommand="UPDATE [Profesor] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [DNI] = @DNI, [Mail] = @Mail, [Telefono] = @Telefono, [ID_Usuario] = @ID_Usuario WHERE [ID_Profesor] = @ID_Profesor">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID_Profesor" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Nombre" Type="String" />
                                    <asp:Parameter Name="Apellido" Type="String" />
                                    <asp:Parameter Name="DNI" Type="String" />
                                    <asp:Parameter Name="Mail" Type="String" />
                                    <asp:Parameter Name="Telefono" Type="Int32" />
                                    <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Nombre" Type="String" />
                                    <asp:Parameter Name="Apellido" Type="String" />
                                    <asp:Parameter Name="DNI" Type="String" />
                                    <asp:Parameter Name="Mail" Type="String" />
                                    <asp:Parameter Name="Telefono" Type="Int32" />
                                    <asp:Parameter Name="ID_Usuario" Type="Int32" />
                                    <asp:Parameter Name="ID_Profesor" Type="Int32" />
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
            <div id="divaltaprofesor" runat="server">
                <br />
                <br />
                <br />
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <h3><b>Nuevo Profesor </b></h3>
                            <br />
                            Nombre<br />
                            <asp:TextBox ID="AltaNomProf" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelNom" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            Apellido<br />
                            <asp:TextBox ID="AltaApeProf" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelApe" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <br />
                            Telefono<br />
                            <asp:TextBox ID="AltaTelProf" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm">
                            <div style="margin-left: 40px">
                                <br />
                                <br />
                                DNI<br />
                                <asp:TextBox ID="AltaDNIProf" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                Correo Electronico<br />
                                <asp:TextBox ID="AltaMailProf" runat="server"></asp:TextBox>

                                <br />
                                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>

                                <br />
                                <br />
                                Usuario<br />
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                                <br />
                                <br />
                                Contraseña<br />
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>

                                <br />
                                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Guardar" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Cancel_new_prof" runat="server" OnClick="Cancel_new_prof_Click" Text="Cancelar" />
                            </div>
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editarprofesor" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <br />
                            <br />
                            <h3><b>Editar Profesor </b></h3>
                            <br />
                            Nombre<br />
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelNomE" runat="server"></asp:Label>
                            <br />
                            <br />
                            Apellido<br />
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelApeE" runat="server"></asp:Label>
                            <br />
                            <br />
                            Telefono<br />
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm">
                            <br />
                            <br />
                            <br />
                            DNI<br />
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Correo Electronico<br />
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelMailE" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="Acept_guar" runat="server" OnClick="Acept_guar_Click" Text="Aceptar y Guardar" Width="141px" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Cancel_act_prof" runat="server" OnClick="Cancel_act_prof_Click" Text="Cancelar" />
                        </div>
                        <div class="col-sm">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
