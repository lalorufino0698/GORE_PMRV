<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_ConsultarCronograma_Cajera.aspx.cs" Inherits="WF_Gestionar_Prestamos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body {
            background-color: #E6E6E7;
        }

        .field {
            display: flex;
            position: relative;
            margin-left: 1100px;
            width: 25%;
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
    <!--Pequeño script para el movimiento del title-->
    <script type="text/javascript">
        var txt = "San Cosme - Coorperativa de ahorro y crédito  -  ";
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
    <script src="bootstrap/css/bootstrap.css" type="text/css"></script>
    <script src="bootstrap/css/bootstrap.min.css" type="text/css"></script>
    <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section style="padding-top: 50px"></section>
    <h1 style="text-align: center; color: black"><b>Consultar Cronograma</b></h1>

    <div class="row mt" style="margin-left: 100px; width: 110%">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>BUSCAR CRONOGRAMA</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm" method="get" action="">
                        <section style="padding-top: 20px"></section>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblDNI" runat="server" Text="DNI del Socio:"></asp:Label>
                                <asp:TextBox ID="txtDNISocio" runat="server" class="form-control" Width="50%" Height="50%" MaxLength="8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6">
                            <section style="padding-top: 5px"></section>
                            <div class="form-group">

                                <asp:LinkButton ID="btnBuscar" CssClass="btn btn-info" runat="server" OnClick="btnBuscar_Click" Text="Buscar">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true" style="color: white"></span>
                                    <p5 style="color: white">Buscar</p5>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnBorrar" CssClass="btn btn-warning" runat="server" OnClick="btnBorrar_Click" Text="Borrar">
                                    <span class="glyphicon glyphicon-erase" aria-hidden="true" style="color: white"></span>
                                    <p5 style="color: white">Limpiar</p5>
                                </asp:LinkButton>
                            </div>
                        </div>

                        <section style="padding-top: 150px"></section>
                    </form1>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt" style="margin-left: 100px; width: 110%">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>DATOS DEL CRONOGRAMA</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 20px"></section>
                        <asp:DropDownList ID="ddlPrestamo" runat="server" CssClass="form-control" Width="25%" Height="30px" OnSelectedIndexChanged="ddlPrestamo_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                        </asp:DropDownList>
                        <section style="padding-top: 15px"></section>
                        <div>
                            <asp:GridView ID="gv_ListarPrestamos" onsubmit="return false" runat="server" Style="margin-left: 25px" OnRowCommand="gv_ListarPrestamos_RowCommand" OnPageIndexChanging="gv_ListarPrestamos_PageIndexChanging" EmptyDataText="No se encontraron préstamos con los datos ingresados." CssClass="table-bordered table-hover" Width="95%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_ListarPrestamos_RowDataBound" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="NUMERO_CUOTA" HeaderText="N° Cuota" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FECHA_PAGO" HeaderText="Fecha de Pago" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DIAS_CORRIDOS" HeaderText="Dias Corridos" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AMORTIZACION" HeaderText="Amortizacion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="INTERES" HeaderText="Interes" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SEGURO" HeaderText="Seguro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CUOTA" HeaderText="Cuota" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SALDO" HeaderText="Saldo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="#008080" ForeColor="white" Font-Bold="true" />
                            </asp:GridView>
                        </div>
                        <asp:TextBox ID="txtCodPrestamo" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                        <section style="padding-top: 140px"></section>
                    </form1>
                </div>
            </div>
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
            function RegistrarPago() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Enviado',
                    text: 'Se registró el pago exitosamente.',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
        <script>
            function NoHayPrestamos() {
                Swal.fire({
                    position: 'center',
                    icon: 'alert',
                    title: '!!!',
                    text: 'No hay préstamos registrados..',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
        <script>
            function IngreseDatos() {
                Swal.fire({
                    position: 'center',
                    icon: 'alert',
                    title: '!!!',
                    text: 'Ingrese datos de búsqueda.',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
        <script>
            function NoPagar() {
                Swal.fire({
                    position: 'center',
                    icon: 'alert',
                    title: '!!!',
                    text: 'Ya está pagado, no joda',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>

    </section>

</asp:Content>
