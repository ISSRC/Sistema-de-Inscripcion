<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MesMesa.aspx.cs" Inherits="Sistema_de_Inscripcion.MesMesa" %>

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
        <div id="mesMesa" runat="server">
            <br />
            <br />
            <h3><b>Fechas de Examenes</b></h3>
            <br />
            <asp:Button ID="New_fecha" runat="server" OnClick="New_fecha_Click" Text="Nueva Fecha" Width="107px" />
            <br />
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        Filtrar Por Carrera :&nbsp;
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre" DataValueField="ID_Carrera" OnSelectedIndexChanged="Button2_Click"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" Visible="False" />
                    </div>
                </div>
            </div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Expr1,ID_MesMesa" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" Width="1034px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" InsertVisible="False" Visible="False" />
                    <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" Visible="False" />
                    <asp:BoundField DataField="Expr3" HeaderText="Expr3" SortExpression="Expr3" Visible="False" />
                    <asp:BoundField DataField="Expr4" HeaderText="Expr4" SortExpression="Expr4" Visible="False" />
                    <asp:BoundField DataField="Expr5" HeaderText="Expr5" SortExpression="Expr5" Visible="False" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
                    <asp:BoundField DataField="ID_MesMesa" HeaderText="ID_MesMesa" InsertVisible="False" ReadOnly="True" SortExpression="ID_MesMesa" Visible="False" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="ID_Carrera" HeaderText="ID_Carrera" SortExpression="ID_Carrera" Visible="False" />
                    <asp:BoundField DataField="Fecha_Inscripcion_Desde" HeaderText="Inscrip Desde" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha_Iscripcion_Hasta" />
                    <asp:BoundField DataField="Fecha_Iscripcion_Hasta" HeaderText="Inscrip Hasta" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha_Iscripcion_Hasta" />
                    <asp:BoundField DataField="Fecha_Confirm_incrip_Desde" HeaderText="Control Desde" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha_Confirm_incrip_Desde" />
                    <asp:BoundField DataField="Fecha_Confirm_incrip_Hasta" HeaderText="Control Hasta" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha_Confirm_incrip_Hasta" />
                    <asp:BoundField DataField="Fecha_Inicio_Mesa_Desde" HeaderText="Examen Desde" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha_Inicio_Mesa_Desde" />
                    <asp:BoundField DataField="Fecha_Inicio_Mesa_Hasta" HeaderText="Examen Hasta" DataFormatString="{0:dd-M-yyyy}" SortExpression="Fecha_Inicio_Mesa_Hasta" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="MesMesa.aspx?id=<%# Eval("ID_MesMesa")%>" title="Editar"></>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" DeleteCommand="DELETE FROM [MesMesa] WHERE [ID_MesMesa] = @ID_MesMesa" InsertCommand="INSERT INTO [MesMesa] ([Descripcion], [ID_Carrera], [Fecha_Inscripcion_Desde], [Fecha_Iscripcion_Hasta]) VALUES (@Descripcion, @ID_Carrera, @Fecha_Inscripcion_Desde, @Fecha_Iscripcion_Hasta)" SelectCommand="SELECT MesMesa.ID_MesMesa AS Expr1, MesMesa.Descripcion AS Expr2, MesMesa.ID_Carrera AS Expr3, MesMesa.Fecha_Inscripcion_Desde AS Expr4, MesMesa.Fecha_Iscripcion_Hasta AS Expr5, Carrera.Nombre, MesMesa.* FROM MesMesa INNER JOIN Carrera ON MesMesa.ID_Carrera = Carrera.ID_Carrera" UpdateCommand="UPDATE [MesMesa] SET [Descripcion] = @Descripcion, [ID_Carrera] = @ID_Carrera, [Fecha_Inscripcion_Desde] = @Fecha_Inscripcion_Desde, [Fecha_Iscripcion_Hasta] = @Fecha_Iscripcion_Hasta WHERE [ID_MesMesa] = @ID_MesMesa">
                <DeleteParameters>
                    <asp:Parameter Name="ID_MesMesa" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="ID_Carrera" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Fecha_Inscripcion_Desde" />
                    <asp:Parameter DbType="Date" Name="Fecha_Iscripcion_Hasta" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="ID_Carrera" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Fecha_Inscripcion_Desde" />
                    <asp:Parameter DbType="Date" Name="Fecha_Iscripcion_Hasta" />
                    <asp:Parameter Name="ID_MesMesa" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div id="nuevafecha" runat="server">
            <br />
            <br />
            <h3><b>Nueva Fecha de examen </b></h3>
            <br />
            Descripcion<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Carrera<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Carrera">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema de InscripcionConnectionString1 %>" SelectCommand="SELECT * FROM [Carrera]"></asp:SqlDataSource>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <br />
                        <br />
                        Fecha de Inicio<br />
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha de Finalizacion<br />
                        <asp:TextBox ID="TextBox3" runat="server" Width="182px" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha inicio confirmacion
                        <br />
                        <asp:TextBox ID="TextBox11" runat="server" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha final confirmacion<br />
                        <asp:TextBox ID="TextBox12" runat="server" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha inicio examen<br />
                        <asp:TextBox ID="TextBox13" runat="server" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha final examen<br />
                        <asp:TextBox ID="TextBox14" runat="server" TextMode="Date"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Guar_new_fecha" runat="server" Text="Guardar" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <br />

        </div>
        <div id="editarmesmesa" runat="server">

            <br />
            <h3><b>Editar Fechas</b></h3>
            <br />
            Descripcion<br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Carrera<br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="ID_Carrera">
            </asp:DropDownList>
            <br />
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha de inicio<br />
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox5" />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha de finalizacion<br />
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>

                        <ajaxToolkit:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox6" />

                        <br />
                        <br />


                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha Confirmacion Desde<br />
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="TextBox7_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox7" />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha Confirmacion Hasta<br />
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="TextBox8_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox8" />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha de inicio Examen<br />
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="TextBox9_CalendarExtender" runat="server" Enabled="True" TargetControlID="TextBox9" />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        Fecha de final Examen<br />
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Guardar" />
                    </div>
                </div>
            </div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
