<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Listar_Socios_Suspendidos.aspx.cs" Inherits="WF_Listar_Socios_Suspendidos" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">




    <section style="padding: 50px;"></section>
    <h3 style="text-align: center; color: black"><b>LISTA DE SOCIOS SUSPENDIDOS</b></h3>

    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

    <section style="padding: 20px;"></section>
    <asp:Label ID="txtcodSocioGrid" runat="server" Text="" Visible="false"></asp:Label>
    <div style="margin-left: 200px">

        <table width="900" border="0" cellpadding="0" cellspacing="0" class="table">
            <tbody>
                <tr>
                    <td class="td_left celda_arriba">Socios Suspendidos:</td>
                    <td class="td_right_col2 celda_arriba">

                        <asp:TextBox ID="txtcantidad" runat="server" class="form-control" Width="25%" Height="50%" CssClass="auto-style1" Enabled="false"></asp:TextBox>
            </tbody>
        </table>
        <div class="row align-items-start" style="margin-left: 1px">
            <div class="col">
                <section style="padding: 10px;"></section>

                <asp:LinkButton ID="btnGenerarReporte" OnClick="btnGenerarReporte_Click" CssClass="btn btn-primary" Width="10%" runat="server" Text="Enviar">
                    <p5 style="color: white">Generar Reporte</p5>
                </asp:LinkButton>

            </div>
        </div>
        <section style="padding: 10px;"></section>
        <asp:GridView ID="gv_Tabla_Lista_Socios_Suspendidos" runat="server" OnRowCommand="gv_Tabla_Lista_Socios_Suspendidos_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Socios_Suspendidos_PageIndexChanging" EmptyDataText="No hay Socios suspendidos" CssClass="table-responsive-sm table-hover" Width="95%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_Tabla_Lista_Socios_Suspendidos_RowDataBound" AllowSorting="true" OnSorting="gv_Tabla_Lista_Socios_Suspendidos_Sorting">
            <columns>
                <asp:BoundField DataField="PK_IS_Cod" HeaderText="Nro" />
                <asp:BoundField DataField="DS_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}" SortExpression="DS_Fecha_Registro" >
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="IS_Dni" HeaderText="DNI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="VS_Nombre_Completo" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VS_Apellido_Paterno" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VS_Apellido_Materno" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="DS_Fecha_Nacimiento" HeaderText="Fecha Nacimiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                
                <asp:BoundField DataField="VESocio_Estado_Socio" HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <itemtemplate>
                        <asp:LinkButton ID="btnAprobar" CssClass="btn btn-success" runat="server" CommandName="Habilitar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Aprobar" Style="color: white">
                            Habilitar                             
                        </asp:LinkButton>
                    </itemtemplate>

                </asp:TemplateField>
            </columns>
            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>


        <asp:GridView ID="GridView2" runat="server" OnRowCommand="GridView2_RowCommand" Visible="false" OnPageIndexChanging="GridView2_PageIndexChanging" EmptyDataText="No hay Socios suspendidos" CssClass="table table-striped table-hover" Width="60%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="GridView2_RowDataBound" AllowSorting="true" OnSorting="GridView2_Sorting">
            <columns>
                <asp:BoundField DataField="PK_IS_Cod" HeaderText="Nro" />
                <asp:BoundField DataField="DS_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}" SortExpression="DS_Fecha_Registro">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="IS_Dni" HeaderText="DNI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="VS_Nombre_Completo" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VS_Apellido_Paterno" HeaderText="Apellido Materno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VS_Apellido_Materno" HeaderText="Apellido Paterno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="DS_Fecha_Nacimiento" HeaderText="Fecha Nacimiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="VESocio_Estado_Socio" HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>




            </columns>

            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>

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

