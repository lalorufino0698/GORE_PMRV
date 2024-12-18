<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Configurar_Prestamo.aspx.cs" Inherits="WF_Configurar_Tipo_Prestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section style="padding: 50px;"></section>
    <h1 style="text-align: center; color: #73879C">CONFIGURACION TASAS</h1>

    </br>
    <div class="row">
    <div class="col-sm-4" style="margin-left:130rem; margin-bottom:-5rem">
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" class="btn btn-warning" Width="18%" OnClick="btnAgregar_Click" />
    </div>
        <div class="col-sm-4" style="margin-left:50rem; margin-bottom:-15rem"> 
       <asp:Label ID="Label21" runat="server" Text="Estados:"></asp:Label>
    
   </div>
    <div class="col-sm-4" style="margin-left:58rem"> 
       <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="50%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
       <asp:ListItem Text="Seleccionar Opcion" Value="0" Selected="True"></asp:ListItem>
       </asp:DropDownList>

   </div>
        </div>

    <section style="padding:10px"></section>

      <asp:Panel runat="server" ID="Panel1" >
    <div style="margin-left: 500px">
        <asp:GridView ID="gv_Tabla_Lista_TipoPrestamos" onsubmit = "return false" runat="server" OnRowCommand="gv_Tabla_Lista_TipoPrestamos_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_TipoPrestamos_PageIndexChanging" EmptyDataText="No hay listado de penalidad" CssClass="table-responsive-sm table-hover" Width="70%" AutoGenerateColumns="False" GridLines="None" AllowPaging="True">
            <columns>
                <asp:BoundField DataField="PK_ITP_Cod" HeaderText="N°" />
                <asp:BoundField DataField="VTP_Nombre" HeaderText="Nombre del Prestamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="Tasa" HeaderText="Tasa Mensual" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="TCEA" HeaderText="TCEA" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="Activo" HeaderText="Activos" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" Visible="false">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <itemtemplate>
                        <asp:Button ID="btnActualizar" CssClass="btn btn-info" runat="server" CommandName="Actualizar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Style="color: white" Text="Actualizar" aria-hidden="true"></asp:Button>
                          <asp:Button ID="btnDeshabilitar" CssClass="btn btn-danger" runat="server" CommandName="Deshabilitar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Style="color: white" Text="Deshabilitar" aria-hidden="true"></asp:Button>
                    </itemtemplate>
                </asp:TemplateField>
            </columns>
            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>
    </div>
</asp:Panel>
    <asp:Panel runat="server" ID="Habilitar" Visible="False">
     <div style="margin-left: 500px">
        <asp:GridView ID="GridView1" onsubmit = "return false" runat="server" OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging" EmptyDataText="No hay listado de penalidad" CssClass="table-responsive-sm table-hover" Width="70%" AutoGenerateColumns="False" GridLines="None" AllowPaging="True">
            <columns>
                <asp:BoundField DataField="PK_ITP_Cod" HeaderText="N°" />
                <asp:BoundField DataField="VTP_Nombre" HeaderText="Nombre del Prestamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="Tasa" HeaderText="Tasa Mensual" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="TCEA" HeaderText="TCEA" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="Activo" HeaderText="Activos" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" Visible="false">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center"></itemstyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <itemtemplate>
                          <asp:Button ID="btnHabilitar" CssClass="btn btn-success" runat="server" CommandName="Habilitar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Style="color: white" Text="Habilitar" aria-hidden="true"></asp:Button>
                    </itemtemplate>
                </asp:TemplateField>
            </columns>
            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>
    </div>
</asp:Panel>

    <div class="container register">
        <div class="col-md-12 register-right">
            <div class="tab-content" id="myTabContent">
                <div class="modal fade bd-example-modal-md" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                    <div class="modal-dialog modal-md" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">INFORMACIÓN DE TIPO PRÉSTAMO</h4>
                            </div>

                            <div class="modal-body">
                                <div class="row justify-content-md-center">
                                    <div class="col">
                                        <div class="col-md-auto" style="padding: 20px">
                                            <div class="form-group">
                                                <asp:Label ID="lblVTP_Nombre" runat="server" Text="Tipo Préstamo:"></asp:Label>
                                                <asp:TextBox ID="txtVTP_Nombre" runat="server" class="form-control" Width="75%" ReadOnly="true">
                                                </asp:TextBox>
                                                <asp:TextBox ID="txtPK_ITP_Cod" runat="server" class="form-control" Width="75%" visible="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblTasa" runat="server" Text="Tasa Mensual:"></asp:Label>
                                                <asp:TextBox ID="txtTasa" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblTCEA" runat="server" Text="TCEA:"></asp:Label>
                                                <asp:TextBox ID="txtTCEA" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                            </div>
                                      
                                            <div class="modal-footer">
                                                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" class="btn btn-theme" Width="30%" OnClick="btnActualizar_Click" />
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
                                <h4 class="modal-title" id="myModalLabel2">INFORMACIÓN DE TIPO PRÉSTAMO</h4>
                            </div>

                            <div class="modal-body">
                                <div class="row justify-content-md-center">
                                    <div class="col">
                                        <div class="col-md-auto" style="padding: 20px">
                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" Text="Tipo Préstamo:"></asp:Label>
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" Width="75%">
                                                </asp:TextBox>
                                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" Width="75%" visible="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label2" runat="server" Text="Tasa Mensual:"></asp:Label>
                                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label3" runat="server" Text="TCEA:"></asp:Label>
                                                <asp:TextBox ID="TextBox4" runat="server" class="form-control" Width="75%"></asp:TextBox>
                                            </div>
                                      
                                            <div class="modal-footer">
                                                <asp:Button ID="btnRegistrar" runat="server" Text="Agregar" class="btn btn-success" Width="30%" OnClick="btnRegistrar_Click" />
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
                    text: 'Se actualizaron los datos exitosamente.',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function RegistrarTipoPrestamo() {
                                        Swal.fire({
                                            position: 'center',
                                            icon: 'success',
                                            title: 'Registrado',
                                            text: 'Se Registro el deposito de ahorro correctamente',
                                            showConfirmButton: false,
                                            timer: 3000
                                        })
                                    }
        </script>

    </section>

</asp:Content>

