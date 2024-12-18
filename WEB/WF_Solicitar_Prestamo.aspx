<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Solicitar_Prestamo.aspx.cs" Inherits="WF_Solicitar_Prestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="dist/StyleSheet.css" rel="stylesheet" />
    
	<script type="text/javascript" src="js	/jquery.js"></script>
	<script type="text/javascript">
        $(document).ready(function () {
            $('input[type=checkbox]').live('click', function () {
                var parent = $(this).parent().attr('id');
                console.log(parent)
                $('#' + parent + ' input[type=checkbox]').removeAttr('checked');
                $(this).attr('checked', 'checked');

            });
        });
    </script>
	<script type="text/javascript"> 
        function SoloNumeros(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return ((key_press > 47 && key_press < 58 || key_press == 110));
        }
        function filterFloat(evt, input) {
            // Backspace = 8, Enter = 13, ‘0′ = 48, ‘9′ = 57, ‘.’ = 46, ‘-’ = 43
            var key = window.Event ? evt.which : evt.keyCode;
            var chark = String.fromCharCode(key);
            var tempValue = input.value + chark;
            if (key >= 48 && key <= 57) {
                if (filter(tempValue) === false) {
                    return false;
                } else {
                    return true;
                }
            } else {
                if (key == 8 || key == 13 || key == 0) {
                    return true;
                } else if (key == 46) {
                    if (filter(tempValue) === false) {
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return false;
                }
            }
        }
        function filter(__val__) {
            var preg = /^([0-9]+\.?[0-9]{0,2})$/;
            if (preg.test(__val__) === true) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="wrap" id="seccion-00">
	<asp:panel ID="PanelPaso1" runat="server">
			<div class="container-fluid" style="margin-left:80px">
                <div class="row hst-seccion" id="seccion-motor-riesgos" style="display: block;">
                    <div class="col-md-12 hst-no-padding">
                        <div class="container-fluid hst-for-close">
                            <div class="hst-closed"></div>
                            <div class="row">
                                <div class="col-sm-10 col-sm-offset-1 col-xs-12 hst-space-work">
                                    <div class="container-fluid hst-center-attention" data-select2-id="51">
                                        <div class="row" data-select2-id="50">
                                            <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12 hst-form mdl-shadow--2dp" data-select2-id="49">
                                                <div class="container-fluid" data-select2-id="48">
                                                    <div class="espacio-datosRiesgo" data-select2-id="47">
								<!-- Inicio Datos Riesgos cliente -->
                                                        <div class="row datosRiesgo-Cliente">
                                                            <div class="col-md-12 text-center">
                                                                <asp:Label ID="txtcodpatrocinador" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="txtcodSocio" runat="server" Visible="false"></asp:Label>
                                                                 <asp:Label ID="cuota" runat="server" Visible="false"></asp:Label>
                                                                 <asp:Label ID="ted" runat="server" Visible="false"></asp:Label>
                                                                <h1 class="hst-form-tittle texto-titulo-pantalla">¡Comencemos,
                                                                    <asp:Label ID="lbldatos" runat="server"></asp:Label>
                                                                    !
                                                                </h1>
                                                                <p class="hst-form-tittle tittle_second_gray" style="font-size: 20px; color: darkgrey">
                                                                    Llena estos
											datos y descubre si tu solicitud fue aprobada
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <section style="padding: 10px"></section>
                                                        <div class="row datosRiesgo-Cliente">
                                                            <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                <i class="fas fa-coins fa-3x" style="color: deepskyblue; margin-top: 30px" aria-hidden="true"></i>
                                                            </div>
                                                            <div class="col-sm-11 col-md-11">
                                                                <asp:TextBox ID="txtfecharegistro" runat="server" class="form-control" Width="100%" Height="50%" CssClass="auto-style1" Visible="false"></asp:TextBox>
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="label_pasos-desktop"><span class="span-paso-pantalla hidden-xs"><b>Paso 1 de 3</b></span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-md-12 texto-lateral"><b>Ingresa el Prestamo a solicitar:</b></div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Tipo de Prestamo</label>
                                                                                <br />
                                                                                <asp:DropDownList ID="ddltipoprestamo" runat="server" CssClass="form-control" Width="111%" OnSelectedIndexChanged="ddltipoprestamo_SelectedIndexChanged" AutoPostBack="true">
                                                                                    <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                                                </asp:DropDownList>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Cuotas</label>
                                                                                <br />
                                                                                <asp:TextBox ID="txtcuotass" runat="server" class="form-control" Width="100%" Height="50%" CssClass="auto-style1" type="number" value="" min="1" max="192" step="1"></asp:TextBox>

                                                                            </div>
                                                                        </div>

                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2" style="margin-left: 140px">
                                                                                <label class="select2__label">Importe</label>
                                                                                <br />
                                                                                <asp:TextBox ID="txtimporte" runat="server" onkeypress="javascript:return filterFloat(event,this)" class="form-control" Width="90%"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Tasa Efectiva Mensual</label>
                                                                                <br />
                                                                                <asp:TextBox ID="txttasamensual" runat="server" class="form-control" Width="90%" Enabled="false"></asp:TextBox>
                                                                            </div>
                                                                        </div>
																		<div class="col-sm-6 col-md-6 margin-bottom-20"">
																			<div class="container-select2" style="margin-left:40px">
																				<label class="select2__label">TEA de Operacion</label>
																				<br />
																				<asp:TextBox ID="txttasaanual" runat="server" class="form-control" Width="90%" Enabled="false"></asp:TextBox>
																			</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <section style="padding: 10px;"></section>
                                                        <div class="row datosRiesgo-Cliente">
                                                            <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                <i class="fas fa-male fa-4x" style="color: deepskyblue; margin-left: 5px" aria-hidden="true"></i>
                                                                <%--<img src="img/iconopersona.png" class="img__Datos-Personales" style="width:30px">--%>
                                                            </div>
                                                            <section style="padding: 10px; margin-top: 80px"></section>
                                                            <div class="col-sm-11 col-md-11">
                                                                <div class="container-fluid">

                                                                    <div class="row">
                                                                        <div class="col-md-12 texto-lateral">
                                                                            <b>Ingresa tus datos
													personales:</b>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Sexo</label>
                                                                                <section style="padding: "></section>
                                                                                <asp:TextBox ID="txtSexo" runat="server" class="form-control" Width="90%" Enabled="false"></asp:TextBox>

                                                                            </div>
                                                                        </div>

                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20" style="margin-left: 40px;">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Estado Civil</label>
                                                                                <section style="padding: 1px;"></section>
                                                                                <asp:TextBox ID="txtEstadoCivil" runat="server" class="form-control" Width="90%" Enabled="false"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <section style="padding: 0px;"></section>
                                                        <div class="row datosRiesgo-Cliente">
                                                            <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                <i class="fas fa-home fa-3x" style="color: deepskyblue" aria-hidden="true"></i>

                                                            </div>
                                                            <div class="col-sm-11 col-md-11">
                                                                <div class="container-fluid">
                                                                    <div class="row">

                                                                        <div class="col-md-12 texto-lateral" style="margin-bottom: 5px;">
                                                                            <b>Ingresa los datos de tu vivienda:</b>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">
                                                                                    Departamento
															de residencia</label>
                                                                                <br />
                                                                                <asp:TextBox ID="txtdepartamento" runat="server" class="form-control" Width="90%" Enabled="false"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20" style="margin-left: 40px">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">
                                                                                    Distrito
															de residencia</label>
                                                                                <br />
                                                                                <section style="padding: 1px;"></section>
                                                                                <asp:TextBox ID="txtDistrito" runat="server" class="form-control" Width="90%" Enabled="false"></asp:TextBox>


                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">
                                                                                    Ingresar miembros
															dependientes</label>
                                                                                <asp:TextBox ID="txtmienbros" runat="server" class="form-control" Width="56%" CssClass="auto-style1" type="number" value="" min="1" max="192" step="1"></asp:TextBox>


                                                                            </div>
                                                                        </div>

                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20" style="margin-left: -65px">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Tipo de vivienda </label>
                                                                                <br />
                                                                                <asp:Textbox ID="txtvivienda" runat="server" CssClass="form-control" Width="90%" Enabled="false">
                                                                                </asp:Textbox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
												
	                                        <%--<asp:Panel ID="alquiler" runat="server" Visible="true">--%>
                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">

                                                                            <asp:Label ID="lblAlquiler" class="select2__label" runat="server">Gasto de Alquiler</asp:Label>
                                                                            <br />
                                                                            <asp:TextBox ID="txtalquiler" runat="server" class="form-control" Width="90%"></asp:TextBox>
                                                                        </div>
                                                                    </div>


                                                                    <%--</asp:Panel>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <section style="padding: 10px;"></section>
                                                        <div class="row datosRiesgo-Cliente" data-select2-id="46">
                                                            <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                <i class="fas fa-briefcase fa-3x" style="color: deepskyblue" aria-hidden="true"></i>

                                                            </div>
                                                            <div class="col-sm-11 col-md-11">
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div class="col-md-12 texto-lateral">
                                                                            <b>Ingresa los datos de tu ocupación</b>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Profesión</label>
                                                                                <br />
                                                                                <asp:Textbox ID="txtprofesion" runat="server" CssClass="form-control" Width="90%" Enabled="false">
                                                                                </asp:Textbox>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20" style="margin-left: 49px;">
                                                                            <div class="container-select2">
                                                                                <label class="select2__label">Rubro de trabajo</label>
                                                                                <br />
                                                                                <asp:Textbox ID="txtrubro" runat="server" CssClass="form-control" Width="90%" Enabled="false">
                                                                                </asp:Textbox>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20" data-select2-id="178">
                                                                            <div class="container-select2" data-select2-id="177">
                                                                                <label class="select2__label">Situación laboral</label>
                                                                                <br />
                                                                                <asp:Textbox ID="txtsituacionlaboral" runat="server" CssClass="form-control" Width="90%" Enabled="false">
                                                                                </asp:Textbox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-6 col-md-6 margin-bottom-20" style="margin-left: 49px;">

                                                                            <label class="mdl-textfield__label" for="numantiguedadLaboralMR">
                                                                                Antigüedad
															laboral (años)</label>
                                                                            <asp:TextBox ID="txtantiguedad" runat="server" class="form-control" Width="68%" CssClass="auto-style1" type="number" value="" min="1" max="30" step="1"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
								<!-- Fin Datos Riesgos cliente -->
								</div>
								<!-- Fin Datos Riesgos No cliente -->

                                                <section style="padding: 10px;"></section>
                                                <div class="row">
                                                    <div id="divDDJJMotorRiesgos" class="col-sm-12 checkox-patpub">

                                                        <asp:CheckBox runat="server" ID="checkInformacion" class="mdl-checkbox__input" Text="La información brindada por Usted
												tiene carácter de
												Declaración Jurada, según lo establecido por el
												artículo 179° de la ley N° 26702." />
                                                        <span class="mdl-checkbox__label"></span>
                                                    </div>
                                                </div>
                                                <section style="padding: 10px;"></section>
                                                <div class="col-sm-3" style="margin-left: 500px">
                                                    <tbody>
                                                        <tr align="center">
                                                            <div class="col-md-2 col-md-offset-5 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4  text-center hst-btn-form">
                                                                <asp:Button class="button" style="margin: 2px; display: inline-block;" runat="server" ID="btnSolicitar" Text="¡Sigamos!" OnClick="btnSolicitar_Click"></asp:Button>

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
		</asp:panel>

	<asp:Panel ID="PanelPaso2" runat="server" Visible="false">	
        <div class="container-fluid" style="margin-left: 80px">
            <!-- Pantalla Motor Riesgos -->
            <div class="row hst-seccion" id="seccion-motor-riesgos" style="display: block;">
                <div class="col-md-12 hst-no-padding">
                    <div class="container-fluid hst-for-close">
                        <div class="hst-closed"></div>
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1 col-xs-12 hst-space-work">
                                <div class="container-fluid hst-center-attention" data-select2-id="51">
                                    <div class="row" data-select2-id="50">
                                        <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12 hst-form mdl-shadow--2dp" data-select2-id="49">
                                            <div class="container-fluid" data-select2-id="48">
                                                <div class="espacio-datosRiesgo" data-select2-id="47">
                                                    <!-- Inicio Datos Riesgos cliente -->
                                                    <div class="row datosRiesgo-Cliente">
                                                        <div class="col-md-12 text-center">
                                                            <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                                            <h1 class="hst-form-tittle texto-titulo-pantalla">¡Cuentanos mas sobre ti,
                                                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                                                !
                                                            </h1>
                                                            <p class="hst-form-tittle tittle_second_gray" style="font-size: 20px; color: darkgrey">Comentamos mas sobre tus ingresos y egresos mensuales</p>
                                                        </div>
                                                    </div>
                                                    <section style="padding: 10px"></section>
                                                    <div class="row datosRiesgo-Cliente">
                                                        <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                            <i class="fas fa-dollar-sign fa-4x" style="color: deepskyblue;" aria-hidden="true"></i>
                                                        </div>
                                                        <div class="col-sm-11 col-md-11">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="label_pasos-desktop"><span class="span-paso-pantalla hidden-xs"><b>Paso 2 de 3</b></span></div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12 texto-lateral"><b>Completa los datos sobre tus ingresos:</b></div>
                                                                </div>
                                                                <div class="row">

                                                                    <div class="col-sm-6 col-md-6 margin-bottom-20">
                                                                        <div class="container-select2">
                                                                            <label class="select2__label">Trabajo</label>
                                                                            <section style="padding: 1px;"></section>
                                                                            <asp:TextBox ID="txtTrabajo" runat="server" class="form-control" Width="120%" Enabled="false"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-6 col-md-6 margin-bottom-20" style="margin-left: 70px;">
                                                                        <div class="container-select2">
                                                                            <label class="select2__label">Frecuencia de Ingresos</label>
                                                                            <asp:Textbox ID="txtingreso" runat="server" CssClass="form-control" Width="66%" Enabled="false">
                                                                            </asp:Textbox>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important; margin-top: 10px">
                                                                        <label class="mdl-textfield__label" for="numIngFijoMR">
                                                                            Ingresos
															fijos (mensuales)
                                                                        </label>


                                                                        <asp:TextBox ID="txtingresos" onkeypress="javascript:return filterFloat(event,this)" runat="server" class="form-control" Width="60%"></asp:TextBox>
                                                                    </div>
                                                                    <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: -100px; margin-top: 10px">
                                                                        <label class="mdl-textfield__label" for="MR">
                                                                            Ingresos variables
															(mensuales)
                                                                        </label>

                                                                        <asp:TextBox ID="txtingresosvariables" onkeypress="javascript:return filterFloat(event,this)" runat="server" class="form-control" Width="58%"></asp:TextBox>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <section style="padding: 10px;"></section>
                                                <div class="row datosRiesgo-Cliente">
                                                    <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                        <i class="fas fa-wallet fa-3x" style="color: deepskyblue" aria-hidden="true"></i>
                                                    </div>
                                                    <section style="padding: 10px; margin-top: 80px"></section>
                                                    <div class="col-sm-11 col-md-11" style="margin-left: -30px">
                                                        <div class="container-fluid">

                                                            <div class="row">
                                                                <div class="col-md-12 texto-lateral"><b>Completa los datos sobre tus egresos:</b></div>
                                                            </div>

                                                            <div class="row">

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">
                                                                        Egresos
															fijos (mensuales)
                                                                    </label>
                                                                    <asp:TextBox ID="TextBox1" onkeypress="javascript:return filterFloat(event,this)" runat="server" class="form-control" Width="60%"></asp:TextBox>
                                                                </div>

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: -100px">
                                                                    <label class="mdl-textfield__label" for="MR">
                                                                        Egresos variables
															(mensuales)
                                                                    </label>

                                                                    <asp:TextBox ID="TextBox2" onkeypress="javascript:return filterFloat(event,this)" runat="server" class="form-control" Width="60%"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <section style="padding: 0px;"></section>
                                                <div class="row datosRiesgo-Cliente">
                                                    <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                        <i class="fas fa-search-dollar fa-3x" style="color: deepskyblue" aria-hidden="true"></i>

                                                        <%--<img src="img/iconopersona.png" class="img__Datos-Personales" style="width:30px">--%>
                                                    </div>
                                                    <section style="padding: 10px; margin-top: 80px"></section>
                                                    <div class="col-sm-11 col-md-11" style="margin-left: -32px">
                                                        <div class="container-fluid">

                                                            <div class="row">
                                                                <div class="col-md-12 texto-lateral"><b>Completa los datos sobre prestamos vigentes en la cooperativa:</b></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">¿Tienes algún préstamo vigente en la cooperativa? </label>                           
                                                                    <asp:RadioButton runat="server" ID="CheckBox1" class="mdl-checkbox__input" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" Text="Si" GroupName="grupoPrestamo" />

                                                                </div>

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-right: -120px">
                                                                    <asp:RadioButton runat="server" ID="CheckBox3" OnCheckedChanged="CheckBox3_CheckedChanged" AutoPostBack="true" class="mdl-checkbox__input" Text="No" GroupName="grupoPrestamo" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <asp:Panel runat="server" ID="Panelprestamo" Visible="false">
                                                    <div class="row" style="margin-top: -50px">
                                                        <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important; margin-left: 85px">
                                                            <label class="mdl-textfield__label" for="numIngFijoMR">Tipo del prestamo vigente</label>
                                                            <asp:DropDownList ID="ddlprestamovigente" runat="server" CssClass="form-control" Width="85%">
                                                                <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: 85px">
                                                            <label class="mdl-textfield__label" for="numIngFijoMR">Monto del prestamo vigente</label>
                                                            <asp:TextBox ID="txtMontoPreVigente" onkeypress="javascript:return filterFloat(event,this)" runat="server" class="form-control" Width="55%"></asp:TextBox>
                                                        </div>
                                                        <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: -80px">
                                                            <label class="mdl-textfield__label" for="numIngFijoMR">Numero de Cuotas: </label>

                                                            <asp:TextBox ID="TextBox8" runat="server" class="form-control" Width="50%" Height="50%" CssClass="auto-style1" type="number" value="" min="1" max="10" step="1"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: 85px">
                                                            <label class="mdl-textfield__label" for="numIngFijoMR">Monto Mensual: </label>

                                                            <asp:TextBox ID="TextBox9" runat="server" onkeypress="javascript:return filterFloat(event,this)" class="form-control" Width="70%"></asp:TextBox>

                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                            </div>							
                                            <section style="padding: 10px;"></section>
                                            <div class="row datosRiesgo-Cliente">
                                                <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                    <i class="fas fa-search-dollar fa-3x" style="color: deepskyblue" aria-hidden="true"></i>
                                                    <%--<img src="img/iconopersona.png" class="img__Datos-Personales" style="width:30px">--%>
                                                </div>
                                                <section style="padding: 10px; margin-top: 80px"></section>
                                                <div class="col-sm-11 col-md-11" style="margin-left: -20px">
                                                    <div class="container-fluid">

                                                        <div class="row">
                                                            <div class="col-md-12 texto-lateral"><b>Completa los datos sobre prestamos y/o deudas vigentes en otros bancos:</b></div>
                                                        </div>

                                                        <div class="row">

                                                            <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                <label class="mdl-textfield__label" for="numIngFijoMR">¿Posees algun prestamo y/o deudas vigentes? </label>
                                                                <%--<img id="tooltip-ingresos-MRC" src="/patpubST/own/img/icons/icono-tooltip-celeste.png" class="iconoTooltip" data-original-title="" title="">--%>

                                                                <asp:RadioButton runat="server" ID="CheckBox4" class="mdl-checkbox__input" Text="Si" OnCheckedChanged="CheckBox4_CheckedChanged" AutoPostBack="true" GroupName="grupoPrestamoDeuda" />

                                                            </div>

                                                            <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-right: -120px">

                                                                <asp:RadioButton runat="server" ID="CheckBox5" class="mdl-checkbox__input" Text="No" OnCheckedChanged="CheckBox5_CheckedChanged" AutoPostBack="true" GroupName="grupoPrestamoDeuda" />

                                                            </div>
                                                        </div>

                                                        <asp:Panel ID="PanelDeudas" runat="server" Visible="false">
                                                            <div class="row">

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">Especifique si es un prestamo o deuda</label>
                                                                    <asp:DropDownList ID="ddlprestamodeuda" runat="server" CssClass="form-control" Width="100%">
                                                                        <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                                                        <asp:ListItem Value="1">Deuda</asp:ListItem>
                                                                        <asp:ListItem Value="2">Prestamo </asp:ListItem>

                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>

                                                            <div class="row">

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">Banco: </label>
                                                                    <%--<img id="tooltip-ingresos-MRC" src="/patpubST/own/img/icons/icono-tooltip-celeste.png" class="iconoTooltip" data-original-title="" title="">--%>

                                                                    <asp:TextBox ID="TextBox5" runat="server" class="form-control" Width="90%"></asp:TextBox>

                                                                </div>

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: 25px">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">Monto total: </label>
                                                                    <br />

                                                                    <asp:TextBox ID="TextBox3" onkeypress="javascript:return filterFloat(event,this)" runat="server" class="form-control" Width="85%"></asp:TextBox>

                                                                </div>
                                                            </div>

                                                            <div class="row">

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">Numero de Cuotas: </label>
                                                                    <%--<img id="tooltip-ingresos-MRC" src="/patpubST/own/img/icons/icono-tooltip-celeste.png" class="iconoTooltip" data-original-title="" title="">--%>

                                                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" Width="70%" Height="50%" CssClass="auto-style1" type="number" value="" min="1" max="10" step="1"></asp:TextBox>

                                                                </div>

                                                                <div class="col-sm-6 col-md-6 espaciosTopBottom" style="margin-left: 60px">
                                                                    <label class="mdl-textfield__label" for="numIngFijoMR">Monto Mensual: </label>
                                                                    <br />

                                                                    <asp:TextBox ID="TextBox7" runat="server" class="form-control" Width="83%"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                        </asp:Panel>

                                                    </div>
                                                </div>
                                            </div>

                                            <section style="padding: 10px;"></section>
                                            <div class="col-sm-3" style="margin-left: 500px">
                                                <tbody>
                                                    <tr align="center">
                                                        <div class="col-md-2 col-md-offset-5 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4  text-center hst-btn-form">
                                                            <asp:Button class="button" style="margin: 2px; display: inline-block;" runat="server" ID="Button1" Text="¡Sigamos!" OnClick="Button1_Click"></asp:Button>

                                                        </div>
                                                </tbody>
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
    </asp:Panel>

			
		

  

       <asp:Panel ID="PanelPaso3" runat="server" Visible="false">

           <div class="container-fluid" style="margin-left: 80px">
               <asp:Label ID="txtprestamosi" runat="server" Visible="false"></asp:Label>
               <asp:Label ID="txtdeudasi" runat="server" Visible="false"></asp:Label>

               <!-- Pantalla Motor Riesgos -->
               <div class="row hst-seccion" id="seccion-motor-riesgos" style="display: block;">
                   <div class="col-md-12 hst-no-padding">
                       <div class="container-fluid hst-for-close">
                           <div class="hst-closed"></div>
                           <div class="row">
                               <div class="col-sm-10 col-sm-offset-1 col-xs-12 hst-space-work">
                                   <div class="container-fluid hst-center-attention" data-select2-id="51">
                                       <div class="row" data-select2-id="50">
                                           <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12 hst-form mdl-shadow--2dp" data-select2-id="49">
                                               <div class="container-fluid" data-select2-id="48">
                                                   <div class="espacio-datosRiesgo" data-select2-id="47">
                                                       <!-- Inicio Datos Riesgos cliente -->
                                                       <div class="row datosRiesgo-Cliente">
                                                           <div class="col-md-12 text-center">
                                                               <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                                                               <h1 class="hst-form-tittle texto-titulo-pantalla">¡Ya casi terminamos,
                                                                   <asp:Label ID="Label4" runat="server"></asp:Label>
                                                                   !
                                                               </h1>
                                                               <p class="hst-form-tittle tittle_second_gray" style="font-size: 20px; color: darkgrey">Adjunta los documentos de manera visible y clara para ser revisados</p>
                                                           </div>
                                                       </div>
                                                       <section style="padding: 10px;"></section>
                                                       <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                       </div>
                                                       <div class="col-sm-11 col-md-11">
                                                           <div class="container-fluid">
                                                               <div class="row">
                                                                   <div class="col-md-12">
                                                                       <div class="label_pasos-desktop" style="margin-left: 115px"><span class="span-paso-pantalla hidden-xs"><b>Paso 3 de 3</b></span></div>
                                                                   </div>
                                                               </div>
                                                               <section style="padding: 10px;"></section>
                                                               <div class="row" style="margin-left: 100px">

                                                                   <div class="col-md-12 texto-lateral"><b>Proceso de Identificación Positiva</b></div>
                                                               </div>


                                                               <div class="row datosRiesgo-Cliente">
                                                                   <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                       <i class="fas fa-upload fa-4x" style="color: deepskyblue; margin-top: 30px" aria-hidden="true"></i>

                                                                   </div>
                                                                   <div class="col-sm-11 col-md-11">
                                                                       <div class="container-fluid">
                                                                           <div class="col-sm-3 col-md-6">
                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte copia de DNI: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpCopiaDNI" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>

                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte libreta de Socio: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload1" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>

                                                                           </div>

                                                                       </div>
                                                                   </div>
                                                               </div>
                                                               <section style="padding: 10px;"></section>
                                                               <div class="row" style="margin-left: 100px">
                                                                   <div class="col-md-12 texto-lateral"><b>Proceso de Validación de Salud</b></div>
                                                               </div>

                                                               <div class="row datosRiesgo-Cliente">
                                                                   <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                       <i class="fas fa-upload fa-4x" style="color: deepskyblue; margin-top: 30px" aria-hidden="true"></i>

                                                                   </div>
                                                                   <div class="col-sm-11 col-md-11">
                                                                       <div class="container-fluid">
                                                                           <div class="col-sm-3 col-md-6">
                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte Declaración de Estado de Salud: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload2" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>

                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte Inscripción del Fondo de Previsión del Prestatario (FPP): </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload3" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>

                                                                           </div>


                                                                       </div>

                                                                   </div>
                                                               </div>

                                                               <section style="padding: 10px;"></section>
                                                               <div class="row" style="margin-left: 100px">
                                                                   <div class="col-md-12 texto-lateral"><b>Proceso de Validación de Aportes</b></div>
                                                               </div>

                                                               <div class="row datosRiesgo-Cliente">
                                                                   <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                       <i class="fas fa-upload fa-4x" style="color: deepskyblue; margin-top: 30px" aria-hidden="true"></i>

                                                                   </div>
                                                                   <div class="col-sm-11 col-md-11">
                                                                       <div class="container-fluid">
                                                                           <div class="col-sm-3 col-md-6">
                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte documento privado de enajenación de aportes sociales: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload4" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>

                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte Declaración  Jurada: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload5" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>




                                                                           </div>

                                                                       </div>
                                                                   </div>
                                                               </div>

                                                               <section style="padding: 10px;"></section>
                                                               <div class="row" style="margin-left: 100px">
                                                                   <div class="col-md-12 texto-lateral"><b>Proceso de Validación de Ingresos</b></div>
                                                               </div>

                                                               <div class="row datosRiesgo-Cliente">
                                                                   <div class="hidden-xs col-sm-1 col-md-1 imagen-formulario">
                                                                       <i class="fas fa-upload fa-4x" style="color: deepskyblue; margin-top: 30px" aria-hidden="true"></i>

                                                                   </div>
                                                                   <div class="col-sm-11 col-md-11">
                                                                       <div class="container-fluid">
                                                                           <div class="col-sm-3 col-md-6">


                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte Boletas de Pago del ultimo mes: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload7" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>
                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte Declaración Jurada de Ingresos: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload6" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>

                                                                               <div class="row">

                                                                                   <div class="col-sm-6 col-md-6 espaciosTopBottom" style="padding-bottom: 5px !important;">
                                                                                       <label class="mdl-textfield__label" for="numIngFijoMR">Adjunte Declaración Jurada de Ingresos notarialmente: </label>
                                                                                       <div class="form-group">

                                                                                           <itemtemplate>

                                                                                               <asp:FileUpload ID="FileUpload8" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                                                                                           </itemtemplate>
                                                                                       </div>
                                                                                   </div>
                                                                               </div>



                                                                           </div>

                                                                       </div>
                                                                   </div>
                                                               </div>
                                                           </div>

                                                           <section style="padding: 10px;"></section>
                                                           <div class="col-sm-3" style="margin-left: 500px">
                                                               <tbody>
                                                                   <tr align="center">
                                                                       <div class="col-md-2 col-md-offset-5 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4  text-center hst-btn-form">
                                                                           <asp:Button class="button" style="margin: 2px; display: inline-block;" runat="server" ID="btnEnviar" Text="Enviar" OnClick="btnEnviar_Click"></asp:Button>

                                                                       </div>
                                                                       <div class="col-md-2 col-md-offset-5 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4  text-center hst-btn-form">
                                                                           <asp:Button class="button" style="margin: 2px; display: inline-block;" runat="server" ID="btnAtras" Text="Atras" OnClick="btnAtras_Click"></asp:Button>

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
                   </div>

               </div>
           </div>

       </asp:Panel>
	   </div>

	     <!-- Alertas -->
        <script src="js/sweetalert.js"></script>
        <script>
            function RegistrarPrestamo() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Registrado',
                    text: 'Se Registro el Prestamo exitosamente',
                    showConfirmButton: false,
                    timer: 3000
                })
            }


            function alertTipoPrestamoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione un Tipo Prestamo',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCuotaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Cuota',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertImporteVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Importe',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertMiembrosVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Miembros dependientes',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertTipoViviendaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione un Tipo de Vivienda',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertProfesionVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione una Profesion',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertRubroVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione un Rubro de Trabajo',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertSituacionLabVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Situacion Laboral',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertAntiguedadLabVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Antiguedad Laboral',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCheckSinMarcar() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Debe marcar la casilla de Declaracion Jurada',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCheckAmbosMarcar() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Debe Seleccionar solo una casilla',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCheckSinMarcar1() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Debe marcar la casilla de prestamos vigentes en la cooperativa',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCheckSinMarcar2() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Debe marcar la casilla de prestamos y/o deudas vigentes en la cooperativa',
                    showConfirmButton: false,
                    timer: 2000
                })
            }



            function alertFrecuenciaIngresosVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione una Frecuencia de Ingresos',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertIngresosFijosMensualesVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Ingreso Fijo Mensual',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertIngresosVariablesMensualesVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Ingreso Variable Mensual',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertGastoAlquilerVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese el Gasto de Alquiler',
                    showConfirmButton: false,
                    timer: 2000
                })
            }



            function alertEgresosFijosMensualesVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Egreso Fijo Mensual',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertEgresosVariablesMensualesVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su Egreso Variable Mensual',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertTipoPrestamoVigenteVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione un Tipo Prestamo Vigente',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertMontoPrestamoVigenteVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese el Monto de Prestamo Vigente',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertNumeroCuotasVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese un Numero de Cuotas',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertMontoMensualVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese un Monto Mensual',
                    showConfirmButton: false,
                    timer: 2000
                })
            }



            function alertPrestamoOdeudalVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione la especificacion de Prestamo o Deuda',
                    showConfirmButton: false,
                    timer: 2000
                })
            }



            function alertBancoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese el Banco',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertMontoTotalVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese el Monto Total',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertNumeroCuotaPanel3Vacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese el Numero de Cuotas',
                    showConfirmButton: false,
                    timer: 2000
                })
            }



            function alertMontoMensualPanel3Vacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese el Monto Mensual',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertImagenIngresada() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Imagen Ingresada',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertErrorImagen() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Adjunte Archivo Solicitado',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertTimeMeses() {
                Swal.fire({
                    position: 'center',
                    icon: 'info',
                    title: 'Estimado, Socio, Ustede debe esperar como mínimo 3 meses para poder volver a solicitar un préstamo',
                    showConfirmButton: false,
                    timer: 5000
                })
            }

            function dataComplementariaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'warning', // Cambiado a 'warning' para indicar una alerta de advertencia
                    title: 'Falta Información',
                    text: 'Por favor, complete todos los datos complementarios antes de continuar.',
                    timer: 8000,
                    showConfirmButton: true,
                    confirmButtonText: 'Entendido',
                }).then((result) => {
                    window.location.href = 'WF_Actualizar_Datos_Cliente.aspx';
                });
            }
            function crediticioNoAceptable(parametro1, parametro2) {
                var mensaje = 'Usted no puede aplicar a este préstamo, por favor, intente con un monto más bajo que: ' + parametro1;
                Swal.fire({
                    position: 'center',
                    icon: 'warning',
                    title: 'PRÉSTAMO NO APLICABLE',
                    text: mensaje,
                    timer: 8000,
                    showConfirmButton: true,
                    confirmButtonText: 'Entendido',
                }).then((result) => {
                    window.location.href = 'WF_Simular_Prestamos.aspx';
                });
            }

        </script>

</asp:Content>
