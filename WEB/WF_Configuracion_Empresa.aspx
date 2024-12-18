<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Configuracion_Empresa.aspx.cs" Inherits="WF_Configuracion_Empresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body {
            background-color: #E6E6E7;
        }

        .field {
            display: flex;
            position: relative;
            margin-left: 2000px;
            width: 50%;
            flex-direction: row;
            box-shadow: 1px 1px 0 rgb(22, 160, 133), 2px 2px 0 rgb(22, 160, 133), 3px 3px 0 rgb(22, 160, 133), 4px 4px 0 rgb(22, 160, 133), 5px 5px 0 rgb(22, 160, 133), 6px 6px 0 rgb(22, 160, 133), 7px 7px 0 rgb(22, 160, 133);
        }

            .field > input[type=text],
            .field > button {
                display: block;
                font: 1.1em 'Montserrat Alternates';
            }

            .field > input[type=text] {
                flex: 1;
                padding: 0.3em;
                border: 0.3em solid rgb(26, 188, 156);
            }

            .field > button {
                padding: 0.6em 0.7em;
                background-color: rgb(26, 188, 156);
                color: white;
                border: none;
            }
    </style>

        <script type="text/javascript">

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
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1 style="text-align: center; color: #73879C">DATOS DE EMPRESA</h1>

    <asp:Label ID="txtEmpresa" runat="server" Text="" Visible="false"></asp:Label>
    <%-- <asp:Label ID="txtdatPatro" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtpkafi" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtcodafi" runat="server" Text="" Visible="false"></asp:Label>--%>

    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row" style="padding-top: 50px">
            <div class="col-sm-9 col-md-6" style="margin-top: -95px">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Ruc"></asp:Label>
                    <section style="padding: 0px;"></section>
                    <asp:TextBox ID="txtruc" onkeypress="javascript:return SoloNumeros(event,this)" runat="server" class="form-control" Width="100%" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Nombre de Empresa"></asp:Label>
                    <asp:TextBox ID="txtNombreempresa" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Rubro"></asp:Label>
                    <section style="padding: 0px;"></section>
                    <asp:TextBox ID="txtrubro" runat="server" class="form-control" Width="100%" ReadOnly="True"></asp:TextBox>
                </div>
               
                <div class="form-group">
                        <asp:Label ID="Label17" runat="server" Text="Logo"></asp:Label>
                     <br />
                        <itemtemplate>

                            <asp:FileUpload ID="LogoSanCosme" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                        </itemtemplate>
                    </div>

                 <div class="form-group">
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-12">
                                                <img id="Logo" class="img-responsive align-content-center" style="width: 90rem; height: 30rem; margin-left:30rem" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMGE_Logo"))%>" />

                                            </div>

                                   
                                            

                                        </ItemTemplate>

                                    </asp:Repeater>
                                </div>
                 
            </div>

            <div class="col-sm-9 col-md-6" style="margin-top: -95px; margin-left: 0px">
                <%--<div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="imagen"></asp:Label>
            <section style="padding: 0px;"></section>
            <asp:TextBox ID="txtimagen" runat="server" class="form-control" Width="130%"></asp:TextBox>
            </div>--%>

                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Representante"></asp:Label>
                    <asp:TextBox ID="txtrepresentante" onkeypress="javascript:return  SoloLetrasYEsp(event,this)" runat="server" class="form-control" Width="130%"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="telefono"></asp:Label>
                    <section style="padding: 0px;"></section>
                    <asp:TextBox ID="txttelefono" onkeypress="javascript:return SoloNumeros(event,this)" runat="server" class="form-control" Width="130%"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="correo"></asp:Label>
                    <section style="padding: 0px;"></section>
                    <asp:TextBox ID="txtcorreo" runat="server" class="form-control" Width="130%"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Direccion"></asp:Label>
                    <section style="padding: 0px;"></section>
                    <asp:TextBox ID="txtdireccion" runat="server" class="form-control" Width="130%"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row justify-content-center" style="margin-left: 270px">
            
                <section style="padding: 10px;"></section>

                <asp:LinkButton ID="btnActualizarEmpresa" CssClass="btn btn-primary" Width="300px" runat="server" Text="Enviar" OnClick="btnActualizarEmpresa_Click"></asp:LinkButton>
                <asp:LinkButton ID="btnatras" CssClass="btn btn-success" runat="server" Width="300px" Text="Atras" OnClick="btnatras_Click"> <span class="glyphicon glyphicon-backward" style="color:white" aria-hidden="true"></span><p5 style="color:white">Regresar</p5></asp:LinkButton>
            
        </div>
    </div>
    <section>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                              <script src="dist/bootstrap-input-spinner.js"></script>
        <script>
            $("input[type='number']").inputSpinner()
        </script>
        <!-- Alertas -->
        <script src="js/sweetalert.js"></script>
        <script>
            function ActualizarEmpresa() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Enviado',
                    text: 'Se actualizaron los datos exitosamente.',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCorreoIncorrecto() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'No es valido el correo ingresado',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function alertErrorImagen() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Debe seleccionar un archivo',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
    </section>
</asp:Content>


