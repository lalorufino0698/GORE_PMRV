<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Docente.master" AutoEventWireup="true" CodeFile="ActualizarContraseña.aspx.cs" Inherits="ActualizarContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css' />
    <style>
        fieldset {
            border: 1px solid #999;
            border-radius: 8px;
            box-shadow: 0 0 10px #999;
            padding: 0px; /* Mejora el espaciado interno */
        }

        #nivelseguridad {
            font-weight: bold;
            text-transform: uppercase;
            color: #333; /* Mejora la visibilidad */
        }

        .nivelSeguridad {
            width: 50%;
            margin: 60px auto;
            text-align: center; /* Centra el contenido */
        }

        legend {
            text-align: center;
            margin-bottom: 10px;
            font-size: 1.2em;
            color: #555; /* Mejora la estética */
        }

        input {
            margin: 5px auto;
            display: block;
            width: 90%; /* Mejorar el diseño responsivo */
        }

        label {
            margin: 0 auto;
            display: block;
            text-align: center;
            font-weight: bold;
            color: #444; /* Mejora la visibilidad */
        }

        .nivelesColores {
            height: 10px;
            width: 100%; /* Ancho completo */
            background-color: #e0e0e0; /* Color del fondo de la barra */
            border-radius: 5px;
            position: relative;
            overflow: hidden; /* Evita desbordamiento */
        }

        .spanNivelesColores {
            height: 100%; /* Ocupa toda la altura */
            width: 0%; /* La barra comienza sin tamaño */
            background-color: transparent; /* Sin color inicialmente */
            transition: width 0.3s ease, background-color 0.3s ease; /* Efecto suave */
        }

            /* Estilos específicos para cada nivel de seguridad */
            .spanNivelesColores.bajo {
                width: 25%; /* 25% para bajo */
                background-color: red;
            }

            .spanNivelesColores.medio {
                width: 50%; /* 50% para medio */
                background-color: orange;
            }

            .spanNivelesColores.alto {
                width: 75%; /* 75% para alto */
                background-color: yellow;
            }

            .spanNivelesColores.muyAlto {
                width: 100%; /* 100% para muy alto */
                background-color: green;
            }
    </style>
    <script type="text/javascript">
        var nivel = "";
        function SoloNumeros(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return ((key_press > 47 && key_press < 58 || key_press == 110));
        }
        function devuelveNivel(esteInput, evento) {
            var nivelBajo = 8,
                nivelMedio = 12,
                nivelAlto = 16,
                numCaracteres = $(esteInput).val().length
            console.log(numCaracteres)
            estaId = $(esteInput).attr("id");
            console.log(estaId)
            espanNivelesColores = $(".spanNivelesColores");
            evento.stopPropagation();
            limpiarError();
            if (estaId.indexOf("txtContraseña") !== -1) {

                if (numCaracteres > 0 && numCaracteres < nivelBajo) {
                    nivel = "bajo"
                    $('#nivelseguridad').text("bajo");
                    espanNivelesColores.removeClass().addClass("spanNivelesColores bajo");
                }
                else if (numCaracteres >= nivelBajo && numCaracteres < nivelMedio) {
                    nivel = "medio"
                    $('#nivelseguridad').text("medio");
                    espanNivelesColores.removeClass().addClass("spanNivelesColores medio");
                }
                else if (numCaracteres >= nivelMedio && numCaracteres < nivelAlto) {
                    nivel = "alto"
                    $('#nivelseguridad').text("alto");
                    espanNivelesColores.removeClass().addClass("spanNivelesColores alto");
                }
                else if (numCaracteres >= nivelAlto) {
                    nivel = "muy alto"
                    $('#nivelseguridad').text("muy alto");
                    espanNivelesColores.removeClass().addClass("spanNivelesColores muyAlto");
                }
                if (numCaracteres === 0) {
                    nivel = "bajo"
                    $('#nivelseguridad').text("bajo");
                    espanNivelesColores.removeClass().addClass("spanNivelesColores");
                }
                console.log(nivel)
            }
        }

        function comprobarClave(e) {
            var divClaveCorrecta = $(".clavecorrecta"),
                espanNivelesColores = $(".spanNivelesColores"),
                nivelSeguridad = $("#nivelseguridad");
            e.preventDefault();
            e.stopPropagation();
            if (inputClaveActual.val() === inputRepetirClaveActual.val()) {
                divClaveCorrecta.removeClass("oculto");
                espanNivelesColores.removeClass().addClass("spanNivelesColores nulo");
                nivelSeguridad.html("");
                return true;
            } else {
                inputClaveActual.focus();
                mostrarError();
                inputs.val("");
            }
        }

        function mostrarError() {
            var divError = $(".error"),
                espanNivelesColores = $(".spanNivelesColores"),
                nivelSeg = $("#nivelseguridad");
            divError.removeClass("oculto", 600);
            nivel = "bajo";
            nivelSeg.html(nivel);
            espanNivelesColores.removeClass().addClass("spanNivelesColores nulo");
        }

        function limpiarError() {
            var divError = $(".error");
            if (!divError.hasClass("oculto")) {
                divError.addClass("oculto");
            }
        }

        $(document).on('keyup', 'input', function (e) {
            var nivelSeg = $("#nivelseguridad");
            devuelveNivel($(this), e);
            nivelSeg.html(nivel);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="txtCodUsuario" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtEmail" runat="server" Text="" Visible="false"></asp:Label>
    <h1 style="text-align: center; color: #73879C">ACTUALIZACIÓN DE CONTRASEÑA</h1>
    <fieldset class="border" style="width: 55%; margin-left: 20%; height: 35%">
        <legend><b>MODIFICAR CONTRASEÑA</b></legend>
        <section style="padding-top: 3%"></section>
        <fieldset>
            <section style="padding-top: 3%"></section>
            <div class="form-group">
                <asp:Label ID="Label14" Style="margin-left: 25%" runat="server" Text="Email"><b>Ingrese Contraseña Nueva</b></asp:Label>
                <section style="padding-top: 1%"></section>
                <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" onkeyup="devuelveNivel(this,event)" class="form-control" Style="width: 50%; margin-left: 25%"></asp:TextBox>

                <asp:Label ID="Label1" Style="margin-left: 25%" runat="server" Text="Email"><b>Confirmar Contraseña</b></asp:Label>
                <section style="padding-top: 1%"></section>
                <asp:TextBox ID="txtConfirmarContrasena" runat="server" TextMode="Password" class="form-control" Style="width: 50%; margin-left: 25%"></asp:TextBox>
                <section style="padding-top: 2%"></section>
                <asp:LinkButton ID="btnSalir" CssClass="btn btn-danger" runat="server" OnClick="btnSalir_Click" Width="100px" Style="margin-left: 25%; height: 40px" Text="Salir">
                    <section style="padding-top: 10%"></section>
                    <span class="glyphicon glyphicon-remove-circle" style="color: white" aria-hidden="true"></span>
                    <p5 style="color: white">Salir</p5>
                </asp:LinkButton>
                <asp:LinkButton ID="btnConfirmar" CssClass="btn btn-success" runat="server" OnClick="btnConfirmar_Click" Width="100px" Style="margin-left: 30%; height: 40px" Text="Enviar">
                    <section style="padding-top: 10%"></section>
                    <span class="glyphicon glyphicon-ok-sign" style="color: white; text-align: center" aria-hidden="true"></span>
                    <p5 style="color: white">Enviar</p5>
                </asp:LinkButton>
            </div>
        </fieldset>
        <div class="nivelSeguridad" style="background-color: white; width: 30rem">
            <p>Nivel de seguridad de contraseña</p>
            <span id="nivelseguridad">bajo</span>
            <div class="nivelesColores">
                <div class="spanNivelesColores"></div>
            </div>
            <div class="NivelesColores">
            </div>
        </div>
        <h2 class="clavecorrecta oculto"></h2>
    </fieldset>
    <script src="js/sweetalert.js"></script>
    <script>
        function alertVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese una contraseña',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertContrasenaNoCoinciden() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'La contraseña no coinciden',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertaagregar() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Actualizado',
                text: 'Se Actualizó la contraseña correctamente',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertErrorRegistro() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'No se pudo agregar correctamente',
                showConfirmButton: false,
                timer: 2000
            })
        }
    </script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>

</asp:Content>

