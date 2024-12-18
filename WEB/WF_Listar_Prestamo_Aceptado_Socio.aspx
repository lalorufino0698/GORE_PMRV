<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Listar_Prestamo_Aceptado_Socio.aspx.cs" Inherits="WF_Listar_Prestamo_Aceptado_Socio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/sitegridview.css" rel="stylesheet" />
    <link rel="stylesheet" href="dist/style.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <style>
        fieldset {
            border: 1px solid #999;
            border-radius: 8px;
            box-shadow: 0 0 10px #999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section style="padding: 20px;"></section>
    <asp:Label ID="txtCodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtCodSocio" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtNomSocioprestamoAceptada" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtImportePrestamoAceptado" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtNumPrestamo" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txttcea" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txttasamen" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtNumCuotas" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtFechaRegistro" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtfechafin" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtMontoCuotas" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtRangoFecha" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtTipoPrestamo" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtCompensatorio" runat="server" Text="" Visible="false"></asp:Label>



    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 95%">
        <h1 style="text-align: center; color: #73879C; margin: 30px"><strong>Lista de Prestamo Aceptados</strong> </h1>
        <div class="sub_head_right" style="margin-left: 20%">
            <img src="img/cabecera.png" alt="Alternate Text" style="height: 60px" />
        </div>
        <fieldset>
            <legend><b>Lista de Prestamo Aceptados</b></legend>
            <section style="padding: 10px;"></section>
            <asp:GridView ID="gv_Tabla_Prestamo_Aceptado_Socio" runat="server" EmptyDataText="Usted no tiene prestamos aceptados" OnRowCommand="gv_Tabla_Prestamo_Aceptado_Socio_RowCommand" OnPageIndexChanging="gv_Tabla_Prestamo_Aceptado_Socio_PageIndexChanging" OnRowDataBound="gv_Tabla_Prestamo_Aceptado_Socio_RowDataBound" CssClass="table table-striped" Width="90%" AutoGenerateColumns="False" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="PK_IPre_Cod" HeaderText="Nº Préstamo" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-right"></HeaderStyle>

                        <ItemStyle CssClass="text-right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VTP_Nombre" HeaderText="Tipo Préstamo" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-right"></HeaderStyle>

                        <ItemStyle CssClass="text-right"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaRegistro" HeaderText="Fecha Registro" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">

                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>

                    </asp:BoundField>

                    <asp:BoundField DataField="NumeroCuotas" HeaderText="Numero Cuotas" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>


                    <asp:BoundField DataField="LugarResidencia" HeaderText="Residencia" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>


                    <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="TasaMensual" HeaderText="Tasa Mensual" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="TCEA" HeaderText="TCEA" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EstadoDePrestamo" HeaderText="Estado del Prestamo" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Obtener Ticket" ItemStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnGenerar" CssClass="btn btn-success" runat="server" OnClientClick="return disableButton(this);" CommandName="GenerarTicket" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Generar" Style="color: forestgreen; margin-left: 30%">
                                <span class="glyphicon glyphicon-file" aria-hidden="true"></span>   
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Generar Cronograma" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnGenerarCronograma" CssClass="btn btn-success" runat="server" CommandName="GenerarCronograma" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="GenerarCronograma" Style="color: forestgreen; margin-left: 30%">
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <HeaderStyle BackColor="#6fdefc" ForeColor="Black" Font-Bold="true" />
            </asp:GridView>
        </fieldset>
    </fieldset>

    <script type="text/javascript">
        function disableButton(btn) {
            btn.disabled = true;
            btn.style.display = 'none';
            var generatedMessage = document.createElement('span');
            generatedMessage.innerHTML = 'GENERADO';
            generatedMessage.style.color = 'blue';
            btn.parentNode.appendChild(generatedMessage);
            return true;
        }

    </script>
   

</asp:Content>

