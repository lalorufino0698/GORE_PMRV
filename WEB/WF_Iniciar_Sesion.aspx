<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WF_Iniciar_Sesion.aspx.cs" Inherits="WF_Iniciar_Sesion" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CAFED</title>
    <link rel="icon" href="img/gore_img/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css'>
    <link rel="stylesheet" href="dist/style_login1.css">
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


    <script src="https://www.google.com/recaptcha/api.js"></script>
   <script type="text/javascript">
       var txt = "CAFED - Plataforma de materiales y recursos virtuales";
       var espera = 100;
       var refresco = null;
       function rotulo_title() {
           document.title = txt;
           txt = txt.substring(1, txt.length) + txt.charAt(0);
           refresco = setTimeout("rotulo_title()", espera);
       }

       rotulo_title();


       function SoloNumeros(e) {
           var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
           return ((key_press > 47 && key_press < 58) || key_press == 46);
       }

       function SoloLetrasYEsp() {

           if ((event.keyCode >= 65) && (event.keyCode <= 90) || (event.keyCode >= 97) && (event.keyCode <= 122) || event.keyCode == 32 || event.keyCode >= 192 && event.keyCode <= 255) {
               event.returnValue = true;
           }
           else {
               event.returnValue = false;
           }
       }

   </script>

    <style type="text/css">
        .enlace-color {
            color: #2A3F54;
        }
    </style>
</head>
<body>
    <form id="LOGIN" runat="server">
        <div class='box'>
            <div class='box-form'>
                <div class='box-login-tab'></div>
                <div class='box-login-title'>
                    <div class='i i-login'></div>
                    <a href="Inicio.aspx"><h2 style="color:black">
                                    INICIO
                                </h2>
                    </a>
                </div>
                <div class='box-login'>
                    <div class='fieldset-body' id='login_form'>
                        <p class='field'>
                            <asp:Label ID="txtcontraseñabus" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtpkiu" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtusu" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtdnibus" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtcodigobus" runat="server" Text="" Visible="false"></asp:Label>

                            <asp:Label ID="txtcorreobus" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtfkrol" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtfksocio" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtfkpatrocinador" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>

                            <asp:Image runat="server" ID="profile" CssClass="img-circle" Height="180" Width="250" />
                            <label for='user' style="color: #9c549b; font-size: 18px"><span class="input-group-text"><i class="fas fa-user"></i></span> USUARIO</label>
                            <asp:TextBox ID="txtUsuario" onkeypress="javascript:return SoloLetrasYEsp()" runat="server" placeholder="Ingrese su usuario" CssClass="campo-requerido"></asp:TextBox>
                        </p>
                        <p class='field'>
                            <label for='pass' style="color: #9c549b; font-size: 18px">  <span class="input-group-text"><i class="fas fa-key"></i></span> CONTRASEÑA</label>
                            <asp:TextBox TextMode="Password" ID="txtContraseña" runat="server" placeholder="Ingrese su contraseña"></asp:TextBox>
                            <span id='close' class='i i-close'></span>
                        </p>
                        <p class="g-recaptcha" id="recaptcha" runat="server" data-sitekey="PLACEHOLDER" style="margin-left: -10px"></p>

                        <label class='checkbox'  style="color: #9c549b; font-size: 16px" >
                            <input type='checkbox' id='myCheckbox' onclick="updateLoginInfo()" value='TRUE' title='Keep me Signed in' />
                            ¿Olvidó su contraseña?
                        </label>

 
                        <asp:Button class="btnIniciar" runat="server"  Text="INICIAR SESION" OnClick="Unnamed_Click"></asp:Button>
                    </div>

                </div>
                <div class='box-info'>
                    <p>
                        <button onclick="closeLoginInfo();" class='b b-info i i-left' title='Back to Sign In'></button>
                        <h3>¿Necesitas Ayuda?</h3>
                    </p>

                    <div class='line-wh'></div>
                    <button class='b-support' title='Recuperar contraseña'><a style="color: #032942" href="WF_Olvidar_Contraseña.aspx">Olvidaste tu Contraseña</a></button>
                    <button class='b-support' title='Contactar soporte'><a style="color: #032942" href="SoporteCoopac.aspx">Contáctate con Soporte</a></button>

                    <div class='line-wh'></div>
                </div>
            </div>
        </div>
        <script src="../js/sweetalert.js"></script>
        <script src="dist/script_login1.js"></script>
        <script>

            function updateLoginInfo() {
                var checkbox = document.getElementById('myCheckbox');
                var isChecked = checkbox.checked;

                if (isChecked) {
                    openLoginInfo();
                } else {
                    // Oculta el evento onclick si el checkbox no está marcado
                    closeLoginInfo();
                }
            }
        </script>

        <script>
            function usuarioVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Usuario',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
            function ContraseñaVacia() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Contraseña',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
            function inicioExitoso() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Bienvenido',
                    text: 'Inicio sesion exitosamente',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
            function contraseñaincorrecta() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'No coincide la contraseña',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
            function noexisteUsuario() {
                Swal.fire({
                    position: 'center',
                    icon: 'warning',
                    title: 'No existe Usuario',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
            function Director() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Usted, es el Director',
                    showConfirmButton: false,
                    timer: 1000
                })
            }
            function Docente() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Usted, es el Docente',
                    showConfirmButton: false,
                    timer: 1000
                })
            }

            function errordatos() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese sus Datos nuevamente',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function Auxiliar() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Usted es el Auxiliar',
                    showConfirmButton: false,
                    timer: 1000
                })
            }

        </script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>
    </form>
</body>
</html>
