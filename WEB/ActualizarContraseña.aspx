<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="ActualizarContraseña.aspx.cs" Inherits="ActualizarContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
    <style>
        fieldset {
            border: 1px solid #999;
            border-radius: 8px;
            box-shadow: 0 0 10px #999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="txtDniSocio" runat="server" Text="" Visible="false"></asp:Label>
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
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" class="form-control" Style="width: 50%; margin-left: 25%"></asp:TextBox>

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
                    <span class="glyphicon glyphicon-ok-sign" style="color: white ; text-align:center" aria-hidden="true"></span>
                    <p5 style="color: white">Enviar</p5>
                </asp:LinkButton>
            </div>
        </fieldset>
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
</asp:Content>

