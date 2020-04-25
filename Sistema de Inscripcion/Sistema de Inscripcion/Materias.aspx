<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Materias.aspx.cs" Inherits="Sistema_de_Inscripcion.Materias" %>

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
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <div id="divmaterias" runat="server">
                            <br />
                            <br />
                            <h3><b>Materias y Carreras</b></h3>
                            <br />
                            <br />
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        <b>Materias</b><br />
                                        <br />
                                        <asp:Button ID="Nueva_materia" runat="server" Text="Nueva Materia" OnClick="Nueva_materia_Click" />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="Button2_Click" Width="180px"></asp:TextBox>
                                        &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Button1_Click">
            <asp:ListItem Value="4">Todas</asp:ListItem>
            <asp:ListItem Value="0">Por Profesor</asp:ListItem>
            <asp:ListItem Value="1">Turismo</asp:ListItem>
            <asp:ListItem Value="2">Software</asp:ListItem>
            <asp:ListItem Value="3">Trecking</asp:ListItem>
        </asp:DropDownList>
                                        &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" />
                                        <br />
                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" Visible="False" />
                                        <br />
                                        <br />
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Carrera,ID_Materia,ID_Profesor" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                                                <asp:BoundField DataField="Curso" HeaderText="Curso" SortExpression="Curso" />
                                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                                <asp:BoundField DataField="Profesor" HeaderText="Profesor" SortExpression="Profesor" />
                                                <asp:BoundField DataField="ID_Carrera" HeaderText="ID_Carrera" ReadOnly="True" SortExpression="ID_Carrera" Visible="False" />
                                                <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" ReadOnly="True" SortExpression="ID_Materia" Visible="False" />
                                                <asp:BoundField DataField="ID_Profesor" HeaderText="ID_Profesor" ReadOnly="True" SortExpression="ID_Profesor" Visible="False" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <a href="Materias.aspx?id=<%# Eval("ID_Materia")%>" title="Editar"></>
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
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Carrera, Curso, Materia, Profesor, ID_Carrera, ID_Materia, ID_Profesor FROM Materias_Completas"></asp:SqlDataSource>
                                        <br />
                                    </div>
                                    <div class="col-sm">
                                        <b>Carreras</b><br />
                                        <br />
                                        <asp:Button ID="Nueva_carrera" runat="server" Text="Nueva Carrera" OnClick="Nueva_carrera_Click" />
                                        <br />
                                        <br />

                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Buscar_carrre" runat="server" Text="Buscar" />
                                        <br />
                                        <br />
                                        <br />
                                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_Carrera" DataSourceID="SqlDataSource6" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="ID_Carrera" HeaderText="ID_Carrera" ReadOnly="True" SortExpression="ID_Carrera" Visible="False" />
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                                <asp:BoundField DataField="Fija" HeaderText="Fija" SortExpression="Fija" Visible="False" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <a href="Materias.aspx?id2=<%# Eval("ID_Carrera")%>" title="Editar"></>
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
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [Carrera] WHERE [ID_Carrera] = @ID_Carrera" InsertCommand="INSERT INTO [Carrera] ([Nombre], [Fija]) VALUES (@Nombre, @Fija)" ProviderName="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1.ProviderName %>" SelectCommand="SELECT [ID_Carrera], [Nombre], [Fija] FROM [Carrera]" UpdateCommand="UPDATE [Carrera] SET [Nombre] = @Nombre, [Fija] = @Fija WHERE [ID_Carrera] = @ID_Carrera">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID_Carrera" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Nombre" Type="String" />
                                                <asp:Parameter Name="Fija" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Nombre" Type="String" />
                                                <asp:Parameter Name="Fija" Type="String" />
                                                <asp:Parameter Name="ID_Carrera" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div id="diveditarmateria" runat="server">
                                <br />
                                <br />
                                <h3><b>Editar Materia</b></h3>
                                <br />
                                Nombre<br />
                                <asp:TextBox ID="TextBoxNomMatE" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                Curso<br />
                                <asp:DropDownList ID="DropDownList3" runat="server">
                                    <asp:ListItem>Primero</asp:ListItem>
                                    <asp:ListItem>Segundo</asp:ListItem>
                                    <asp:ListItem>Tercero</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                <br />
                                <br />
                                Carrera<br />
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Nombre" DataValueField="ID_Carrera">
                                </asp:DropDownList>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
                                <br />
                                Profesor<br />
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="select ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor"></asp:SqlDataSource>
                                <br />
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="Guar_edit_mat" runat="server" OnClick="Guar_edit_mat_Click" Text="Guardar" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Cancel_new_mat" runat="server" OnClick="Cancel_new_mat_Click" Text="Cancelar" />
                                <br />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <div id="divnuevamateria" runat="server">
                            <br />
                            <br />
                            <h3><b>Nueva Materia</b></h3>
                            <br />
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        Nombre<br />
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="LabelNommat" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        Carrera<br />
                                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="ID_Carrera">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [Nombre], [ID_Carrera] FROM [Carrera]"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-sm">
                                        Curso<br />
                                        <asp:DropDownList ID="DropDownList8" runat="server">
                                            <asp:ListItem Value="1">Primero</asp:ListItem>
                                            <asp:ListItem Value="2">Segundo</asp:ListItem>
                                            <asp:ListItem Value="3">Tercero</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        Profesor<br />
                                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource5" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Button ID="Save_new_mat" runat="server" OnClick="Save_new_mat_Click" Text="Guardar" />
                                        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Cancel_edit_mat" runat="server" OnClick="Cancel_edit_mat_Click" Text="Cancelar" />
                                    </div>
                                </div>
                            </div>
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
                        <div id="divnuevacarrera" runat="server">
                            <br />
                            <br />
                            <h3><b>Nueva Carrera</b></h3>
                            <br />
                            Nombre<br />
                            <asp:TextBox ID="TextBox_new_car" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelNomCarre" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Labelerrorcarre" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="Guardar_carre" runat="server" Text="Guardar" OnClick="Guardar_carre_Click" />
                            &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Cancel_carre" runat="server" Text="Cancelar" OnClick="Cancel_carre_Click" />
                            <br />
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
                        <div id="diveditcarrera" runat="server">
                            <br />
                            <br />
                            <h3><b>Editar Carrera</b></h3>
                            <br />
                            Nombre<br />
                            <asp:TextBox ID="TextBoxNomCarre" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="LabelNomCarE" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="LabelError" runat="server"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="Guardar_Edit_Carr" runat="server" OnClick="Guardar_Edit_Carr_Click" Text="Guardar" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Cancel_Edit_Carr" runat="server" OnClick="Cancel_Edit_Carr_Click" Text="Cancelar" />

                        </div>
                    </div>
                    <div class="col-sm">
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
