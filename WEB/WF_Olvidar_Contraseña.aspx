<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WF_Olvidar_Contraseña.aspx.cs" Inherits="WF_Olvidar_Contraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Olvidar Contraseña</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css' />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="dist/style_olvidar.css" />
    <style rel="stylesheet" type="text/css">
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        #nivelseguridad {
            font-weight: bold;
            text-transform: uppercase;
        }

        #panel2,
        .formulario,
        .nivelSeguridad {
            width: 50%;
            /* xd */
            margin: 60px auto;
        }

        legend {
            text-align: center;
            margin-bottom: 10px;
        }

        input {
            margin: 5px auto;
            display: block;
        }

        label {
            margin: 0 auto;
            display: block;
            text-align: center;
        }

        .nivelSeguridad > p {
            margin-right: 15px;
        }

        .nivelSeguridad > span#nivelseguridad {
        }

        .nivelesColores {
            height: 10px;
            width: 188px;
            display: inline-block;
            position: relative;
            left: 25px;
        }

        .spanNivelesColores {
            background: #fff;
            width: 0;
            height: 10px;
            display: inline-block;
            position: absolute;
            background: url(http://momstudio.es/img/img-elmaquetadorweb/password-level-47px.png) no-repeat;
            /*border: 1px solid #f00;
  right: 120px;*/
        }
    </style>
    <script type="text/javascript">

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
            if (estaId === "txtContraseña") {

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

</head>
<body>
    <form id="LOGIN" runat="server">
      
        <asp:Panel ID="panel1"  runat="server">
            <div class='box-login center' style="width: 27rem">
                <div class='fieldset-body' id='login_form' style="margin-bottom: 5rem; height: 5rem">
                    <p class='field'>
                        <asp:Label ID="txtcontraseñabus1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtpkiu1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtusu1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtdnibus1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtcodbus1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtcorreobus1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtfkrol1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtfksocio1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="txtfkpatrocinador1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                       
                        <asp:Image runat="server" ID="profile" CssClass="img-circle" Height="200" Width="250" Style="margin-left: 2rem" />
                        <br style="padding: 2rem" />
                        <label for='user'>INGRESAR SU USUARIO</label>

                        <asp:TextBox ID="txtCodOlvidar" class="form-control"  runat="server" placeholder="Ingrese su Usuario" ></asp:TextBox>
                        <span id='valida' class='i i-warning'></span>
                    </p>
                    <div class="row">
                        <div class="col-log-6">
                            <asp:Button class="btnIniciar" runat="server" Text="Siguiente" OnClick="Unnamed_Click" Style="margin-left: 1rem"></asp:Button>
                        </div>

                        <div class="col-log-6">
                            <asp:Button class="btnIniciar" runat="server" Text="Retornar" OnClick="Retroceder" Style="margin-left: 1rem"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panel2" runat="server">

            <div class="formulario" style="background-color: white; width: 30rem">
                <fieldset>
                    <legend>Cambio de contraseña</legend>
                    <section style="padding: 1rem"></section>
                    <asp:Image runat="server" ID="Image1" CssClass="img-circle" Style="margin-left: 8rem" Height="150" Width="250" />
                    <section style="padding: 1rem"></section>
                    <div style="display: flex; justify-content: space-around">
                        <div>
                            <label for="claveActual">Contraseña</label>
                            <asp:TextBox ID="txtContraseña" onkeyup="devuelveNivel(this,event)" runat="server" Style="width: 21rem; margin-left: 5rem" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div style="display: flex; justify-content: space-around">
                        <div>
                            <label for="segundaClave">Confirmar Contraseña</label>
                            <asp:TextBox ID="txtContraseña2" runat="server" Style="width: 21rem; margin-left: 5rem" placeholder="Confirmar Contraseña" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button class="btnIniciar" runat="server" Text="SIGUENTE" OnClick="Actualizar"></asp:Button>
                     <asp:Button class="btnIniciar" runat="server" Text="Retornar" OnClick="Retroceder"></asp:Button>
                      
                </fieldset>
            </div>

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
        </asp:Panel>

        <asp:Panel ID="panel3" runat="server">
            <div class="formulario">
                <fieldset>
                    <legend style="color: white;">Regresar</legend>
                    <asp:Button runat="server" Text="Regresar a la Pagina Principal" OnClick="Unnamed_Click1" />
                </fieldset>
            </div>
        </asp:Panel>
        <script src="../js/sweetalert.js"></script>
        <script>
            function CodigoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingresar su usuario',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function ContraseñaVacia() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingresar su contraseña',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function IgualarContraseñas() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Las contraseñas no coinciden',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function Codigoincorrepto() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Se ha ingresado un codigo incorrecto',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function noexisteUsuario() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'El usuario ingresado no existe',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function ContraseñaActualizada() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Contraseña Actualizada con Exito',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>
    </form>
</body>
</html>
