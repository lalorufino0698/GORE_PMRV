<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/SoporteCoopac.aspx.cs" Inherits="SoporteCoopac" %>

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
</head>
<body>
    <form id="SOPORTE" runat="server">
        <section style="padding: 2rem"></section>
        <asp:Panel ID="panel1" runat="server">
            <div class='box-login center' style="width: 33rem">
                <div class='fieldset-body' id='login_form' style="margin-bottom: 1rem; height: 5rem">
                    <p class='field'>
                        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Image runat="server" ID="profile" CssClass="img-circle" Height="200" Width="250" Style="margin-left: 2rem" />
                        <br style="padding: 2rem"></br>
                        <label for='user' style="margin-left: 1rem">POR FAVOR, COMUNICARSE AL :</label>

                        <asp:TextBox ID="TXTnumber" class="form-control" ReadOnly="true"  runat="server" placeholder="992-255-522" Style="margin-left: 1.5rem;text-align:center"></asp:TextBox>
                        <span id='valida' class='i i-warning'></span>
                    </p>
                    <div class="row">
                        <div class="col-log-6">
                            <asp:Button class="btnRetornar" runat="server" Text="Retornar" OnClick="Unnamed_Click" Style="margin-left: 1.5rem"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
