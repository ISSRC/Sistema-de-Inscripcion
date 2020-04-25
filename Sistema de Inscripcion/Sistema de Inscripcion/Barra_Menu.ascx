<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Barra_Menu.ascx.cs" Inherits="Sistema_de_Inscripcion.Barra_Menu" %>
<header>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .dropdown-submenu {
            position: relative;
        }

            .dropdown-submenu > .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -1px;
                -webkit-border-radius: 0 6px 6px 6px;
                -moz-border-radius: 0 6px 6px;
                border-radius: 0 6px 6px 6px;
            }

            .dropdown-submenu:hover > .dropdown-menu {
                display: block;
            }

            .dropdown-submenu > a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #ccc;
                margin-top: 5px;
                margin-right: -10px;
            }

            .dropdown-submenu:hover > a:after {
                border-left-color: #fff;
            }

            .dropdown-submenu.pull-left {
                float: none;
            }

                .dropdown-submenu.pull-left > .dropdown-menu {
                    left: -100%;
                    margin-left: 10px;
                    -webkit-border-radius: 6px 0 6px 6px;
                    -moz-border-radius: 6px 0 6px 6px;
                    border-radius: 6px 0 6px 6px;
                }
    </style>
</header>
<div>
    <nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;"">
        <a class="navbar-brand" href="Menu.aspx">Inscripciones</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto">
                <li class="nav-item active" id="Usuarios" runat="server">
                    <a id="Usuario" runat="server" class="nav-link" href="Usuarios.aspx">Usuarios <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active" id="Alumnos" runat="server">
                    <a id="Alumno" runat="server" class="nav-link" href="Alumno.aspx">Alumnos <span class="sr-only">(current)</span></a>
                </li>
                    <li class="nav-item active" id="Materias" runat="server">
                    <a id="Materia" runat="server" class="nav-link" href="Materias.aspx">Materias y Carreras <span class="sr-only">(current)</span></a>
                </li>
                <li>
                    <li class="nav-item active" id="Li1" runat="server">
                    <a id="Profesor" runat="server" class="nav-link" href="Profesores.aspx">Profesores <span class="sr-only">(current)</span></a>
                </li>
                <!--
                <div class="btn-group">
                    <a class="nav-link dropdown-toggle" href="Profesores.aspx" id="dropdownMenu1" runat="server" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profesores
                    </a>
                    <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
                        <asp:Label ID="MenuHTML" runat="server" Text="Label"></asp:Label>
                    </ul>
                </div>
                !-->
                <li class="nav-item active" id="Mesas" runat="server">
                    <a id="Mesa" runat="server" class="nav-link" href="Mesas.aspx">Mesas <span class="sr-only">(current)</span></a>
                </li>
                 <li class="nav-item active" id="Estadisticas" runat="server">
                    <a id="Estadistica" runat="server" class="nav-link" href="Estadisticas.aspx">Estadiscticas <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active" id="Inscripciones" runat="server">
                    <a id="Inscribir" runat="server" class="nav-link" href="Inscripciones.aspx">Inscripciones <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active" id="Fechas" runat="server">
                    <a id="Fecha" runat="server" class="nav-link" href="MesMesa.aspx">Fechas de Examen <span class="sr-only">(current)</span></a>
                </li>
                </ul>
            <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Cerrar Sesion" OnClick="Button1_Click" />
            
        </div>
        </nav>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
