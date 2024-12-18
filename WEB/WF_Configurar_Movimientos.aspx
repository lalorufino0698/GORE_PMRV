<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Configurar_Movimientos.aspx.cs" Inherits="WF_Configurar_Movimientos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section style="padding: 50px;"></section>
    <h1 style="text-align: center; color: #73879C">CONFIGURACION MOVIMIENTOS </h1>

    <div class="form-group" style="margin-left:138rem">
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" class="btn btn-warning" Width="25%" OnClick="btnAgregar_Click" />
    
    </div>
   

    <div style="margin-left: 500px">
        <asp:GridView ID="gv_Tabla_ConfigurarMovimientos" onsubmit = "return false" runat="server" OnRowCommand="gv_Tabla_ConfigurarMovimientos_RowCommand" OnPageIndexChanging="gv_Tabla_ConfigurarMovimientos_PageIndexChanging" EmptyDataText="No hay listado de Movimientos" CssClass="table-responsive-sm table-hover" Width="70%" AutoGenerateColumns="False" GridLines="None" AllowPaging="True">
            <columns>
                <asp:BoundField DataField="PK_ICon_Cod" HeaderText="N°" />
                <asp:BoundField DataField="VCon_Tipo_Movimiento" HeaderText="TIPO DE MOVIMIENTO" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="ICon_Monto" HeaderText="MONTO" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
               
                <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <itemtemplate>
                        <asp:Button ID="btnEditar" CssClass="btn btn-success" runat="server" CommandName="EDITAR" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Style="color: white" Text="Actualizar" aria-hidden="true"></asp:Button>

                    </itemtemplate>
                </asp:TemplateField>
            </columns>
            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>
    </div>

    <div class="container register">
        <div class="col-md-12 register-right">
            <div class="tab-content" id="myTabContent">
                <div class="modal fade bd-example-modal-md" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">INFORMACIÓN DE TIPO MOVIMIENTO</h4>
                            </div>

                            <div class="modal-body">
                                <div class="row justify-content-md-center">
                                    <div class="col">
                                        <div class="col-md-auto" style="padding: 20px">
                                            <div class="form-group">
                                                <asp:Label ID="lblVA_Tipo_Movimiento" runat="server" Text="Tipo Movimiento:"></asp:Label>
                                                <asp:TextBox ID="txtVA_Tipo_Movimiento" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                                <asp:TextBox ID="txtPK_ICon_Cod" runat="server" class="form-control" Width="75%" visible="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblIA_Monto" runat="server" Text="MONTO:"></asp:Label>
                                                <asp:TextBox ID="txtIA_Monto" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                            </div>
                                            
                                            <div class="modal-footer">
                                                <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-theme" Width="30%" OnClick="btnEditar_Click" />
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
    </div>

    <div class="container register">
        <div class="col-md-12 register-right">
            <div class="tab-content" id="myTabContent">
                <div class="modal fade bd-example-modal-md" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel2">INFORMACIÓN DE TIPO MOVIMIENTO</h4>
                            </div>

                            <div class="modal-body">
                                <div class="row justify-content-md-center">
                                    <div class="col">
                                        <div class="col-md-auto" style="padding: 20px">
                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" Text="Tipo Movimiento:"></asp:Label>
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" Width="75%" visible="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label2" runat="server" Text="MONTO:"></asp:Label>
                                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                            </div>
                                            
                                            <div class="modal-footer">
                                                <asp:Button ID="Button1" runat="server" Text="Registrar" class="btn btn-theme" Width="30%" OnClick="btnRegistrar_Click" />
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
            function ActualizarTipoPrestamo() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Enviado',
                    text: 'Se Editaron los datos exitosamente.',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
    </section>

</asp:Content>

