<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Detalle_Prestamo.aspx.cs" Inherits="WF_Detalle_Prestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .modal-header {
	background: #215a65;
}

.modal-title {
	color: black;
}

    </style>
   <!-- Latest compiled and minified CSS -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section style="margin-left: 100px">


      
                        <h3 style="text-align: center" class="register-heading"><b>DETALLE DEL PRESTAMO</b></h3>
                        <section style="padding: 10px;"></section>
                        <div class="row register-form" style="margin-left: 190px">
                            <asp:Label ID="txtCodSoliGrid" runat="server" Text="" Visible="false"></asp:Label>

                         <fieldset class="border" style="width: 80%; margin-left:100px">
                         <legend class="hdrText">Datos del Prestamo</legend>

                              
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Tipo de Prestamo"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txttipoprestamo" runat="server" class="form-control" Width="82%"></asp:TextBox>
                               </div>
                              
                            <div class="col-sm-3 col-md-5">
                                <div class="form-group">
                                    <asp:Label ID="Label35" runat="server" Text="Fecha Registro"></asp:Label>
                                    <asp:TextBox ID="txtfecharegistro"  runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                                    

                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="Cuotas"></asp:Label>
                                    <asp:TextBox ID="txtcuotas" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="Tasa Efectiva Mensual"></asp:Label>
                                    <asp:TextBox ID="txttasamensual" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                                </div>
                             
                            <div class="col-sm-3 col-md-5">
                                <div class="form-group">

                                <div class="form-group" >
                                    <asp:Label ID="Label36" runat="server" Text="Estado"></asp:Label>
                                    <asp:TextBox ID="txtestado" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                                   
                                    <div class="form-group">
                                        <asp:Label ID="Label14" runat="server" Text="Importe"></asp:Label>
                                        <asp:TextBox ID="txtimporte" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label15" runat="server" Text="TCEA de Operacion"></asp:Label>
                                        <asp:TextBox ID="txttcea" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    
                                </div>
                            </div>
 
              </fieldset>
                                 <section style="padding: 20px"></section>
                            <fieldset class="border" style="width: 80%; margin-left:100px;margin-top:25px">
                            
                         <legend class="hdrText">Datos Personales</legend>

                             
                                <div class="col-sm-3 col-md-5">

                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Nombres Completos"></asp:Label>
                                    <asp:TextBox ID="txtnombre" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Sexo"></asp:Label>
                                    <asp:TextBox ID="txtsexo" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Departamento de residencia"></asp:Label>
                                    <asp:TextBox ID="txtdepartamento" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Miembros dependientes"></asp:Label>
                                    <asp:TextBox ID="txtmiembros" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Profesión"></asp:Label>
                                    <asp:TextBox ID="txtprofesion" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="Situación Laboral"></asp:Label>
                                    <asp:TextBox ID="txtsituacion" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                           </div>
                                
                             
                            <div class="col-sm-3 col-md-5">
                                <div class="form-group">
                                    
                                    
                                    <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="Apellidos"></asp:Label>
                                        <asp:TextBox ID="txtapellidos" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Estado Civil"></asp:Label>
                                        <asp:TextBox ID="txtestadocivil" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>

                                     <div class="form-group">
                                        <asp:Label ID="Label12" runat="server" Text="Distrito de residendia"></asp:Label>
                                        <asp:TextBox ID="txtdistrito" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label13" runat="server" Text="Tipo de vivienda"></asp:Label>
                                        <asp:TextBox ID="txtvivienda" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>

                                     <div class="form-group">
                                        <asp:Label ID="Label16" runat="server" Text="Rubro"></asp:Label>
                                        <asp:TextBox ID="txtrubro" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label17" runat="server" Text="Antigüedad laboral"></asp:Label>
                                        <asp:TextBox ID="txtantiguedad" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    
                                </div>
                            </div>
 
              </fieldset>

                         <section style="padding: 20px;margin-top:10px"></section>

                    <fieldset class="border" style="width: 80%; margin-left:100px;margin-top:25px">
                         <legend class="hdrText">Datos Finacieros</legend>

                             
                                <div class="col-sm-3 col-md-5">
                                <div class="form-group">
                                    <asp:Label ID="Label18" runat="server" Text="Trabajo"></asp:Label>
                                    <asp:TextBox ID="txttrabajo" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label19" runat="server" Text="Ingresos fijos (mensuales)"></asp:Label>
                                    <asp:TextBox ID="txtingresosfijos" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label20" runat="server" Text="Egresos fijos (mensuales)"></asp:Label>
                                    <asp:TextBox ID="txtegresosfijos" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>
                           </div>
                                
                             
                            <div class="col-sm-3 col-md-5">
                                <div class="form-group">
                                    
                                    
                                    <div class="form-group">
                                        <asp:Label ID="Label24" runat="server" Text="Frecuencia de Ingresos"></asp:Label>
                                        <asp:TextBox ID="txtfrecuencia" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label25" runat="server" Text="Ingresos variables (mensuales)"></asp:Label>
                                        <asp:TextBox ID="txtingresosvariables" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>

                                     <div class="form-group">
                                        <asp:Label ID="Label26" runat="server" Text="Egresos variables (mensuales)"></asp:Label>
                                        <asp:TextBox ID="txtegresosvariables" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                    </div>
                                    
                                    
                                </div>
                            </div>
 
              </fieldset>

                   <section style="padding: 20px;"></section>

                    <fieldset class="border" style="width: 80%; margin-left:100px;margin-top:25px"">
                         <legend class="hdrText">Prestamos y/o Deudas</legend>
                        <div class="col-sm-3 col-md-5">
                                <div class="form-group">
                                    <asp:Label ID="Label21" runat="server" Text="Prestamo Vigente en la Cooperativa"></asp:Label>
                                    <asp:TextBox ID="txtprestamovigente" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                               <div class="form-group">
   
                                   <asp:Button runat="server" ID="btnDetalleDeuda" OnClick="btnDetalleDeuda_Click"  class="btn btn-primary" style="display: inline-block;text-align:center; width:130px"  Text="Ver Detalle"/>
                                </div>

                            </div>

                         <div class="col-sm-3 col-md-5">
                                <div class="form-group">
                                    <asp:Label ID="Label22" runat="server" Text="Prestamo y/o Deuda Vigente"></asp:Label>
                                    <asp:TextBox ID="txtdeudavigente" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                </div>

                              <div class="form-group">
                              
                                   <asp:Button runat="server" ID="btnDetallePrestamoDeutda" OnClick="btnDetallePrestamoDeutda_Click"  class="btn btn-primary" style="display: inline-block;text-align:center; width:130px"  Text="Ver Detalle"/>
  
                                </div>
                            </div>


                        </fieldset>




                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Prestamos Vigentes en la Cooperativa</h5>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left:530px;margin-top:-40px">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                       <div class="modal-body">

                                            <section style="padding-top: 10px"></section>
                                            <div class="form-group">
                                                <asp:Label ID="Label23" runat="server" Text="Tipo de Prestamo Vigente"></asp:Label>
                                                 <asp:TextBox ID="txttipoprevigente" runat="server" class="form-control" Width="80%"></asp:TextBox>
        
                                            </div>
                                            <div class="col-sm-3 col-md-5">
                                              
                                                    <asp:Label ID="Label27" runat="server" Text="Monto del Prestamo Vigente"></asp:Label>
                                                  <asp:TextBox ID="txtmontoprevigente" runat="server" class="form-control" Width="100%"></asp:TextBox>
      
                                          

                                              
                                                     <asp:Label ID="Label28" runat="server" Text="Monto Mensual"></asp:Label>
                                                     <asp:TextBox ID="txtmoprevigente" runat="server" class="form-control" Width="100%"></asp:TextBox>
    
                                       


                                            </div>
                                            <div class="col-sm-3 col-md-5">
                                     
                                                    <div class="form-group" style="margin-top:-3px">
                                                         <asp:Label ID="Label29" runat="server" Text="Numero de Cuotas"></asp:Label>
                                                         <asp:TextBox ID="txtprecuotasvigente" runat="server" class="form-control" Width="100%"></asp:TextBox>
    
                                                    </div>
                                                </div>
                                      
                                        </div>
                                        <div class="modal-footer">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>








                            <!-- Modal Prestamo o Deuda -->
                            <div class="modal fade" id="exampleModalPrestamooDeuda" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">
                                            <asp:Label ID="Label40" runat="server" Text="Prestamos Vigentes en la Cooperativa"></asp:Label></h5>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left:530px;margin-top:-40px">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <section style="padding-top: 10px"></section>
                                            <div class="form-group">
                                               <asp:Label ID="Label30" runat="server" Text="Especifique si es un prestamo o deuda"></asp:Label>
                                                <asp:TextBox ID="txttipodeuda" runat="server" class="form-control" Width="80%"></asp:TextBox>
 
                                            </div>
                                            <div class="col-sm-3 col-md-5">
                                                <div class="form-group">
                                                     <asp:Label ID="Label31" runat="server" Text="Banco"></asp:Label>
                                                    <asp:TextBox ID="txtbanco" runat="server" class="form-control" Width="100%"></asp:TextBox>
     
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label ID="Label32" runat="server" Text="Numero de Cuotas"></asp:Label>
                                                     <asp:TextBox ID="txtdecuotas" runat="server" class="form-control" Width="100%"></asp:TextBox>
     
                                                </div>


                                            </div>
                                            <div class="col-sm-3 col-md-5" style="margin-top:-20px">
                                                <div class="form-group">
                                                    <div class="form-group" style="margin-top:20px">
                                                        <asp:Label ID="Label33" runat="server" Text="Monto Total"></asp:Label>
                                                         <asp:TextBox ID="txtmodeuda" runat="server" class="form-control" Width="100%"></asp:TextBox>
       
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label ID="Label34" runat="server" Text="Monto Mensual"></asp:Label>
                                                    <asp:TextBox ID="txtmomensualdeuda" runat="server" class="form-control" Width="100%"></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>




    <section style="padding: 5px"></section>
    <div style="margin-left:300px">

    
    <asp:Panel runat="server" ID="Pendiente">
        <a id="btnpendiente" href="WF_Listar_Prestamos.aspx" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>Regresar</a>

    </asp:Panel>

    <asp:Panel runat="server" ID="aceptadas">
        <a id="btnAceptadas" href="WF_Listar_Prestamos_Aceptados.aspx" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>Regresar</a>
    </asp:Panel>

    <asp:Panel runat="server" ID="denegadas">
        <a id="btnDenegadas" href="WF_Listar_Prestamos_Denegados.aspx" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>Regresar</a>
    </asp:Panel>
        </div>
    </section>



    <!-- Latest compiled and minified CSS -->

  
                                  

                           
</asp:Content>

