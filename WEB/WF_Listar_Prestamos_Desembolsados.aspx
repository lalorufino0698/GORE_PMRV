<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Listar_Prestamos_Desembolsados.aspx.cs" Inherits="WF_Listar_Prestamos_Desembolsados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section style="padding: 10px;"></section>
    <h3 style="text-align: center">LISTADO DE PRESTAMOS</h3>
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <section style="padding: 20px;"></section>
    <div style="margin-left: 200px">
        <table width="900" border="0" cellpadding="0" cellspacing="0" class="table">
            <tbody>
                <tr>
                    <td class="td_left celda_arriba"></td>
                    <td class="td_right_col2 celda_arriba">
            </tbody>
        </table>
        <section style="padding: 10px;"></section>
        <asp:Label ID="txtcodPrestamoGrid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="txtImporte" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="txtCuota" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="txtFechaRegistro" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="txtNomSocio" runat="server" Text="" Visible="false"></asp:Label>
        <asp:GridView ID="gv_Tabla_Lista_Prestamos_Desembolsados" runat="server" OnRowCommand="gv_Tabla_Lista_Prestamos_Desembolsados_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Prestamos_Desembolsados_PageIndexChanging" EmptyDataText="No hay Prestamos Desembolsados" CssClass="table table-striped table-hover" Width="90%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_Tabla_Lista_Prestamos_Desembolsados_RowDataBound">
            <Columns>
                <asp:BoundField DataField="PK_IPre_Cod" HeaderText="N°" />
                <asp:BoundField DataField="DPre_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="VTP_Nombre" HeaderText="Tipo Prestamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="FPre_Importe" HeaderText="Importe" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="IPre_Cuotas" HeaderText="Nº Cuotas" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="FPre_Tasa_Mensual" HeaderText="Tasa Mensual" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="FPre_Tcea" HeaderText="TCEA" ItemStyle-CssClass="text-center" DataFormatString="{0}%" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="VPre_PrestamoVigente" HeaderText="Prestamo Vigente" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="VPre_DeudaVigente" HeaderText="Deuda Vigente" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="NombreCompleto" HeaderText="Codigo Socio" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="VEPre_Estado_Prestamo" HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <HeaderStyle CssClass="text-center"></HeaderStyle>
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>

                <asp:TemplateField HeaderText="Ver" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <ItemTemplate>

                        <asp:LinkButton ID="btnGestionarAmortizacion" CssClass="btn btn-warning" runat="server" CommandName="GestionarAmortizacion" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Ver" Style="color: white"> <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
                                                    
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <HeaderStyle BackColor="#6fdefc" ForeColor="Black" Font-Bold="true" />
        </asp:GridView>

    </div>
    <div id="noDataMessage" style="display: none; text-align: center">
        <h1>No se encontraron datos.</h1>
    </div>

    <!-- Alertas -->
    <script src="js/sweetalert.js"></script>
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
    <%--  </main>--%>


    <script src="plugins/jquery-datatable/jquery.dataTables.js"></script>
    <!-- Jquery DataTable Plugin Js -->
    <script src="plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

    <!-- Custom Js -->
    <script src="js/admin.js"></script>
    <script src="js/pages/tables/jquery-datatable.js"></script>

    <!-- Demo Js -->
    <script src="js/demo.js"></script>
    <script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

</asp:Content>

