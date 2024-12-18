<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="Datos_personales.aspx.cs" Inherits="Datos_personales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/nuevoestilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script type="text/javascript">
        function SoloNumeros(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return ((key_press > 47 && key_press < 58) || key_press == 46);
        }
        function SoloLetrasYEsp() {

            if ((event.keyCode >= 65) && (event.keyCode <= 90) || (event.keyCode >= 97) && (event.keyCode <= 122) || event.keyCode == 32 || event.keyCode >= 192 && event.keyCode <= 255) {
                event.returnValue = true;
            }
            else {
                event.returnValue = false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section style="padding: 20px;"></section>

    
    <h1 style="text-align:center;color:#73879C">DATOS PERSONALES</h1>
  
     <asp:Label ID="txtCodSoliGrid" runat="server" Text="" Visible="false"></asp:Label>
     <asp:Label ID="txtdatPatro" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtpkafi" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtcodafi" runat="server" Text="" Visible="false"></asp:Label>

    <br />
        <br />
        

      <section class="auto-style1">

            <div class="container register" >
            
                <div class="col-md-12 register-right" >
                     <div class="row register-form" >
                        <div class="col-sm-6 col-md-12" >
                        
                            <div class="container-fluid">
				
											<div class="row">
												<div class="col-sm-3 col-md-6 margin-bottom-20">			
                                                    <asp:Label ID="Label12" runat="server" Text="Representante"></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:TextBox ID="txtrepresentante" runat="server" class="form-control" ></asp:TextBox>
												</div>
											
												<div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label7" runat="server" Text="Dni"></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:TextBox ID="txtdni" runat="server" class="form-control" ></asp:TextBox>
											    </div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label8" runat="server" Text="Nombre Completo "></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:TextBox ID="txtnombre" runat="server" class="form-control"></asp:TextBox>
												</div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
                                                     <asp:Label ID="Label20" runat="server" Text="Apellidos"></asp:Label>
                                                     <section style="padding: 0px;"></section>
                                                     <asp:TextBox ID="txtapellido" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													 <asp:Label ID="lbl" runat="server" Text="Celular"></asp:Label>
                                                     <section style="padding: 0px;"></section>
                                                     <asp:TextBox ID="txtcelular" minlength="9" MaxLength="9" onkeypress="javascript:return SoloNumeros(event,this)" runat="server" class="form-control"></asp:TextBox>
												</div> 
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label10" runat="server" Text="Telefono Fijo"></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:TextBox ID="txttelefono" onkeypress="javascript:return SoloNumeros(event,this)" runat="server" MaxLength="7" class="form-control"></asp:TextBox>
												</div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label9" runat="server" Text="Estado Civil"></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:TextBox ID="txtestadocivil" runat="server" class="form-control"></asp:TextBox>
												</div>
                                                 <div class="col-sm-3 col-md-6 margin-bottom-20">
													 <asp:Label ID="Label13" runat="server" Text="Estado"></asp:Label>
                                                     <section style="padding: 0px;"></section>
                                                     <asp:TextBox ID="txtestado" runat="server" class="form-control"></asp:TextBox>
												</div>
                                                
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													 <asp:Label ID="Label15" runat="server" Text="Fecha de Registro"></asp:Label>
                                                     <section style="padding: 0px;"></section>
                                                      <asp:TextBox ID="txtregistro" runat="server" class="form-control"></asp:TextBox>
												</div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													 <asp:Label ID="Label11" runat="server" Text="Fecha de Nacimiento"></asp:Label>
                                                     <section style="padding: 0px;"></section>
                                                     <asp:TextBox ID="txtfecha" runat="server"  class="form-control"></asp:TextBox> 
												</div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label14" runat="server" Text="Email"></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
												</div>
   
										</div>
						    </div>                      
					</div>
                          
                 </div>
 
                    <br/>
                    <br/>

                    <div class="row register-form" >
                         
                        <div class="col-sm-6 col-md-12" >
                                <h2 style="text-align:center;color:#73879C;margin:20px">DATOS COMPLEMENTARIOS</h2>
                            <div class="container-fluid">
											
											<div class="row">
												<div class="col-md-12 texto-lateral"><b> Datos de su vivienda:</b></div>
											</div>
										
											
											<div class="row">
												<div class="col-sm-3 col-md-6 margin-bottom-20">			
													<asp:Label ID="Label17" runat="server" Text="Departamento de residencia"></asp:Label>
													<section style="padding: 0px;"></section>
													<asp:TextBox ID="txtdirreccion" runat="server" class="form-control" ></asp:TextBox>
												</div>
											
												<div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label18" runat="server" Text="Distrito"></asp:Label>
                                                        <section style="padding: 0px;"></section>
													<asp:TextBox ID="TextBox1" runat="server" class="form-control" ></asp:TextBox>
													</div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label1" runat="server" Text="Dirección"></asp:Label>
                                                       <section style="padding: 0px;"></section>
													    <asp:TextBox ID="TextBox2" runat="server" class="form-control" ></asp:TextBox>
													</div>
                                                <div class="col-sm-3 col-md-6 margin-bottom-20">
													<asp:Label ID="Label2" runat="server" Text="Tipo de vivienda"></asp:Label>
														<section style="padding: 0px;"></section>
														<asp:DropDownList ID="DropDownList2" runat="server" class="form-control" >
                                                           <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                           <asp:ListItem Value="">Propia </asp:ListItem>
													       <asp:ListItem Value="">Hipotecada </asp:ListItem>
													       <asp:ListItem Value="">Alquilada </asp:ListItem>
                                                           <asp:ListItem Value="">Familiar </asp:ListItem>
                                                        </asp:DropDownList>
												</div>
                                               
										</div>
                                                
							</div>
                             <br />
                                    <br />
                                        
							  

									 <div class="container-fluid">
											
											<div class="row">
												<div class="col-md-12 texto-lateral"><b> Datos de su ocupación:</b></div>
											</div>
										
											
											<div class="row">
												<div class="col-sm-3 col-md-6 ">			
												<asp:Label ID="Label4" runat="server" Text="Profesión"></asp:Label>
                                                <section style="padding: 0px;"></section>
                                                <asp:DropDownList ID="TextBox" runat="server" class="form-control" >
                                                    <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                    <asp:ListItem Value="">Arquitecto </asp:ListItem>
													<asp:ListItem Value="">Ingeniero </asp:ListItem>
													<asp:ListItem Value="">Contador </asp:ListItem>
                                                    <asp:ListItem Value="">Economista </asp:ListItem>
                                                    <asp:ListItem Value="">Empleado Público </asp:ListItem>
													<asp:ListItem Value="">Asesor </asp:ListItem>
                                                    <asp:ListItem Value="">Consultor </asp:ListItem>
                                                    <asp:ListItem Value="">Técnico Informático </asp:ListItem>
													<asp:ListItem Value="">Ejecutivo </asp:ListItem>
                                                    <asp:ListItem Value="">Análista </asp:ListItem>
                                                    <asp:ListItem Value="">Técn. Superior </asp:ListItem>
													<asp:ListItem Value="">Taxista </asp:ListItem>
                                                    <asp:ListItem Value="">Gasfitero </asp:ListItem>
                                                    <asp:ListItem Value="">Electricista</asp:ListItem>
													<asp:ListItem Value="">Jefe </asp:ListItem>
                                                    <asp:ListItem Value="">Comunicador </asp:ListItem>
                                                    <asp:ListItem Value="">Marketero </asp:ListItem>
													<asp:ListItem Value="">Secretario </asp:ListItem>
                                                    <asp:ListItem Value="">Abogado </asp:ListItem>
                                                    <asp:ListItem Value="">Doctor </asp:ListItem>
													<asp:ListItem Value="">Dentista </asp:ListItem>
                                                    <asp:ListItem Value="">Psicólogo </asp:ListItem>
                                                    <asp:ListItem Value="">Odontólogo </asp:ListItem>
													<asp:ListItem Value="">Psiquiatra </asp:ListItem>
                                                    <asp:ListItem Value="">Agricultor </asp:ListItem>
                                                    <asp:ListItem Value="">Albañil </asp:ListItem>
                                                    <asp:ListItem Value="">Ama de casa </asp:ListItem>
                                                    <asp:ListItem Value="">Artista </asp:ListItem>
													<asp:ListItem Value="">Capataz </asp:ListItem>
                                                    <asp:ListItem Value="">Catedrático </asp:ListItem>
                                                    <asp:ListItem Value="">Chef </asp:ListItem>
                                                    <asp:ListItem Value="">Chofer </asp:ListItem>
                                                    <asp:ListItem Value="">Conserje </asp:ListItem>
													<asp:ListItem Value="">Deportista </asp:ListItem>
                                                    <asp:ListItem Value="">Desempleado </asp:ListItem>
                                                    <asp:ListItem Value="">Diplomático </asp:ListItem>
                                                    <asp:ListItem Value="">Director de empresa </asp:ListItem>
                                                    <asp:ListItem Value="">Diseñador </asp:ListItem>
                                                    <asp:ListItem Value="">Empl. Contratado </asp:ListItem>
                                                    <asp:ListItem Value="">Empl. Privado</asp:ListItem>
													<asp:ListItem Value="">Empresario (Pyme) </asp:ListItem>
                                                    <asp:ListItem Value="">Enfermero </asp:ListItem>
                                                    <asp:ListItem Value="">Escritor </asp:ListItem>
                                                    <asp:ListItem Value="">Estudiante</asp:ListItem>
													<asp:ListItem Value="">Farmacéutico </asp:ListItem>
                                                    <asp:ListItem Value="">Fiscal </asp:ListItem>
                                                    <asp:ListItem Value="">Fotógrafo </asp:ListItem>
                                                    <asp:ListItem Value="">Gerente</asp:ListItem>
													<asp:ListItem Value="">Jubilado </asp:ListItem>
                                                    <asp:ListItem Value="">Juez </asp:ListItem>
                                                    <asp:ListItem Value="">Mecánico </asp:ListItem>
                                                    <asp:ListItem Value="">Militar (oficial) </asp:ListItem>
                                                    <asp:ListItem Value="">Militar (ranfo inf.) </asp:ListItem>
                                                    <asp:ListItem Value="">Músico</asp:ListItem>
													<asp:ListItem Value="">Notario </asp:ListItem>
                                                    <asp:ListItem Value="">Obrero </asp:ListItem>
                                                    <asp:ListItem Value="">Otros </asp:ListItem>
                                                    <asp:ListItem Value="">Otros asalariados </asp:ListItem>
                                                    <asp:ListItem Value="">Otros Independ. </asp:ListItem>
                                                    <asp:ListItem Value="">Otros Profesinales Independ. </asp:ListItem>
													<asp:ListItem Value="">Periodista </asp:ListItem>
                                                    <asp:ListItem Value="">Pescador </asp:ListItem>
                                                    <asp:ListItem Value="">Policía (oficial) </asp:ListItem>
                                                    <asp:ListItem Value="">Policía (rango inf.) </asp:ListItem>
                                                    <asp:ListItem Value="">Político</asp:ListItem>
                                                    <asp:ListItem Value="">Practicante </asp:ListItem>
                                                    <asp:ListItem Value="">Procurador </asp:ListItem>
                                                    <asp:ListItem Value="">Profesor </asp:ListItem>
													<asp:ListItem Value="">Religioso </asp:ListItem>
                                                    <asp:ListItem Value="">Rentista </asp:ListItem>
                                                    <asp:ListItem Value="">Subgerente </asp:ListItem>
													<asp:ListItem Value="">Traductor </asp:ListItem>
                                                    <asp:ListItem Value="">Vendedor ambulante </asp:ListItem>
                                                    <asp:ListItem Value="">Vendedor comisionista </asp:ListItem>    
													<asp:ListItem Value="">Veterinario </asp:ListItem>                      
                                                </asp:DropDownList>
													
														
													
												</div>
											
												<div class="col-sm-3 col-md-6 ">
													 <asp:Label ID="Label5" runat="server" Text="Situación laboral"></asp:Label>
                                                    <section style="padding: 0px;"></section>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" >
                                                        <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                        <asp:ListItem Value="">Estable/Fijo </asp:ListItem>
													    <asp:ListItem Value="">A plazo </asp:ListItem>
													    <asp:ListItem Value="">Eventual </asp:ListItem>
                                                        <asp:ListItem Value="">Independiente </asp:ListItem>
                                                    </asp:DropDownList>
												</div>
                                                <div class="col-sm-3 col-md-6 ">
													 <asp:Label ID="Label19" runat="server" Text="Rubro donde trabajas"></asp:Label>
                                                <section style="padding: 0px;"></section>
                                                <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" >
                                                    <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                    <asp:ListItem Value="">Banca </asp:ListItem>
													<asp:ListItem Value="">Seguros </asp:ListItem>
													<asp:ListItem Value="">Administración pública </asp:ListItem>
                                                    <asp:ListItem Value="">Consultoría </asp:ListItem>
                                                    <asp:ListItem Value="">Construcción y materiales cons.</asp:ListItem>
                                                    <asp:ListItem Value="">Enseñanza</asp:ListItem>
													<asp:ListItem Value="">Sanidad </asp:ListItem>
													<asp:ListItem Value="">Correos </asp:ListItem>
                                                    <asp:ListItem Value="">Telecomunicaciones</asp:ListItem>
                                                    <asp:ListItem Value="">Minería </asp:ListItem>
                                                    <asp:ListItem Value="">Comercio minorista </asp:ListItem>
													<asp:ListItem Value="">Insdustria electrónica </asp:ListItem>
													<asp:ListItem Value="">Industria informática </asp:ListItem>
                                                    <asp:ListItem Value="">Otros </asp:ListItem>
                                                    <asp:ListItem Value="">Agencia de viaje </asp:ListItem>
                                                    <asp:ListItem Value="">Agricultura </asp:ListItem>
													<asp:ListItem Value="">Alquiler  Muebles-Inmuebles </asp:ListItem>
													<asp:ListItem Value="">Artes Gráficas </asp:ListItem>
                                                    <asp:ListItem Value="">Diplomáticos </asp:ListItem>
                                                    <asp:ListItem Value="">Ejercito </asp:ListItem>
                                                    <asp:ListItem Value="">Electrica </asp:ListItem>
                                                    <asp:ListItem Value="">Electricidad, agua, gas </asp:ListItem>
													<asp:ListItem Value="">Entrenamiento y Deporte </asp:ListItem>
													<asp:ListItem Value="">Fabricación de metales</asp:ListItem>
                                                    <asp:ListItem Value="">Fabricación de vehículos y accesorios </asp:ListItem>
                                                    <asp:ListItem Value="">Hotelería </asp:ListItem>
													<asp:ListItem Value="">Industría de alimentos y bebidas</asp:ListItem>
                                                    <asp:ListItem Value="">Industría de calzado / cuero / piel </asp:ListItem>
                                                    <asp:ListItem Value="">Industría de maquinaría </asp:ListItem>
                                                    <asp:ListItem Value="">Industría de tabaco </asp:ListItem>
													<asp:ListItem Value="">Industría de papel</asp:ListItem>
                                                    <asp:ListItem Value="">Industria textil </asp:ListItem>
                                                    <asp:ListItem Value="">Mayorista e intermediarios </asp:ListItem>
                                                    <asp:ListItem Value="">Organismos Internaciales </asp:ListItem>
													<asp:ListItem Value="">Organizaciones Sociales</asp:ListItem>
                                                    <asp:ListItem Value="">Pesca y Caza </asp:ListItem>
                                                    <asp:ListItem Value="">Policía</asp:ListItem>
                                                    <asp:ListItem Value="">Prensa </asp:ListItem>
                                                    <asp:ListItem Value="">Radio y TV </asp:ListItem>
                                                    <asp:ListItem Value="">Restaurante </asp:ListItem>
													<asp:ListItem Value="">Servicios de software</asp:ListItem>
                                                    <asp:ListItem Value="">Servicios de transporte aéreo </asp:ListItem>
                                                    <asp:ListItem Value="">Servicios de transporte naval-ferreo</asp:ListItem>
                                                    <asp:ListItem Value="">Servicios de transporte terrestre </asp:ListItem>
                                                    <asp:ListItem Value="">Servicios domésticos </asp:ListItem>
                                                    <asp:ListItem Value="">Ventas y reparación de vehículos </asp:ListItem>
                                                   
                                                </asp:DropDownList>
												</div>
                                                <div class="col-sm-3 col-md-6 ">
													 <asp:Label ID="Label30" runat="server" Text="Antigüedad laboral (años)"></asp:Label>
                                                        <section style="padding: 0px;"></section>
                                                        <asp:TextBox  type="number" value="" min="1" max="192" step="1" runat="server" class="form-control"></asp:TextBox>
												</div>
										
									</div>
                                         <br />
                                         <br />
                                         <br />
									</div>
                    </div>
                </div>
            </div>
                </div>
          





          <script src="js/sweetalert.js"></script>
            <script>
                function alertaagregar() {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Actualizado',
                        text: 'Se Actualizo Los datos Personales',
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
                function celularVacio() {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Incorrecto el formato del Numero',
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
                function contraseñaVacio() {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Ingrese su Contraseña',
                        showConfirmButton: false,
                        timer: 2000
                    })
                }

                function alertCorreoIncorrecto() {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'No es valido el correo ingresado',
                        showConfirmButton: false,
                        timer: 2000
                    })
                }
            </script>


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

    </section>
</asp:Content>

