<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Registrar_Ahorros.aspx.cs" Inherits="WF_Registrar_Ahorros" %>

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
    <!--Pequeño script para el movimiento del title-->
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
    <h1 style="text-align: center; color: black"><b>DEPÓSITO DE AHORRO POR CAJA</b></h1>
    <!-- FORM VALIDATION -->
    <asp:Label ID="txtcodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtsociocod" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtdatos" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row mt" style="margin-left: 200px">
        <div class="col-lg-10">
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm" method="get">
                        <section style="padding-top: 10%"></section>
                        <div class="col-sm-3 col-md-4" style="margin-top:-10%">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Socio"></asp:Label>
                                <asp:TextBox ID="txtsocio" maxlength="9" onkeypress="javascript:return SoloNumeros(event)"  runat="server" len class="form-control" Width="90%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6" style="margin-top:-5%" >
                            <div class="form-group">
                                <br />
                               
                                <asp:LinkButton ID="btnBuscarSocio" CssClass="btn btn-info" runat="server" OnClick="btnBuscarSocio_Click" Text="Enviar">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true" style="color: white"></span>
                                    <p5 style="color: white">Buscar</p5>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnBorrar" CssClass="btn btn-warning" runat="server" OnClick="btnBorrar_Click" Text="Enviar">
                                    <span class="glyphicon glyphicon-erase" aria-hidden="true" style="color: white"></span>
                                    <p5 style="color: white">Limpiar</p5>
                                </asp:LinkButton>
                            </div>
                        </div>
                      
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <div class="row mt" style="margin-left: 200px">
        <div class="col-lg-10">
            <h4><i class="fa fa-angle-right"></i> DATOS SOCIO</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 25px"></section>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="NOMBRES COMPLETOS"></asp:Label>
                                <asp:TextBox ID="txtnombres" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="80%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="APELLIDOS"></asp:Label>
                                <asp:TextBox ID="txtapellido" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="90%"></asp:TextBox>
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
    <asp:Panel runat="server" ID="PanelHistorial">
        <div class="row mt" style="margin-left: 200px">
            <div class="col-lg-10">
                <h4><i class="fa fa-angle-right"></i>HISTORIAL DE MOVIMIENTOS</h4>
                <div class="form-panel">
                    <div class=" form">
                        <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                            <section style="padding-top: 25px"></section>

                            <asp:GridView ID="gv_Tabla_Lista_Movimientos" OnRowCommand="gv_Tabla_Lista_Movimientos_RowCommand" runat="server" EmptyDataText="El socio no tiene ningun movimiento" CssClass="table-responsive-sm table-hover" Width="70%" AutoGenerateColumns="False" GridLines="None" style="text-align: center; margin-left: auto; margin-right: auto" OnRowDataBound="gv_Tabla_Lista_Movimientos_RowDataBound">

                                <columns>

                                    <asp:BoundField DataField="PK_Numero_Transaccion" HeaderText="Numero Transaccion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <headerstyle cssclass="text-center"></headerstyle>
                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="PK_TM_Cod" HeaderText="Codigo Operacion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <headerstyle cssclass="text-center"></headerstyle>

                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="VTM_Nombre_Tipo_Movimiento" HeaderText="Tipo Ahorro " ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <headerstyle cssclass="text-center"></headerstyle>

                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="DMove_Fecha_Registro" DataFormatString="{0:d}" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <headerstyle cssclass="text-center"></headerstyle>
                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="FMove_Importe" HeaderText="Monto" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <headerstyle cssclass="text-center"></headerstyle>

                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="FK_IS_Cod" HeaderText="Socio" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" Visible="false">
                                        <headerstyle cssclass="text-center"></headerstyle>

                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="VRo_Nombre_Rol" HeaderText="Usuario" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" Visible="false">
                                        <headerstyle cssclass="text-center"></headerstyle>

                                        <itemstyle cssclass="text-center"></itemstyle>
                                    </asp:BoundField>
                                </columns>
                                <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
                            </asp:GridView>

                            <section style="padding-top: 20px"></section>
                            <div class="col-sm-9 col-md-6" style="margin-left: 750px">

                                <asp:Label ID="Label2" runat="server" Text="Ultimo Movimiento"></asp:Label>
                                <asp:TextBox ID="txtmovimiento" runat="server" class="form-control" Width="40%"></asp:TextBox>

                            </div>
                            <div class="col-sm-9 col-md-6" style="margin-left: 750px">

                                <asp:Label ID="Label3" runat="server" Text="Saldo Actual"></asp:Label>
                                <asp:TextBox ID="txtsaldoactual" runat="server" class="form-control" Width="40%"></asp:TextBox>

                            </div>

                            <div class="col-sm-9 col-md-6" style="margin-left: 750px">

                                <asp:Label ID="Label6" runat="server" Text="Saldo Disponible"></asp:Label>
                                <asp:TextBox ID="txtsaldodisponible" runat="server" class="form-control" Width="40%"></asp:TextBox>

                            </div>

                            <div class="col-sm-3 col-md-6" style="margin-left: 500px">

                                <br />
                                <asp:LinkButton Style="margin-left: -45px" ID="btnRegistrar" CssClass="btn btn-warning" Width="18%" runat="server" OnClick="btnRegistrar_Click" Text="Cancelar"> <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true" style="color:green"></span>
                                         <p5 style="color:white">Registrar</p5>
                                </asp:LinkButton>
                                <asp:LinkButton Style="margin-left: 5px" ID="btnGenerar" CssClass="btn btn-info" Width="28%" runat="server" OnClick="btnGenerar_Click" Text="Generar"> <span class="glyphicon glyphicon-file" aria-hidden="true" style="color:white"></span>
                                         <p5 style="color:white">Generar Reporte</p5>
                                </asp:LinkButton>

                            </div>
                    </div>

                    <section style="padding-top: 300px"></section>
                </div>
            </div>
        </div>
    </asp:Panel>

   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 300px" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">INFORMACIÓN DE AHORRO</h4>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblfecha" runat="server" Text="Fecha Transacción:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtfechstransaccion" runat="server" class="form-control" Width="65%" ValidateRequestMode="Inherit" TextMode="Date"></asp:TextBox>
                                <asp:Label ID="lblErrorFecha" runat="server" ForeColor="Red" Visible="false">El campo es requerido</asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="txtimporte" runat="server" Text="Monto:"></asp:Label>
                                <asp:TextBox ID="txtmonto" onkeypress="javascript:return SoloNumeros(event)" runat="server"  class="form-control" Width="75%"></asp:TextBox>
                                 <asp:Label ID="lblMonto" runat="server" ForeColor="Red" Visible="false">El campo es requerido</asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lbldetalle" runat="server" Text="Detalle"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtobservacion" runat="server" TextMode="MultiLine" class="form-control" Width="200%"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6" style="margin-top: 100px; margin-right: -500px">
                            <div class="modal-footer">
                                <asp:LinkButton ID="btnGrabar" CssClass="btn btn-success" Width="50%" runat="server" OnClick="btnGrabar_Click" Text="Grabar"> <span class="glyphicon glyphicon-save-file" aria-hidden="true" style="color:white"></span>
                                         <p5 style="color:white">Grabar</p5>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                         <!-- Alertas -->
    <script src="js/sweetalert.js"></script>
    <script>
        function RegistrarAhorro() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registrado',
                text: 'Se Registro el deposito de ahorro correctamente',
                showConfirmButton: false,
                timer: 3000
            })
        }
        function alertSociovacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese  DNI',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertaVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Campos requeridos',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function CerrarModal() {
            $('#myModal').modal('hide');
        }
    </script>
</asp:Content>


