
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Simulacion_Pagos.aspx.cs" Inherits="WF_Simulacion_Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="dist/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        .tr_titles {
            border-right: 35px solid #f0f2ef;
            background: #f0f2ef;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section style="padding: 20px;"></section>
    <div style="margin-left: 330px" id="nombreProducto">Simulación de Pagos</div>
    <div class="sub_head_right">
        <img src="img/cabecera.png" alt="Alternate Text" height="60" style="margin-left: 6px" />
        <div style="margin-left: 336px; width: 980px" class="body_head">
            <b>
                <asp:Label ID="lbltipoprestamo" runat="server"></asp:Label></b>
        </div>
		<section style="padding: 40px;"></section>
        <table class="table" width="60%" border="0" cellpadding="0" cellspacing="0">
            <asp:Label ID="lblcuotamos" runat="server" Width="100%" Visible="false"></asp:Label>
            <asp:Label ID="lblimportemos" runat="server" Width="100%" Visible="false"></asp:Label>
            <asp:Label ID="lblmesesmos" runat="server" Width="100%" Visible="false"></asp:Label>
            <asp:Label ID="lbltasamos" runat="server" Width="100%" Visible="false"></asp:Label>
            <asp:Label ID="txtcodsocio" runat="server" Width="100%" Visible="false"></asp:Label>
            <asp:Label ID="txtnomsocio" runat="server" Width="100%" Visible="false"></asp:Label>
            <asp:Label ID="lblfechapago" runat="server" Width="25%" Visible="false"></asp:Label>
            <asp:Label ID="lblted" runat="server" Width="25%" Visible="false"></asp:Label>
            <asp:Label ID="lblCompensatorioMora" runat="server" Width="25%" Visible="false"></asp:Label>
            <asp:Label ID="lbltedRound" runat="server" Width="25%" Visible="false"></asp:Label>



            <tbody>
                <tr>
                    <td class="celdaCabeceraDes" width="25%">Importe a Solicitar :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblimporte" runat="server" Width="100%"></asp:Label></td>
                    <td class="celdaCabeceraDes" width="25%">Fecha de Pago:</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lbldiapago" runat="server" Width="25%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaCabeceraDes" width="25%">Duración Total :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblmeses" runat="server" Width="100%"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes" width="25%">Período de Gracia :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblperiodo" runat="server" Width="25%"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="celdaCabeceraDes" width="25%">Fecha de Solicitud :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblfecha" runat="server" Width="25%"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes" width="25%">Sub-Producto :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblsubproducto" runat="server" Width="100%"></asp:Label>
                </tr>
                <tr>
                    <td class="celdaCabeceraDes" width="25%">Tasa Efectiva Mensual:</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lbltasa" runat="server" Width="25%"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes" width="25%">Cuota :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblcuota" runat="server" Width="100%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaCabeceraDes" width="25%">Tasa Efectiva Anual Fija (TEA) :</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lbltcea" runat="server" Width="25%"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes" width="25%">Tipo de envio de constancias de pago:</td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblconstancias" runat="server" Width="100%"></asp:Label>
                        <asp:Label ID="lblconstancias1" runat="server" Width="100%"></asp:Label>
                        <asp:Label ID="lblconstancias2" runat="server" Width="100%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="celdaCabeceraDes">
                        <asp:Label ID="lblenvio" runat="server" Width="100%" Text="Comis. envío físico de estado de cuenta:"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblcomision" runat="server" Width="100%"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes">
                        <asp:Label ID="lvlvalorbien" runat="server" Width="100%" Text="Valor del Bien:"></asp:Label>
                    </td>
                    <td class="celdaCabeceraDes1">
                        <asp:Label ID="lblvalor" runat="server" Width="25%"></asp:Label>
                    </td>
                </tr>
                 <tr>
                     <td class="celdaCabeceraDes" width="25%">Cuotas Adicionales:</td>
                     <td class="celdaCabeceraDes1">
                         <asp:Label ID="lblcuotas" runat="server" Width="25%"></asp:Label>
                     </td>
                     <td class="celdaCabeceraDes" width="25%">Meses a aplicar cuotas adicionales:</td>
                     <td class="celdaCabeceraDes1">
                         <asp:Label ID="lblbcuotasmeses" runat="server" Width="100%"></asp:Label>
                     </td>
                 </tr>
                   
            </tbody>
        </table>

        </div>
        <section style="padding: 10px;"></section>

    <asp:Table ID="myTable" runat="server" CssClass="table" Style="margin-left: 360px;" Width="65%" border="0" CellPadding="0">
        <asp:TableRow>
            <asp:TableCell CssClass="tr_titles">N° CUOTA</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">FECHA DE PAGO</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">DÍAS CORRIDOS</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">AMORTIZACIÓN</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">INTERÉS</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">SEGURO DES.</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">CUOTA</asp:TableCell>
            <asp:TableCell CssClass="tr_titles">SALDO</asp:TableCell>

        </asp:TableRow>
    </asp:Table>
    <section style="padding: 25px;"></section>
    <div class="msg msg_adv" style="margin-left: 388px">
        <span class="icm icm_info"></span>
        <p class="tc1_12">- Los datos emitidos por este simulador son <strong>referenciales. </strong>
            <br>
            - El otorgamiento del préstamo está sujeto a evaluación crediticia.
            <br>
            - La fecha de desembolso, para efectos de esta simulación, es la fecha de solicitud que ha ingresado en este simulador.
            <br>
            - La simulación no incluye el ITF.<br>
            - La tasa de interés es fija.<br>
            - Usted podrá contratar directamente su póliza de seguro, con las mismas características y beneficios a la ofrecida, y endosarla a favor del Banco.El endoso de la póliza está sujeto a comisión publicada en nuestro tarifario en: <b>www.sancosme.com.pe</b></p>
    </div>

  <section style="padding: 5px;"></section>

    <div class="no-print">
        <div class="col-sm-3" style="margin-left: 690px">
            <tbody>
                <tr align="center">
                    <asp:Button class="button" Style="margin: 2px; display: inline-block;" runat="server" ID="btnSolicitar" Text="Solicitar" OnClick="btnSolicitar_Click"></asp:Button>
                    <asp:Button class="button" Style="margin: 2px; display: inline-block;" runat="server" ID="btnPDF" Text="Exportar PDF" OnClick="btnPDF_Click"></asp:Button>
                    <asp:Button class="button" Style="margin: 2px; display: inline-block;" runat="server" ID="btnRegresar" Text="Regresar" OnClick="btnRegresar_Click"></asp:Button>
                </tr>
            </tbody>

        </div>
    </div>
   
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

   

</asp:Content>

