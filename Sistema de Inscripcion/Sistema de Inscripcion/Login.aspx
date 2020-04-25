<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sistema_de_Inscripcion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!--<link href="EstilosLogin.css" rel="stylesheet" />-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
</head>
<body style="background-image:url(Fotos/fondo3.jpg)">
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row align-items-end">
                    <div class="col-sm">
                        
                    </div>
                    <div class="col-sm">
                        <br />
                        <br />
                        <br />
                        <div class="card" style="width: 18rem;">
                            <br />
                            <br />
                            <img src="Fotos/logo.png" style="width: 100px" class="rounded mx-auto d-block" alt="..."/>
                            <div class="card-body">
                                <p class="card-text" style="color: #000000">
                                    <br />
                                    Usuario<br />
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Fotos/usuario.png" Width="30px" />
                                    <label for="inputEmail" class="sr-only">Email address</label>
                                    <asp:TextBox ID="UsuarioTBox" placeholder="Ingrese el Usuario" required="" autofocus="" runat="server" BorderStyle="Groove" BorderColor="#33CCFF" OnClick="UsuarioTBox_Click"></asp:TextBox>
                                    <br />
                                        <asp:Label ID="Label1" runat="server" Text="Inicio de Sesion Incorrecto" Visible="False" ForeColor="Red"></asp:Label>
                                    <br />
                                    <br />
                                    Contraseña<br />
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Fotos/contraseña.png" Width="30px" />
                                    
                                    <asp:TextBox ID="ContraseñaTBox" placeholder="Ingrese la contraseña" required="" autofocus="" runat="server" TextMode="Password" BorderColor="#33CCFF" BorderStyle="Groove">Contraseña</asp:TextBox>
                                    <p class="card-text">
                                        <br />
                                        <asp:Button ID="Iniciar" runat="server" OnClick="Iniciar_Click1" Text="Iniciar Sesion" BackColor="#0099FF" BorderStyle="None" Font-Bold="False" Font-Strikeout="False" ForeColor="White" CssClass="rounded mx-auto d-block" Height="37px" Width="136px" />
                                        <br />
                                        <!--<a href="Menu.aspx" class="btn btn-primary">Iniciar</a> !-->
                                        <br />
                                    </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm">

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
