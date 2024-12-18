<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Registrar_Penalidad.aspx.cs" Inherits="WF_Registrar_Penalidad" %>

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
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

         <asp:Label ID="txtpksocio" runat="server" Text="" Visible="false"></asp:Label>
       <asp:Label ID="txtpkcuota" runat="server" Text="" Visible="false"></asp:Label>
      <asp:Label ID="txtcodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <!--main content start-->
        <h3 style="text-align: center; color: black"><b>REGISTRAR PENALIDAD</b></h3>
    <!-- /row -->
    <!-- FORM VALIDATION -->
    <div class="row mt" style="margin-left:100px">
                 <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>DATOS DEL PRESTAMO</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form">
                        <section style="padding-top: 25px"></section>



                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="N° PRESTAMO"></asp:Label>
                                <asp:TextBox ID="txtnumprestamo" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>



                        </div>

                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="N° CUOTA"></asp:Label>
                                    <asp:TextBox ID="txtnumcuota" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>

                            </div>
                        </div>


                        <section style="padding-top: 75px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <div class="row mt" style="margin-left:100px">
             <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>DATOS SOCIO</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form">
                        <section style="padding-top: 25px"></section>



                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="DNI"></asp:Label>
                                <asp:TextBox ID="txtdni" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="APELLIDOS"></asp:Label>
                                <asp:TextBox ID="txtapellido" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>


                        </div>

                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="NOMBRES COMPLETOS"></asp:Label>
                                    <asp:TextBox ID="txtnombres" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="PATROCINADOR"></asp:Label>
                                    <asp:TextBox ID="txtpatrocinador" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>

                            </div>
                        </div>

                        <section style="padding-top: 160px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

    <div class="row mt" style="margin-left:100px">
               <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>DATOS CUOTAS</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form" id="commentForm2" method="get" action="">
                        <section style="padding-top: 25px"></section>



                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="FECHA FIN CUOTA"></asp:Label>
                                <asp:TextBox ID="txtfechafin" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="DÍAS RETRASO"></asp:Label>
                                <asp:TextBox ID="txtdiaretraso" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>


                        </div>

                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="ESTADO CUOTA"></asp:Label>
                                    <asp:TextBox ID="txtestadocuota" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="IMPORTE"></asp:Label>
                                    <asp:TextBox ID="txtmonto" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                   
                                </div>

                            </div>
                        </div>

                        <section style="padding-top: 160px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>

           <div class="row mt" style="margin-left:100px">
        <div class="col-lg-8">
            <h4><i class="fa fa-angle-right"></i>DATOS PENALIDAD</h4>
            <div class="form-panel">
                <div class=" form">
                    <form1 class="cmxform form-horizontal style-form">
                        <section style="padding-top: 25px"></section>



                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label11" runat="server" Text="Monto Penalidad"></asp:Label>
                                <asp:TextBox ID="txtmontopenalidad" runat="server" class="form-control" Width="70%" Visible="false"></asp:TextBox>
                                  <asp:TextBox ID="txtmontovisible" runat="server" class="form-control" Width="70%"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label12" runat="server" Text="Observación"></asp:Label>
                        
                                <asp:TextBox ID="txtobservacion" runat="server" TextMode="MultiLine" class="form-control" Width="200%"></asp:TextBox>
                            </div>


                        </div>

                        <div class="col-sm-9 col-md-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:Label ID="Label13" runat="server" Text="Tipo Penalidad"></asp:Label>
                                    <asp:TextBox ID="txttipopenalidad" runat="server" class="form-control" Width="70%"></asp:TextBox>
                                </div>
                               

                            </div>
                        </div>

                        <section style="padding-top: 180px"></section>
                    </form1>
                </div>
            </div>
            <!-- /form-panel -->
        </div>
        <!-- /col-lg-12 -->
    </div>




   
        <div class="row">
          <div class="col-lg-11"  style="margin-top:-900px; margin-left:150px; height:100%;">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
         
              <!-- end custombox -->
            </div>
            <!-- end col-4 -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      
              <!-- end custombox -->
            </div>
            <!-- end col-4 -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
              <div class="custom-box">
                <div class="servicetitle">
                  <h4>Monto Por Retraso</h4>
                  <hr>
                </div>
                <div class="icn-main-container">
                  <span class="icn-container">S/.</span>
                </div>
                <p>El monto por penalidad se aplicará dependiendo de los días de retraso que tenga en el pago de su cuota.</p>
                <ul class="pricing">
                  <li>1 a 5 Días de retraso = S/5. </li>
                  <li>5 a 10 Días de retraso = S/20.</li>
                  <li>10 a 20 Días de retraso = S/50.</li>
                  <li>20 a 30 Días de retraso = S/100.</li>
                  <li>30 Días a más días de retraso = S/300.</li>
                 
                </ul>
               <%-- <a  class="btn btn-theme" href="#">Aplicar Penalidad</a>--%>
                
                   <asp:Button class="btn btn-theme" runat="server" ID="btnPenalidad" Text="Aplicar Penalidad" OnClick="btnPenalidad_Click"></asp:Button>
                  <br /><br />
                  <asp:Button class="btn btn-info" runat="server" ID="btnatras" Text="Regresar" Width="30%" OnClick="btnatras_Click"></asp:Button>
              </div>
              <!-- end custombox -->
            </div>
            <!-- end col-4 -->
          </div>
          <!--  /col-lg-12 -->
        </div>
   





     <!-- Alertas -->
        <script src="js/sweetalert.js"></script>
        <script>
            function RegistrarPenalidad() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Registrado',
                    text: 'Se Registro la penalidad correctamente',
                    showConfirmButton: false,
                    timer: 3000
                })
            }
        </script>







</asp:Content>

