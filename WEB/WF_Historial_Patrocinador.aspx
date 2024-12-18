<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Historial_Patrocinador.aspx.cs" Inherits="WF_Historial_Patrocinador" %>

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



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="txtdniPatro" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtCodPatroGrid" runat="server" Text="" Visible="false"></asp:Label>
    <!--main content start-->
        <h3 style="text-align: center; color: black"><b>HISTORIAL DEL PATROCINADOR</b></h3>
    <!-- /row -->
    <!-- FORM VALIDATION -->
  <div class="row mt" style="margin-left:200px">
             <div class="col-lg-10">
            <h4><i class="fa fa-angle-right"></i>DATOS DEL PATROCINADOR</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm" method="get" action="">
                        <section style="padding-top: 25px"></section>

                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Documento de Identidad"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtDni" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>
                            
                           <div class="form-group">
                               <asp:Label ID="Label7" runat="server" Text="Apellido Paterno"></asp:Label>
                               <br />
                               <asp:TextBox ID="txtapellidopaterno" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="70%"></asp:TextBox>
                          </div>

                          <div class="form-group">
                               <asp:Label ID="Label10" runat="server" Text="Nº Vigencia (años)"></asp:Label>
                              <br />
                               <asp:TextBox ID="txtVigencia" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="70%"></asp:TextBox>
                          </div>

                        </div>

                        <div class="col-sm-9 col-md-6">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Nombre Completo"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtNombreCompleto" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>

                              <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Apellido Materno"></asp:Label>
                                  <br />
                                    <asp:TextBox ID="txtapellidomaterno" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="70%"></asp:TextBox>
                              </div>
                              <div class="form-group">
                                   <asp:Label ID="Label9" runat="server" Text="Cantidad Afiliaciones"></asp:Label>
                                  <br />
                                   <asp:TextBox ID="txtafiliaciones" ReadOnly="True" BackColor="White" runat="server" class="form-control" Width="70%"></asp:TextBox>
                              </div>

                            </div>
                        <section style="padding-top:270px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <div class="row mt" style="margin-left:200px">
               <div class="col-lg-10">
            <h4><i class="fa fa-angle-right"></i>HISTORIAL DE AFILIACIONES</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 25px"></section>

                     <asp:GridView ID="gv_Tabla_Lista_Afiliaciones" runat="server" EmptyDataText="El socio no ha patrocinado aun a ninguna persona" CssClass="table-responsive-sm table-hover" Width="70%" AutoGenerateColumns="False" GridLines="None" style="text-align:center; margin-left:auto;margin-right:auto">
        
             <columns>
    
            <asp:BoundField DataField="PK_IA_Cod" HeaderText="N°" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                 <HeaderStyle CssClass="text-center"></HeaderStyle>
                    <ItemStyle CssClass="text-center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="IA_Dni" HeaderText="Dni" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                <HeaderStyle CssClass="text-center"></HeaderStyle>
                    <ItemStyle CssClass="text-center"></ItemStyle>
            </asp:BoundField>

            <asp:BoundField DataField="VA_Nombre_Completo" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                <HeaderStyle CssClass="text-center"></HeaderStyle>

                <ItemStyle CssClass="text-center"></ItemStyle>
            </asp:BoundField>


            <asp:BoundField DataField="VA_Apellido_Paterno" HeaderText="Apellido Paterno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                <HeaderStyle CssClass="text-center"></HeaderStyle>

                <ItemStyle CssClass="text-center"></ItemStyle>
            </asp:BoundField>


             <asp:BoundField DataField="VA_Apellido_Materno" HeaderText="Apellido Materno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                <HeaderStyle CssClass="text-center"></HeaderStyle>

                <ItemStyle CssClass="text-center"></ItemStyle>
            </asp:BoundField>

            <asp:BoundField DataField="VA_Correo" HeaderText="Correo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" Visible="false">
                <HeaderStyle CssClass="text-center"></HeaderStyle>

                <ItemStyle CssClass="text-center"></ItemStyle>
            </asp:BoundField>
                  </columns>
      

             <HeaderStyle BackColor="#008080" ForeColor="white" Font-Bold="true" />
        </asp:GridView>


   <section style="padding-top: 160px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <section style="margin-left:220px">
        <a id="btnregresar" href="WF_Listar_Patrocinadores.aspx" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>Regresar</a>

    </section>


</asp:Content>

