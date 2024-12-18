<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Actualizar_Datos_Cliente.aspx.cs" Inherits="WF_Actualizar_Datos_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="dist/style.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css">
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <style>
        fieldset {
            border: 1px solid #999;
            border-radius: 8px;
            box-shadow: 0 0 10px #999;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="txtCodSoliGrid" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtdatPatro" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtpkafi" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtcodafi" runat="server" Text="" Visible="false"></asp:Label>
    <br />
    <section class="auto-style1">
        <div class="container register">
            <div class="col-md-12 register-right">
                <div class="row register-form">
                    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 95%">
                        <h1 style="text-align: center; color: #73879C; margin: 30px"><strong>DATOS PERSONALES</strong> </h1>
                        <div class="col-sm-6 col-md-12" style="margin-left: 10%">
                            <div class="container-fluid">
                                <asp:TextBox ID="txtsolicitud" runat="server" class="form-control" Visible="false"></asp:TextBox>

                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label12" runat="server" Text="Representante"><b>Representante</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtrepresentante" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label7" runat="server" Text="Dni"><b>Dni</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtdni" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label8" runat="server" Text="Nombre Completo"><b>Nombre Completo</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtnombre" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label1" runat="server" Text="Apellidos"><b>Apellidos</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtapellido" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="lbl" runat="server" Text="Celular"><b>Celular</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtcelular" minlength="9" MaxLength="9" onkeypress="javascript:return SoloNumeros(event,this)" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label10" runat="server" Text="Telefono Fijo"><b>Telefono Fijo</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txttelefono" onkeypress="javascript:return SoloNumeros(event,this)" runat="server" MaxLength="7" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label9" runat="server" Text="Estado Civil"><b>Estado Civil</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtestadocivil" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label13" runat="server" Text="Estado"><b>Estado</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtestado" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label15" runat="server" Text="Fecha de Registro"><b>Fecha de Registro</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtregistro" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label11" runat="server" Text="Fecha de Nacimiento"><b>Fecha de Nacimiento</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtfecha" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:Label ID="Label14" runat="server" Text="Email"><b>Email</b></asp:Label>
                                </div>
                                <div class="form-group" style="margin-left: 15%">
                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <br />

                <div class="row register-form">
                    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 85%">
                        <div class="col-sm-6 col-md-12">
                            <h1 style="text-align: center; color: #73879C">DATOS COMPLEMENTARIOS</h1>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12 texto-lateral"><b>Datos de su vivienda:</b></div>
                                </div>
                                <br />
                                <div class="row">

                                    <div class="form-group">
                                        <asp:Label ID="Label17" runat="server" Text="Departamento de residencia"></asp:Label>
                                        <asp:TextBox ID="txtdepartamento" runat="server" class="form-control" Style="width: 165%"></asp:TextBox>
                                    </div>
                                    <div class="form-group" style="margin-left: 16%">
                                        <asp:Label ID="Label18" runat="server" Text="Distrito"></asp:Label>
                                        <asp:TextBox ID="txtdistrito" runat="server" class="form-control" Style="width: 140%"></asp:TextBox>
                                    </div>
                                    <div class="form-group" style="margin-left: 10%">
                                        <asp:Label ID="Label16" runat="server" Text="Dirección"></asp:Label>
                                        <asp:TextBox ID="txtdirreccion" runat="server" class="form-control" Style="width: 130%"></asp:TextBox>
                                    </div>
                                    <div class="form-group" style="margin-left: 10%">
                                        <asp:Label ID="ddlVivienda" runat="server" Text="Tipo de vivienda"></asp:Label>
                                        <asp:DropDownList ID="ddlTipoVivienda" runat="server" class="form-control" Style="width: 120%">
                                            <asp:ListItem Value="0">Seleccione una opción </asp:ListItem>
                                            <asp:ListItem Value="1">Propia </asp:ListItem>
                                            <asp:ListItem Value="2">Hipotecada </asp:ListItem>
                                            <asp:ListItem Value="3">Alquilada </asp:ListItem>
                                            <asp:ListItem Value="4">Familiar </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtvivienda" runat="server" class="form-control" Style="width: 120%"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            <br />
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12 texto-lateral"><b>Datos de su ocupación:</b></div>
                                </div>
                                <br />
                                <div class="row">

                                    <div class="form-group">
                                        <asp:Label ID="Label20" runat="server" Text="Profesión"></asp:Label>
                                        <asp:DropDownList ID="ddlocupacion" runat="server" class="form-control" Style="width: 150%">
                                            <asp:ListItem Value="0">Seleccione una opción </asp:ListItem>
                                            <asp:ListItem Value="1">Arquitecto </asp:ListItem>
                                            <asp:ListItem Value="2">Ingeniero </asp:ListItem>
                                            <asp:ListItem Value="3">Contador </asp:ListItem>
                                            <asp:ListItem Value="4">Economista </asp:ListItem>
                                            <asp:ListItem Value="5">Empleado Público </asp:ListItem>
                                            <asp:ListItem Value="6">Asesor </asp:ListItem>
                                            <asp:ListItem Value="7">Consultor </asp:ListItem>
                                            <asp:ListItem Value="8">Técnico Informático </asp:ListItem>
                                            <asp:ListItem Value="9">Ejecutivo </asp:ListItem>
                                            <asp:ListItem Value="10">Análista </asp:ListItem>
                                            <asp:ListItem Value="11">Técn. Superior </asp:ListItem>
                                            <asp:ListItem Value="12">Taxista </asp:ListItem>
                                            <asp:ListItem Value="13">Gasfitero </asp:ListItem>
                                            <asp:ListItem Value="14">Electricista</asp:ListItem>
                                            <asp:ListItem Value="15">Jefe </asp:ListItem>
                                            <asp:ListItem Value="16">Comunicador </asp:ListItem>
                                            <asp:ListItem Value="17">Marketero </asp:ListItem>
                                            <asp:ListItem Value="18">Secretario </asp:ListItem>
                                            <asp:ListItem Value="19">Abogado </asp:ListItem>
                                            <asp:ListItem Value="20">Doctor </asp:ListItem>
                                            <asp:ListItem Value="21">Dentista </asp:ListItem>
                                            <asp:ListItem Value="22">Psicólogo </asp:ListItem>
                                            <asp:ListItem Value="23">Odontólogo </asp:ListItem>
                                            <asp:ListItem Value="24">Psiquiatra </asp:ListItem>
                                            <asp:ListItem Value="25">Agricultor </asp:ListItem>
                                            <asp:ListItem Value="26">Albañil </asp:ListItem>
                                            <asp:ListItem Value="27">Ama de casa </asp:ListItem>
                                            <asp:ListItem Value="28">Artista </asp:ListItem>
                                            <asp:ListItem Value="29">Capataz </asp:ListItem>
                                            <asp:ListItem Value="30">Catedrático </asp:ListItem>
                                            <asp:ListItem Value="31">Chef </asp:ListItem>
                                            <asp:ListItem Value="32">Chofer </asp:ListItem>
                                            <asp:ListItem Value="33">Conserje </asp:ListItem>
                                            <asp:ListItem Value="34">Deportista </asp:ListItem>
                                            <asp:ListItem Value="35">Desempleado </asp:ListItem>
                                            <asp:ListItem Value="36">Diplomático </asp:ListItem>
                                            <asp:ListItem Value="37">Director de empresa </asp:ListItem>
                                            <asp:ListItem Value="38">Diseñador </asp:ListItem>
                                            <asp:ListItem Value="39">Empl. Contratado </asp:ListItem>
                                            <asp:ListItem Value="40">Empl. Privado</asp:ListItem>
                                            <asp:ListItem Value="41">Empresario (Pyme) </asp:ListItem>
                                            <asp:ListItem Value="42">Enfermero </asp:ListItem>
                                            <asp:ListItem Value="43">Escritor </asp:ListItem>
                                            <asp:ListItem Value="44">Estudiante</asp:ListItem>
                                            <asp:ListItem Value="45">Farmacéutico </asp:ListItem>
                                            <asp:ListItem Value="46">Fiscal </asp:ListItem>
                                            <asp:ListItem Value="47">Fotógrafo </asp:ListItem>
                                            <asp:ListItem Value="48">Gerente</asp:ListItem>
                                            <asp:ListItem Value="49">Jubilado </asp:ListItem>
                                            <asp:ListItem Value="50">Juez </asp:ListItem>
                                            <asp:ListItem Value="51">Mecánico </asp:ListItem>
                                            <asp:ListItem Value="52">Militar (oficial) </asp:ListItem>
                                            <asp:ListItem Value="53">Militar (ranfo inf.) </asp:ListItem>
                                            <asp:ListItem Value="54">Músico</asp:ListItem>
                                            <asp:ListItem Value="55">Notario </asp:ListItem>
                                            <asp:ListItem Value="56">Obrero </asp:ListItem>
                                            <asp:ListItem Value="57">Otros </asp:ListItem>
                                            <asp:ListItem Value="58">Otros asalariados </asp:ListItem>
                                            <asp:ListItem Value="59">Otros Independ. </asp:ListItem>
                                            <asp:ListItem Value="60">Otros Profesinales Independ. </asp:ListItem>
                                            <asp:ListItem Value="61">Periodista </asp:ListItem>
                                            <asp:ListItem Value="62">Pescador </asp:ListItem>
                                            <asp:ListItem Value="63">Policía (oficial) </asp:ListItem>
                                            <asp:ListItem Value="64">Policía (rango inf.) </asp:ListItem>
                                            <asp:ListItem Value="65">Político</asp:ListItem>
                                            <asp:ListItem Value="66">Practicante </asp:ListItem>
                                            <asp:ListItem Value="67">Procurador </asp:ListItem>
                                            <asp:ListItem Value="68">Profesor </asp:ListItem>
                                            <asp:ListItem Value="69">Religioso </asp:ListItem>
                                            <asp:ListItem Value="70">Rentista </asp:ListItem>
                                            <asp:ListItem Value="71">Subgerente </asp:ListItem>
                                            <asp:ListItem Value="72">Traductor </asp:ListItem>
                                            <asp:ListItem Value="73">Vendedor ambulante </asp:ListItem>
                                            <asp:ListItem Value="74">Vendedor comisionista </asp:ListItem>
                                            <asp:ListItem Value="75">Veterinario </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtprofesion" runat="server" class="form-control" Style="width: 200%"></asp:TextBox>
                                    </div>
                                    <div class="form-group" style="margin-left: 19%">
                                        <asp:Label ID="slNormal" runat="server" Text="Situación laboral"></asp:Label>
                                        <asp:TextBox ID="txtsituacionLaboral" runat="server" class="form-control" Style="width: 135%"></asp:TextBox>

                                    </div>
                                    <div class="form-group" style="margin-left: -5%">
                                        <asp:Label ID="slEdit" runat="server" Text="Situación laboral"></asp:Label>
                                        <asp:DropDownList ID="ddlSituacionLaboral" runat="server" class="form-control" Style="width: 150%">
                                            <asp:ListItem Value="0">Seleccione una opción </asp:ListItem>
                                            <asp:ListItem Value="1">Estable/Fijo </asp:ListItem>
                                            <asp:ListItem Value="2">A plazo </asp:ListItem>
                                            <asp:ListItem Value="3">Eventual </asp:ListItem>
                                            <asp:ListItem Value="4">Independiente </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group" style="margin-left: 14%">
                                        <asp:Label ID="rubroNormal" runat="server" Text="Rubro de Trabajo" Style="margin-left: 2%"></asp:Label>
                                        <asp:TextBox ID="txtrubro" runat="server" class="form-control" Style="width: 140%"></asp:TextBox>
                                    </div>
                                    <div class="form-group" style="margin-left: -4%">
                                         <asp:Label ID="rubroEdit" runat="server" Text="Rubro de Trabajo" Style="margin-left: 9%"></asp:Label>
                                        <asp:DropDownList ID="ddlRubro" runat="server" class="form-control" Style="width: 80%; margin-left: 10%">
                                            <asp:ListItem Value="0">Seleccione una opción </asp:ListItem>
                                            <asp:ListItem Value="1">Banca </asp:ListItem>
                                            <asp:ListItem Value="2">Seguros </asp:ListItem>
                                            <asp:ListItem Value="3">Administración pública </asp:ListItem>
                                            <asp:ListItem Value="4">Consultoría </asp:ListItem>
                                            <asp:ListItem Value="5">Construcción y materiales cons.</asp:ListItem>
                                            <asp:ListItem Value="6">Enseñanza</asp:ListItem>
                                            <asp:ListItem Value="7">Sanidad </asp:ListItem>
                                            <asp:ListItem Value="8">Correos </asp:ListItem>
                                            <asp:ListItem Value="9">Telecomunicaciones</asp:ListItem>
                                            <asp:ListItem Value="10">Minería </asp:ListItem>
                                            <asp:ListItem Value="11">Comercio minorista </asp:ListItem>
                                            <asp:ListItem Value="12">Insdustria electrónica </asp:ListItem>
                                            <asp:ListItem Value="13">Industria informática </asp:ListItem>
                                            <asp:ListItem Value="14">Otros </asp:ListItem>
                                            <asp:ListItem Value="15">Agencia de viaje </asp:ListItem>
                                            <asp:ListItem Value="16">Agricultura </asp:ListItem>
                                            <asp:ListItem Value="17">Alquiler  Muebles-Inmuebles </asp:ListItem>
                                            <asp:ListItem Value="18">Artes Gráficas </asp:ListItem>
                                            <asp:ListItem Value="19">Diplomáticos </asp:ListItem>
                                            <asp:ListItem Value="20">Ejercito </asp:ListItem>
                                            <asp:ListItem Value="21">Electrica </asp:ListItem>
                                            <asp:ListItem Value="22">Electricidad, agua, gas </asp:ListItem>
                                            <asp:ListItem Value="23">Entrenamiento y Deporte </asp:ListItem>
                                            <asp:ListItem Value="24">Fabricación de metales</asp:ListItem>
                                            <asp:ListItem Value="25">Fabricación de vehículos y accesorios </asp:ListItem>
                                            <asp:ListItem Value="26">Hotelería </asp:ListItem>
                                            <asp:ListItem Value="27">Industría de alimentos y bebidas</asp:ListItem>
                                            <asp:ListItem Value="28">Industría de calzado / cuero / piel </asp:ListItem>
                                            <asp:ListItem Value="29">Industría de maquinaría </asp:ListItem>
                                            <asp:ListItem Value="30">Industría de tabaco </asp:ListItem>
                                            <asp:ListItem Value="31">Industría de papel</asp:ListItem>
                                            <asp:ListItem Value="32">Industria textil </asp:ListItem>
                                            <asp:ListItem Value="33">Mayorista e intermediarios </asp:ListItem>
                                            <asp:ListItem Value="34">Organismos Internaciales </asp:ListItem>
                                            <asp:ListItem Value="35">Organizaciones Sociales</asp:ListItem>
                                            <asp:ListItem Value="36">Pesca y Caza </asp:ListItem>
                                            <asp:ListItem Value="37">Policía</asp:ListItem>
                                            <asp:ListItem Value="38">Prensa </asp:ListItem>
                                            <asp:ListItem Value="39">Radio y TV </asp:ListItem>
                                            <asp:ListItem Value="40">Restaurante </asp:ListItem>
                                            <asp:ListItem Value="41">Servicios de software</asp:ListItem>
                                            <asp:ListItem Value="42">Servicios de transporte aéreo </asp:ListItem>
                                            <asp:ListItem Value="43">Servicios de transporte naval-ferreo</asp:ListItem>
                                            <asp:ListItem Value="44">Servicios de transporte terrestre </asp:ListItem>
                                            <asp:ListItem Value="45">Servicios domésticos </asp:ListItem>
                                            <asp:ListItem Value="46">Ventas y reparación de vehículos </asp:ListItem>
                                        </asp:DropDownList>
                                       
                                    </div>
                  
                                    <div class="form-group" style="margin-left: 22%">
                                       <asp:Label ID="fsNormal" runat="server" Text="Frecuencia salarial" Style="margin-left: -65%"></asp:Label> 
                                       <asp:TextBox ID="txtFrecuencia" runat="server" class="form-control" Style="width: 130%; margin-left: -65%"></asp:TextBox>
                                   </div>
                                    <div class="form-group" style="margin-left: -20%">
                                        <asp:Label ID="fsEdit" runat="server" Text="Frecuencia salarial" Style="margin-left: 9%"></asp:Label>
                                        <asp:DropDownList ID="ddlFrecuenciaSalarial" runat="server" class="form-control" Style="width: 120%; margin-left: 10%">
                                            <asp:ListItem Value="0">Seleccione una opción </asp:ListItem>
                                            <asp:ListItem Value="1">Mensuales </asp:ListItem>
                                            <asp:ListItem Value="2">Quincenales </asp:ListItem>
                                            <asp:ListItem Value="3">Semanales </asp:ListItem>
                                            <asp:ListItem Value="4">Diarios</asp:ListItem>
                                            <asp:ListItem Value="5">Por proyecto </asp:ListItem>
                                            <asp:ListItem Value="6">Por contrato </asp:ListItem>
                                        </asp:DropDownList>
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <br />
                <br />
                <fieldset class="border" style="width: 95%; margin-left: 15px; height: 85%">
                    <div class="form-group" style="margin-left: 35%">
                        <asp:LinkButton ID="LinkButton1" CssClass="btn-bootstrap-style btn-primary-style" runat="server" Text="Enviar" OnClick="btnEnviarCotizacion_Click" Style="height: 90%; margin-left: 5%">
                            <span class="glyphicon glyphicon-repeat" aria-hidden="true" style="color: white"></span>
                            <p5 style="color: white">GUARDAR</p5>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" CssClass="btn-bootstrap-style btn-success-style" runat="server" Text="Editar" OnClick="LinkButton3_Click">
                            <span class="glyphicon glyphicon-pencil" style="color: white" aria-hidden="true"></span>
                            <p5 style="color: white">EDITAR</p5>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CssClass="btn-bootstrap-style btn-danger-style" runat="server" Text="Regresar" OnClick="btnatras_Click" Style="height: 90%; margin-left: 5%">
                            <span class="glyphicon glyphicon-backward" style="color: white" aria-hidden="true"></span>
                            <p5 style="color: white">REGRESAR</p5>
                        </asp:LinkButton>
                    </div>
                </fieldset>

            </div>
        </div>
        <script src="js/sweetalert.js"></script>
        <script>
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

            function SituacionLaboralVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su situacion laboral',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function ProfesionVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su profesion',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function TipoViviendaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su tipo de vivienda',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function RubroVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su rubro',
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
        <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    </section>

</asp:Content>

