<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Gestionar_Amortizaciones.aspx.cs" Inherits="WF_Gestionar_Amortizaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <section style="padding: 20px;"></section>

    <section>
        <div class="container register">


                <div class="col-md-12 register-right">

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <br />
                            <br />

                            <%--<h3 class="register-heading" style="margin-left:-10%">Generar Liquidacion</h3>--%>
                            <p>
                                <img src="img/SanCosme.png" width="110px" style="margin-left: 550px" /><font size="5"><b> COOPERATIVA COOPAC SAN COSME </b></font>
                            </p>

                            <h1 style="margin-left: 760px; margin-top: 10px"><b>AMORTIZACIÓN </b></h1>
                            <section style="padding: 25px;"></section>
                            <fieldset class="border" style="width: 60%;margin-left:480px">
                                <legend class="hdrText">Información Socio</legend>

                                <div class="col-sm-3 col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="txtafiliacion" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:Label ID="txtPenalidadddl" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text="Codigo Prestamo"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtCodPrestamo" runat="server" class="form-control" Width="65%" Height="35px"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-sm-9 col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server" Text="Socio"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtSocioNombre" runat="server" class="form-control" Width="65%" Height="35px"></asp:TextBox>
                                    </div>
                                </div>
                               

                            </fieldset>


                               <section style="padding: 15px;"></section>

                                <fieldset class="border" style="width: 60%;margin-left:480px">
                                <legend class="hdrText">Informacion Prestamo</legend>

                                <div class="col-sm-3 col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Text="Importe"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtImporte" runat="server" class="form-control" Width="65%" Height="35px"></asp:TextBox>
                                        
                                    </div>

                                     <div class="form-group">
                                        <asp:Label ID="Label10" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="Label11" runat="server" Text="Cuotas"></asp:Label>
                                         <br />
                                        <asp:TextBox ID="txtCuuotas" runat="server" class="form-control" Width="65%" Height="35px"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-sm-9 col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label12" runat="server" Text="Dia Pago"></asp:Label>
                                        <br />
                                         <asp:TextBox ID="txtfechaRegistro" runat="server" class="form-control" Width="65%" Visible="false"></asp:TextBox>
                                         <asp:TextBox ID="txtFechaPago" runat="server" class="form-control" Width="65%" Height="35px"></asp:TextBox>

                                    </div>
                                    
                                  
                                   
                                       
                                       
                                </div>
                                

                            </fieldset>



                                    <section style="padding: 15px;"></section>
                               <fieldset class="border" style="width: 60%;margin-left:480px">
                                <legend class="hdrText">Gestión de Amortizacion</legend>

                                <div class="col-sm-3 col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text="Mes"></asp:Label>
                                        <br />
                                              <asp:TextBox ID="txtmeses" runat="server" class="form-control" Width="65%" type="number" value="" min="1" max="192" step="1"></asp:TextBox>
                                        </div>

                                     <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="Label5" runat="server" Text="Monto Cuota"></asp:Label>
                                        <asp:TextBox ID="txtMontoCuota" runat="server" class="form-control" Width="65%"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-sm-9 col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Fecha"></asp:Label>
                                        <asp:TextBox ID="txtFechaCuota" runat="server" class="form-control" TextMode="Date" Width="65%"></asp:TextBox>
                                    </div>
                                    
                                  
                                     <div class="form-group">
                                        <asp:Label ID="lblpenalidad" runat="server" Text="Penalidad"></asp:Label>
                                         <br />

                                         <asp:DropDownList ID="ddpenalidad" runat="server" CssClass="dropdown" Width="65%" Height="35px" AutoPostBack="true" OnSelectedIndexChanged="ddpenalidad_SelectedIndexChanged">
                                             <asp:ListItem Value="">Seleccione tipo de Penalidad</asp:ListItem>
                                   
                                         </asp:DropDownList>
                                    
                                    </div>

                                        
                                     <div class="form-group">
                                        <asp:Label ID="Label13" runat="server" Text="Monto Penalidad"></asp:Label>
                                         <br />

                                   <asp:TextBox ID="txtMontoPenalidad" runat="server" class="form-control" Width="65%"></asp:TextBox>

                                    
                                    </div>
                                       
                                       
                                </div>
                                  <div class="form-group">
                              
                                   <asp:Button runat="server" ID="btnGuardarAmortizacion" class="btn btn-primary" OnClick="btnGuardarAmortizacion_Click" style="display: inline-block;text-align:center; width:130px;margin-left:370px"  Text="Guardar"/>
  
                                </div>

                            </fieldset>
                            </div>
                        </div>
                    </div>
            </div>
        <script>
    $("input[type='number']").inputSpinner()
        </script>


                   <!-- Alertas -->
    <script src="js/sweetalert.js"></script>
        <script>
            function RegistrarAmortizacion() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Enviado',
                    text: 'Se registro  exitosamente',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

        </script>

        </section>
</asp:Content>

