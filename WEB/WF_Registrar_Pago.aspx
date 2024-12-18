<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Registrar_Pago.aspx.cs" Inherits="WF_Gestionar_Prestamos" %>

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
    <h1 style="text-align: center; color: black"><b>REGISTRAR PAGOS</b></h1>

    <div class="row mt" style="margin-left: 100px;width:110%">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>BUSCAR PRÉSTAMO</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm" method="get" action="">
                        <section style="padding-top: 20px"></section>

                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="lblCodPrestamo" runat="server" Text="Nombre del Socio:"></asp:Label>
                                <asp:TextBox ID="txtCodPrestamo1" runat="server" class="form-control" type="number" Width="70%"></asp:TextBox>
                                <asp:TextBox ID="txtNombreCompleto" runat="server" class="form-control" Width="70%" Height="50%" value=""></asp:TextBox>
                            </div>
                        </div>
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

    <div class="row mt" style="margin-left: 100px;width:110%">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>DATOS DEL PRÉSTAMO</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 20px"></section>

                        <div>
                            <asp:GridView ID="gv_ListarPrestamos" onsubmit="return false" runat="server" Style="margin-left: 25px" OnRowCommand="gv_ListarPrestamos_RowCommand" OnPageIndexChanging="gv_ListarPrestamos_PageIndexChanging" EmptyDataText="No se encontraron préstamos con los datos ingresados." CssClass="table-bordered table-hover" Width="95%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_ListarPrestamos_RowDataBound" AllowPaging="True" PageSize="10">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id_Socio" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="PK_IS_Cod" runat="server" Text='<%# Eval ("PK_IS_Cod") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Id_Prestamo" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="PK_IPre_Cod" runat="server" Text='<%# Eval ("PK_IPre_Cod") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NombreCompleto" HeaderText="Nombres Completos" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center" ></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IS_Dni" HeaderText="DNI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="VSol_Distrito" HeaderText="Distrito" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="VTP_Nombre" HeaderText="Tipo Préstamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FPre_Importe" HeaderText="Importe" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FPre_Tasa_Mensual" HeaderText="TEM" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FPre_Tasa_Diaria" HeaderText="TED" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FPre_Tcea" HeaderText="TCEA" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IPre_Cuotas" HeaderText="N° Cuotas" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DPre_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="IDEstadoPrestamo" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="FK_IEPre" runat="server" Text='<%# Eval ("FK_IEPre") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="VEPre_Estado_Prestamo" HeaderText="Estado Préstamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Opción" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Button ID="btnVerCuotas" CssClass="btn btn-success" runat="server" CommandName="Ver" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Style="color: white" Text="Ver Cuotas" aria-hidden="true"></asp:Button>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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

    <div class="container register">
        <div class="col-md-12 register-right">
            <div class="tab-content" id="myTabContent">

                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">INFORMACIÓN DE PAGO</h4>
                            </div>

                            <div class="modal-body modal-lg">
                                <div class="row">
                                    <div class="col">

                                        <asp:ScriptManager runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <contenttemplate>
                                                    <asp:GridView ID="gv_ListarCuotas" onsubmit="return false" runat="server" Style="margin-left: 25px" OnRowCommand="gv_ListarCuotas_RowCommand" OnPageIndexChanging="gv_ListarCuotas_PageIndexChanging" EmptyDataText="No hay listado de cuotas." CssClass="table-responsive-sm table-hover" Width="95%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_ListarCuotas_RowDataBound" AllowPaging="True" PageSize="10">
                                                        <columns>
                                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                                <itemtemplate>
                                                                    <asp:Label ID="PK_IC_Cod" runat="server" Text='<%# Eval ("PK_IC_Cod") %>'></asp:Label>
                                                                </itemtemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="IC_NumeroCuota" HeaderText="N° de Cuota" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DC_FechaInicio" HeaderText="Fecha Inicio" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DC_FechaFin" HeaderText="Fecha Fin" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="FC_ValorCuota" HeaderText="Valor Cuota" Visible="false" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                                                                <ItemStyle CssClass="text-center"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="FC_MontoAPagar" HeaderText="Importe" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Monto" HeaderText="Penalidad" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DiasRetraso" HeaderText="DiasRetraso" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Total" HeaderText="Total a Pagar" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="DiasRetraso" Visible="false">
                                                                <itemtemplate>
                                                                    <asp:Label ID="DiasRetraso" runat="server" Text='<%# Eval ("DiasRetraso") %>'></asp:Label>
                                                                </itemtemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IDEstadoCuota" Visible="false">
                                                                <itemtemplate>
                                                                    <asp:Label ID="FK_IECU_Cod" runat="server" Text='<%# Eval ("FK_IECU_Cod") %>'></asp:Label>
                                                                </itemtemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="VEcu_Estado_Cuota" HeaderText="Estado Cuota" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <headerstyle cssclass="text-center"></headerstyle>
                                                                <itemstyle cssclass="text-center"></itemstyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Pagar" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                                <itemtemplate>
                                                                    <asp:Button ID="btnRegistrarPago" CssClass="btn btn-success" runat="server" CommandName="Registrar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Style="color: white" Text="Pagar Cuota" aria-hidden="true"></asp:Button>
                              
                                                                </itemtemplate>
                                                            </asp:TemplateField>
                                                        </columns>
                                                        <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
                                                    </asp:GridView>
                                                </contenttemplate>
                                            </asp:UpdatePanel>
                                        
                                    </div>
                                    <div class="col-sm-3 col-md-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNCuota" runat="server" class="form-control" Width="65%" ValidateRequestMode="Inherit" Enabled="False" Visible="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFechaInicio" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFechaFin" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="txtImporte" runat="server" class="form-control" Width="65%" Enabled="false" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtIC_Cod" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtIECU_Cod" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtEstadoCuota" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtDNI" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtDiasRetraso" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtSocio" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtTotCuotas" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtTot" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtpRESCOD" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                            <asp:TextBox ID="txtPrestamoSet" runat="server" class="form-control" Width="65%" Enabled="False" Visible="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
        <script type="text/javascript">
            function scrollToTop() {
                window.scrollTo(0, 0);
            }
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
