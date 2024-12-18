<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Registrar_Aporte.aspx.cs" Inherits="WF_Registrar_Aporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section style="padding-top: 50px"></section> 
    <!--main content start-->
        <h1 style="text-align: center; color: black"><b>APORTE Y OTROS</b></h1>
    <!-- /row -->
    <!-- FORM VALIDATION -->
    <asp:Label ID="txtcodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtsociocod" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row mt" style="margin-left: 100px">
        <div class="col-lg-8">
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm" method="get">
                        <section style="padding-top: 100px"></section>
                        <div class="col-sm-3 col-md-4" style="margin-top:-10%">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Socio"></asp:Label>
                                <asp:TextBox ID="txtsocio" maxlength="9" onkeypress="javascript:return SoloNumeros(event)"  runat="server" class="form-control" Width="95%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6" style="margin-top:-5%">
                            <div class="form-group">
                                <br />
                                <asp:LinkButton ID="btnBuscarSocio" CssClass="btn btn-info" runat="server" OnClick="btnBuscarSocio_Click" Text="Enviar">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true" style="color: white"></span>
                                    <p5 style="color: white">Buscar</p5>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-warning" runat="server" OnClick="btnBorrar_Click" Text="Enviar">
                                    <span class="glyphicon glyphicon-erase" aria-hidden="true" style="color: white"></span>
                                    <p5 style="color: white">Limpiar</p5>
                                </asp:LinkButton>
                            </div>

                        </div>
                    </form1>
                </div>
            </div>
        </div>
    </div>
   <section style="padding-top: 10px"></section>     <!-- /form-panel -->

    <div class="row mt" style="margin-left: 100px">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i> DATOS SOCIO</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 25px"></section>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="NOMBRES COMPLETOS"></asp:Label>
                                <asp:TextBox ID="txtnombres" runat="server" class="form-control" Width="80%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="APELLIDOS"></asp:Label>
                                <asp:TextBox ID="txtapellido" runat="server" class="form-control" Width="90%"></asp:TextBox>
                            </div>
                        </div>
                        <section style="padding-top: 100px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <div class="row mt" style="margin-left: 100px">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i> DATOS APORTE</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 25px"></section>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="FECHA TRANSACCIÓN"></asp:Label>
                                <asp:TextBox ID="txtfecha" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label12" runat="server" Text="DETALLE"></asp:Label>

                                <asp:TextBox ID="txtobservacion" runat="server" TextMode="MultiLine" class="form-control" Width="200%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="MONTO APORTE"></asp:Label>
                                    <br>
                                    <asp:TextBox ID="txtmonto" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <section style="padding-top: 160px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <div class="row">
        <div class="col-lg-11" style="margin-top: -500px; margin-left: 150px">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <!-- end custombox -->
            </div>
            <!-- end col-4 -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <!-- end custombox -->
            </div>
            <!-- end col-4 -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="custom-box">
                    <div class="servicetitle">
                        <h4>Monto Aporte</h4>
                        <hr>
                    </div>
                    <div class="icn-main-container">
                        <span class="icn-container">s/<asp:Label ID="Label14" runat="server"></asp:Label></span>
                    </div>
                    <p>El monto por aporte se debera pagar cada mes, para que el socio este habilitado en el sistema.</p>
                    <ul class="pricing">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        = s/<asp:Label ID="Label3" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                        = s/<asp:Label ID="Label8" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="Label10" runat="server"></asp:Label>
                        = s/<asp:Label ID="Label11" runat="server"></asp:Label>

                    </ul>
                    <asp:Button class="btn btn-theme" runat="server" ID="btnAporte" Text="Aplicar Aporte" OnClick="btnAporte_Click"></asp:Button>
                </div>
                <%--<!-- end custombox -->--%>
            </div>
            <!-- end col-4 -->
        </div>
        <!--  /col-lg-12 -->
    </div>

    <!-- Alertas -->
    <script src="js/sweetalert.js"></script>
    <script>
        function RegistrarAporte() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registrado',
                text: 'Se Registro el aporte correctamente',
                showConfirmButton: false,
                timer: 3000
            })
        }
    </script>
</asp:Content>

