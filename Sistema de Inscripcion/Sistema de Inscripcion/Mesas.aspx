<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="Sistema_de_Inscripcion.Mesas" %>

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
        <div id="divMesas" runat="server">
            <div id="divmesa" runat="server">

                <br />
                <br />
                <h3><b>Mesas de Examenes </b></h3>
                <br />
                <asp:Button ID="nueva_mesa" runat="server" Text="Nueva Mesa" OnClick="nueva_mesa_Click" />
                <br />
                <br />
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Buscar" />
                <br />
                <br />
                <div id="divfiltros" runat="server">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm">
                                Filtrar Por Carrera
                            :<br />
                            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource9" DataTextField="Nombre" DataValueField="ID_Carrera" OnSelectedIndexChanged="Button4_Click" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>' SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Button" Visible="False" />
                                <br />
                            </div>
                            <div class="col-sm">
                                Filtar Por Materia
                            :<br />
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Materia" OnSelectedIndexChanged="Button3_Click" AutoPostBack="True"></asp:DropDownList>
                                <br />
                                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" Visible="False" />
                            </div>
                            <div class="col-sm">
                                Filtrar Por Fecha :<br />
                            <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource8" DataTextField="Fecha" DataValueField="Fecha" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
                            </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource8" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Width="871px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
                        <asp:BoundField DataField="Titular" HeaderText="Titular" SortExpression="Titular" />
                        <asp:BoundField DataField="Vocal1" HeaderText="Vocal1" SortExpression="Vocal1" />
                        <asp:BoundField DataField="Vocal2" HeaderText="Vocal2" SortExpression="Vocal2" />
                        <asp:BoundField DataField="Mesa" HeaderText="Observaciones" SortExpression="Mesa" />
                        <asp:BoundField DataField="ID_Mesa" HeaderText="ID_Mesa" SortExpression="ID_Mesa" Visible="False" />
                        <asp:BoundField DataField="ID_Materia" HeaderText="ID_Materia" SortExpression="ID_Materia" Visible="False" />
                        <asp:BoundField DataField="ID_Carrera" HeaderText="ID_Carrera" SortExpression="ID_Carrera" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="Mesas.aspx?id=<%# Eval("ID_Mesa")%>" title="Editar"></>
                                            <img style="height: 25px" src="Fotos/edit.png" />
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" OnClientClick="return confirm('Esta Seguro');">
                                        <img style="height: 25px" title="Eliminar" src="Fotos/delete.png" />
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
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT Mesa_Examen.Mesa, Mesa_Examen.Materia, Mesa_Examen.Fecha, Mesa_Examen.Hora, Mesa_Examen.Titular, Mesa_Examen.Vocal1, Mesa_Examen.Vocal2, Mesa_Examen.ID_Mesa, Mesa.ID_Materia, MesMesa.ID_Carrera FROM Mesa_Examen INNER JOIN Mesa ON Mesa_Examen.ID_Mesa = Mesa.ID_Mesa INNER JOIN MesMesa ON Mesa.ID_MesMesa = MesMesa.ID_MesMesa ORDER BY Mesa_Examen.Fecha DESC"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Mesa_Examen]"></asp:SqlDataSource>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <asp:Button ID="Imprimir" runat="server" OnClick="Imprimir_Click" Text="Imprimir las Mesas" />
                <br />
            </div>
        </div>
        <div class="col-sm">
            <div id="divnuevamesa" runat="server">
                <br />
                <br />
                <h3><b>Nueva Mesas de Examenes</b></h3>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <br />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm">
                                    <div id="nueva-mesa1">
                                        <br />
                                        Materia<br />
                                        <asp:DropDownList ID="Materia_alta_mesa" runat="server" OnSelectedIndexChanged="SeleccionarMateria" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [ID_Materia], [Nombre] FROM [Materia]"></asp:SqlDataSource>
                                        <br />
                                        Fecha<br />
                                        <asp:TextBox ID="Fecha_alta_mesa" runat="server" TextMode="Date"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                        Hora<br />
                                        <asp:TextBox ID="Hora_alta_mesa" runat="server" TextMode="Time"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="col-sm">
                                    <div id="nueva-mesa2">
                                        <br />
                                        Mes de la mesa<br />
                                        <asp:DropDownList ID="Mes_alta_mesa" runat="server" DataSourceID="SqlDataSource3" DataTextField="Descripcion" DataValueField="ID_MesMesa">
                                        </asp:DropDownList>
                                        &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [ID_MesMesa], [Descripcion] FROM [MesMesa]"></asp:SqlDataSource>
                                        <br />
                                        <br />
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-sm">
                                                    <div>
                                                        Profesor Tutular<br />
                                                        <asp:DropDownList ID="Prof_titular_altamesa" runat="server" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="select ID_Profesor, Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="col-sm">
                                                    <div>
                                                        Profesor Vocal 1<br />
                                                        <asp:DropDownList ID="Prof_vocal1_altamesa" runat="server" DataSourceID="SqlDataSource4" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-sm">
                                                    <div>
                                                        Profesor Vocal 2<br />
                                                        <asp:DropDownList ID="Prof_vocal2_altamesa" runat="server" DataSourceID="SqlDataSource4" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                                        </asp:DropDownList>
                                                        <br />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    Observaciones          
                            <asp:TextBox ID="Descrip_alta_mesa" runat="server"></asp:TextBox>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <br />
                        <asp:Label ID="Label_aviso_altamesa" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Alta_mesa_guardar" runat="server" Text="Guardar" OnClick="Alta_mesa_Click" />
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="diceditarmesas" runat="server">

                <br />
                <h3><b>Editar la mesa </b></h3>
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <div id="editar-mesa1">
                                Descripcion<br />
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                Materia<br />
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Materia">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [ID_Materia], [Nombre] FROM [Materia]"></asp:SqlDataSource>
                                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" />
                                <br />
                                Fecha<br />
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                                <br />
                                <br />
                                Hora<br />
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </div>

                        </div>
                        <div class="col-sm">
                            <div id="editar-mesa2">
                                <br />
                                Mes de la mesa<br />
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Descripcion" DataValueField="ID_MesMesa" OnSelectedIndexChanged="Button5_Click">
                                </asp:DropDownList>
                                &nbsp;<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT [ID_MesMesa], [Descripcion] FROM [MesMesa]"></asp:SqlDataSource>
                                <br />
                                <br />
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm">
                                            <div>
                                                Profesor Tutular<br />
                                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="select Profesor.Apellido + ' ' + Profesor.Nombre as NombreApellido from Profesor"></asp:SqlDataSource>
                                            </div>

                                        </div>
                                        <div class="col-sm">
                                            <div>
                                                Profesor Vocal 1<br />
                                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-sm">
                                            <div>
                                                Profesor Vocal 2<br />
                                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="NombreApellido" DataValueField="ID_Profesor">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Guardar" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
