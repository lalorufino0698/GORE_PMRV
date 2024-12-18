<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Simular_Prestamos.aspx.cs" Inherits="WF_Simular_Prestamos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="dist/StyleSheetSimuladorProestamo.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section style="padding: 20px;"></section>
    <div style="margin-left: 18%" class="nombreProducto">Simulador de Prestamos</div>

    <div class="sub_head_right">
        <img src="img/cabecera.png" alt="Alternate Text" />
        <div class="body_head" style="margin-left: 336px; width: 980px">
            <b>Préstamo De Consumo</b>
        </div>
        <section style="padding: 20px;"></section>
        <table width="900" border="0" cellpadding="0" cellspacing="0" class="table">
            <tbody>
                <tr>
                    <td class="td_left celda_arriba">¿Qué producto desea consultar?</td>
                    <td class="td_right_col2 celda_arriba">
                        <asp:DropDownList ID="ddlPrestamo" runat="server" CssClass="form-control" Width="65%" Height="30px" OnSelectedIndexChanged="PrestamoSeleccionado" AutoPostBack="true">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                        </asp:DropDownList></td>
                    <asp:Label ID="lblprestamo" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblMesesAdicionales" runat="server" Visible="false"></asp:Label>
                </tr>
                <tr>
                    <td class="td_left">¿Cuánto deseas solicitar?</td>
                    <td class="td_right_col2">
                        <asp:TextBox ID="txtmonto" runat="server" class="form-control" Width="30%"></asp:TextBox>
                        <asp:Label ID="TextBox3" runat="server" Text="SOLES" class="form-control" Width="18%" Enabled="false"></asp:Label>

                    </td>
                </tr>
                <tr id="filaCuota">
                    <td class="celdaCuota td_left">¿Solicitará cuotas adicionales?</td>
                    <td class="celdaCuota td_right_col2">
                        <asp:CheckBox runat="server" ID="checkcuota" class="datoEntrada" />
                        <asp:Label ID="lblcuotas" runat="server" Visible="false"></asp:Label>
                        <input type="hidden" name="cuotaAdic_12" id="cuotaAdic_12" value="0">
                    </td>
                </tr>
                <tr id="filaMeses">
                    <td class="td_left">¿Por cuánto tiempo?</td>
                    <td class="td_right_col2">
                        
                        <asp:DropDownList ID="txtmeses" runat="server" CssClass="form-control" Width="25%" Height="50%">
                            <asp:ListItem Text="Seleccione" Value="" />
                        </asp:DropDownList>
                        <asp:Label ID="Label7" runat="server" Text="Meses"></asp:Label>
                        <a data-toggle="tooltip" class="ic ic_info_tt" id="tooltip_time" title="Tiempo en el que se desea financiar el préstamo"></a>
                        <div id="tooltipTasa" class="tooltip tooltipTasa" style="display: none; left: 564.016px; top: 341.609px;">
                            <p>Tasa de interés referencial.</p>
                        </div>
                    </td>
                </tr>
                <tr id="filaTasa">
                    <td class="td_left">¿A qué tasa?</td>
                    <td class="td_right_col2">
                        <asp:TextBox ID="txtTEA" runat="server" class="form-control" Width="25%" Enabled="false"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text="%"></asp:Label>
                        <a data-toggle="tooltip" class="ic ic_info_tt" id="tooltip_tasa" title="Tasa de interés mensual"></a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>


    <div class="col-sm-3" style="margin-left: 700px">
        <asp:Button class="button_center" runat="server" ID="btnContinuar" Text="Continuar" OnClick="Unnamed_Click" Style="display: inline-block; text-align: center"></asp:Button>
        <asp:Button ID="btnLimpiar" class="button_center" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Style="text-align: center;"></asp:Button>
    </div>

    <asp:Panel ID="prestamo" runat="server" Visible="false">
        <section style="padding: 40px;"></section>
        <table width="900" border="0" cellpadding="0" cellspacing="0" class="table">
            <tbody>
                <tr id="filaFecha">
                    <td class="td_left">Fecha de Solicitud:</td>
                    <td class="td_right_col2">
                        <asp:TextBox ID="txtfecha" runat="server" class="form-control" Width="50%" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td_left">Dia de Pago:</td>
                    <td class="td_right_col2">
                        <asp:TextBox ID="txtfechapago" runat="server" class="form-control" Width="50%" Enabled="false"></asp:TextBox>
                        <asp:TextBox ID="txtfechapagoss" runat="server" class="form-control" Width="50%" Enabled="false" Visible="false"></asp:TextBox>
                </tr>
                <tr id="filaConstancia">
                    <td class="celdaCuota td_left">Envío virtual de constancias de pago:</td>
                    <td class="celdaCuota td_right_col2">
                        <asp:CheckBox runat="server" ID="checkenviovi" class="datoEntrada" />
                        <asp:Label ID="lblvirtual" runat="server" Visible="false"></asp:Label>
                        <input type="hidden" name="cuotaAdic_12" id="cuotaAdic_13" value="0">
                    </td>
                </tr>
                <tr id="filaConcstanciaFisica">
                    <td class="celdaCuota td_left">Envío físico de constancias de pago:</td>
                    <td class="celdaCuota td_right_col2">
                        <asp:CheckBox runat="server" ID="checkenviofi" class="datoEntrada" />

                        <asp:Label ID="lblfisico" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblambos" runat="server" Visible="false"></asp:Label>
                        <input type="hidden" name="cuotaAdic_12" id="cuotaAdic_14" value="0">
                    </td>
                </tr>

                <asp:Panel ID="periodoGracia" runat="server" Visible="false">
                    <tr id="filaPeriodoGracia">
                        <td class="td_left">
                            <asp:Label ID="lblperiodo" runat="server" Text="Periodo de gracia:"></asp:Label>
                        </td>
                        <td class="td_right_col2">
                            <asp:TextBox ID="txtperiodogracia" runat="server" class="form-control" Width="25%" Height="50%" CssClass="auto-style1" type="number" value="" min="1" max="10" step="1"></asp:TextBox>

                        </td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="valorBien" runat="server" Visible="false">
                    <tr id="filavalorbien">
                        <td class="td_left">
                            <asp:Label ID="lblvalorbien" runat="server" Text="Valor del Bien:"></asp:Label>
                        </td>
                        <td class="td_right_col2">
                            <asp:TextBox ID="txtvalorbien" runat="server" class="form-control" Width="25%" Height="50%" CssClass="auto-style1"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server" Text="soles"></asp:Label>
                        </td>
                    </tr>
                </asp:Panel>
            </tbody>
        </table>
        <asp:Panel ID="panelcuotas" runat="server">
            <a href="#openModal" class="button_center" style="display: inline-block; text-align: center; width: 130px; margin-left: 650px">Cuotas Adicionales</a>
        </asp:Panel>
        <section style="padding-top: 20px" />
        <div id="pnCaptchaProducto" style="display: block; margin-left: 280px">
            <div class="msg msg_adv" style="width: 400px;">
                <span class="icm icm_code"></span>
                <div class="center">
                    <p class="tc1_12">Ingrese el Texto de la Imagen Adjunta:</p>
                </div>
                <div class="center" style="margin-left: 20px;">
                    <asp:TextBox ID="txtCaptchaText" runat="server" Width="160px" />
                </div>
                <table align="center" style="margin-top: 40px;">
                    <tbody>
                        <tr>
                            <td>
                                <div id="CaptchaImg" style="margin-left: 20px;">
                                    <asp:Image ID="imgCaptcha" runat="server" ImageUrl="~/Captcha.aspx" />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-sm-3" style="margin-left: 750px">
            <asp:Button class="button_center" runat="server" ID="btnEjecutar" Text="Ejecutar" OnClick="btnEjecutar_Click1" Style="display: inline-block; text-align: center; width: 80px"></asp:Button>
        </div>
    </asp:Panel>


    <div id="openModal" class="modalDialog">
        <asp:ScriptManager runat="server" />
        <div>
            <a href="#close" title="Close" class="close">X</a>
            <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
                <span id="ui-id-2" class="ui-dialog-title">
                    <div class="modal_title">Cuotas Adicionales</div>
                    <hr>
                </span>
                <a href="#" class="ui-dialog-titlebar-close ui-corner-all" role="button" style="display: none;"><span class="ui-icon ui-icon-closethick">close</span></a>
            </div>
            <asp:Label ID="Label3" runat="server" Text="Seleccionar solo un Mes"></asp:Label>
            <section style="padding-top: 10px"></section>

            <td class="td_right_col3">
                <table border="0" align="center" cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <td class="td_left_col2">
                                <b>Enero</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checKEnero" class="flagCuotaAdic" />

                            </td>
                            <td class="td_left_col2 w100"></td>
                            <td class="td_left_col2">
                                <b>Julio</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkJulio" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                        </tr>
                        <tr>
                            <td class="td_left_col2">
                                <b>Febrero</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkFebrero" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                            <td class="td_left_col2">
                                <b>Agosto</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkAgosto" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                        </tr>
                        <tr>
                            <td class="td_left_col2">
                                <b>Marzo</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkMarzo" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                            <td class="td_left_col2">
                                <b>Septiembre</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkSeptiembre" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                        </tr>
                        <tr>
                            <td class="td_left_col2">
                                <b>Abril</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkAbril" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                            <td class="td_left_col2">
                                <b>Octubre</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkOctubre" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                        </tr>
                        <tr>
                            <td class="td_left_col2">
                                <b>Mayo</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkMayo" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                            <td class="td_left_col2">
                                <b>Noviembre</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkNoviembre" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                        </tr>
                        <tr>
                            <td class="td_left_col2">
                                <b>Junio</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkJunio" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                            <td class="td_left_col2">
                                <b>Diciembre</b>
                            </td>
                            <td class="td_left_col2 td_cb">
                                <asp:CheckBox runat="server" ID="checkDiciembre" class="flagCuotaAdic" />
                            </td>
                            <td class="td_left_col2 w100"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="col-sm-3" style="margin-left: 130px">

                    <asp:Button class="button_center" runat="server" Text="Aceptar" OnClick="Unnamed_Click1"></asp:Button>
                    <asp:Button class="button_center" runat="server" Text="Salir"></asp:Button>
                </div>
            </td>
        </div>
    </div>

    <script>
        $("input[type='number']").inputSpinner()
    </script>

    <script lang="javascript" type="text/javascript">
        $().ready(function () {

            $(document).everyTime(3000, function () {

                $.ajax({
                    type: "POST",
                    url: "ValidarSession1.aspx/KeepActiveSession",
                    data: {},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: VerifySessionState,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(textStatus + ": " + XMLHttpRequest.responseText);
                    }
                });

            });


        });

        var cantValidaciones = 0;

        function VerifySessionState(result) {

            if (result.d) {
                $("#EstadoSession").text("activo");
            }
            else
                $("#EstadoSession").text("expiro");

            $("#cantValidaciones").text(cantValidaciones);


            cantValidaciones++;

        }

        function SessionAbandon() {

            $.ajax({
                type: "POST",
                url: "ValidarSession1.aspx/SessionAbandon",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus + ": " + XMLHttpRequest.responseText);
                }
            });

        }

    </script>

    <!-- Alertas -->
<script src="js/sweetalert.js"></script>
    <script>
        function alertddlprestamoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione un Producto',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertMontoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un Monto',
                showConfirmButton: false,
                timer: 2000
            })
        }


        function alertTiempoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un Tiempo',
                showConfirmButton: false,
                timer: 2000
            })
        }



        function alertCaptcha() {
            Swal.fire({
                title: 'Mensaje',
                position: 'center',
                icon: 'info',
                text: 'Ingrese el codigo de verificacion correcto',
                showConfirmButton: false,
                footer: '<span class="rojo">Informacion Importante!</span>',
                timer: 2000
            })
        }
    </script>

</asp:Content>

