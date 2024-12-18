<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_MiCuenta.aspx.cs" Inherits="WF_MiCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <style>
        fieldset {
            border: 1px solid #999;
            border-radius: 8px;
            box-shadow: 0 0 10px #999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="text-align: center; color: #73879C">MI CUENTA</h1>
    <asp:Label ID="txtpatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtcodsocio" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtpkafi" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtcuentapk" runat="server" Text="" Visible="false"></asp:Label>
    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 85%">
        <section style="padding-left: 30%; padding-top: 150px">
            <div class="container register">
                <div class="col-md-12 register-right">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row register-form">
                                <div class="col-sm-3 col-md-8">
                                    <asp:TextBox ID="txtsolicitud" runat="server" class="form-control" Width="100%" Visible="false"></asp:TextBox>
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="Saldo"></asp:Label>
                                        <asp:TextBox ID="txtSaldo" runat="server" ReadOnly="true" class="form-control" Width="190%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Monto Incripcion"></asp:Label>
                                        <asp:TextBox ID="txtIncripcion" ReadOnly="True" runat="server" class="form-control" Width="190%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Numero Cuenta"></asp:Label>
                                        <asp:TextBox ID="txtCuenta" ReadOnly="True" runat="server" class="form-control" Width="190%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label9" runat="server" Text="Numero Transaccion"></asp:Label>
                                        <asp:TextBox ID="txtTransaccion" ReadOnly="True" runat="server" class="form-control" Width="190%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lbl" runat="server" Text="Socio"></asp:Label>
                                        <asp:TextBox ID="NumSocio" ReadOnly="True" minlength="9" MaxLength="9" onkeypress="javascript:return SoloNumeros(event)" runat="server" class="form-control" Width="190%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-9 col-md-6" style="margin-top: -40px;margin-left:300px">
                                    <div class="form-group">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <div class="col-md-4">
                                                    <img id="profile" class="img-responsive align-content-center" style="width: 500px; height: 300px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMGCu_FIleImage"))%>" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <section style="padding: 10px;"></section>
                                    <div class="form-group" style="margin-left: 10%;margin-top:-10px">
                                        <asp:Label ID="Label18" runat="server" Text="Adjuntar Foto"></asp:Label>
                                        <itemtemplate>
                                            <asp:FileUpload ID="FileFotoProfile" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />

                                            <asp:LinkButton ID="btnpushimage" CssClass="btn btn-info" runat="server" OnClick="btnpushimage_Click" Width="300px" Text="Cargar Imagen">
                                            <span class="glyphicon glyphicon-check" style="color: white" aria-hidden="true"></span>
                                            <p5 style="color: white">Cargar Imagen</p5>
                                            </asp:LinkButton>
                                        </itemtemplate>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <script src="js/sweetalert.js"></script>
            <script>
                function alertaagregar() {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Actualizado',
                        text: 'Se Actualizo Los datos Personales',
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
                function celularVacio() {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Incorrecto el formato del Numero',
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
                function contraseñaVacio() {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Ingrese su Contraseña',
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


            <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
            <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="dist/https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
            <script src="dist/https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="dist/js/scripts.js"></script>
            <script src="dist/https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
            <script src="dist/assets/demo/chart-area-demo.js"></script>
            <script src="dist/assets/demo/chart-bar-demo.js"></script>
            <script src="dist/https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
            <script src="dist/https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
            <script src="dist/assets/demo/datatables-demo.js"></script>

        </section>
    </fieldset>
</asp:Content>

