<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WF_Registrar_Solicitud.aspx.cs" Inherits="WF_Registrar_Solicitud" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>San Cosme</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicons -->


    <link href="img/SanCosme.png" rel="shortcut icon" />


    <!-- Bootstrap CSS File -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <!-- Nivo Slider Theme -->
    <link href="css/nivo-slider-theme.css" rel="stylesheet" />

    <!-- Main Stylesheet File -->
    <link href="css/style.css" rel="stylesheet" />

    <!-- Responsive Stylesheet File -->
    <link href="css/responsive.css" rel="stylesheet" />

</head>


<!--Pequeño script para el movimiento del title-->
<script type="text/javascript">
    var txt = "San Cosme - Coorperativa de ahorro y crédito  -  ";
    var espera = 100;
    var refresco = null;
    function rotulo_title() {
        document.title = txt;
        txt = txt.substring(1, txt.length) + txt.charAt(0);
        refresco = setTimeout("rotulo_title()", espera);
    }

    rotulo_title();


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





<body data-spy="scroll" data-target="#navbar-example">

    <form id="form1" runat="server">

        <section style="margin-top: 50px; margin-left: 250px">
            <img src="img/SanCosme.png" alt="Alternate Text" />
        </section>
        <h1 class="hdrText1" style="text-align: center; margin-top: -95PX">FORMULARIO REGISTRAR SOLICITUD</h1>

        <style>
            .hdrText1 {
                color: #73879C;
                font-weight: bold;
            }

            fieldset {
                background-color: #eeeeee;
                border-radius: 4px;
            }


            legend {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 4px;
                color: var(--purple);
                font-size: 17px;
                font-weight: bold;
                padding: 3px 5px 3px 7px;
                width: auto;
            }

            .tab-content {
                width: 95%;
                height: 50%;
                background: #215a65;
                margin-left: 50px;
            }
        </style>


        <section style="padding: 40px"></section>
        <asp:Label ID="lblpkpatrobus" runat="server" Text="Codigo" Visible="false"></asp:Label>
        <asp:Label ID="lbldniPatrobus" runat="server" Text="Codigo" Visible="false"></asp:Label>
        <asp:Label ID="lblcantafiliabus" runat="server" Text="Codigo" Visible="false"></asp:Label>
        <div class="tab-content" id="myTabContent">
            <section style="padding: 40px"></section>
            <fieldset class="border" style="width: 90%; margin-left: 90px">
                <legend class="hdrText">Datos del Patrocinador</legend>

                <div class="col-sm-3 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="txtafiliacion" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="Codigo: "></asp:Label>
                        <asp:TextBox ID="txtCodPatrocinador" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                </div>

                <div class="col-sm-9 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" Text="Socio: "></asp:Label>
                        <asp:TextBox ID="txtDatPatrocinador" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                </div>
            </fieldset>

            <section style="padding: 10px;"></section>



            <fieldset class="border" style="width: 90%; margin-left: 90px">
                <legend class="hdrText">Datos</legend>
                <div class="col-sm-3 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label9" runat="server" Text="Documento de Identidad"></asp:Label>
                        <asp:TextBox ID="txtDni" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label10" runat="server" Text="Apellido Paterno"></asp:Label>
                        <asp:TextBox ID="txtApaterno" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                    <div class="form-group">

                        <asp:Label ID="Label12" runat="server" Text="Fecha de Nacimiento"></asp:Label>
                        <asp:TextBox ID="txtfechaNacimiento" runat="server" class="form-control" TextMode="Date" Width="85%"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label16" runat="server" Text="Fecha Registro"></asp:Label>
                        <asp:TextBox ID="txtFechaRegistro" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNacimiento" runat="server" Text="Lugar de Nacimiento"></asp:Label>
                        <asp:DropDownList ID="ddlLugarNacimiento" runat="server" CssClass="form-control" Width="85%" OnSelectedIndexChanged="ddlLugarNacimiento_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                            <asp:ListItem Value="1">Amazonas </asp:ListItem>
                            <asp:ListItem Value="2">Ancash </asp:ListItem>
                            <asp:ListItem Value="3">Apurimac </asp:ListItem>
                            <asp:ListItem Value="4">Arequipa </asp:ListItem>
                            <asp:ListItem Value="5">Ayacucho </asp:ListItem>
                            <asp:ListItem Value="6">Cajamarca </asp:ListItem>
                            <asp:ListItem Value="7">Callao </asp:ListItem>
                            <asp:ListItem Value="8">Cusco </asp:ListItem>
                            <asp:ListItem Value="9">Huancavelica </asp:ListItem>
                            <asp:ListItem Value="10">Huánuco </asp:ListItem>
                            <asp:ListItem Value="11">Ica </asp:ListItem>
                            <asp:ListItem Value="12">Junín </asp:ListItem>
                            <asp:ListItem Value="13">La Libertad </asp:ListItem>
                            <asp:ListItem Value="14">Lambayeque </asp:ListItem>
                            <asp:ListItem Value="15">Lima </asp:ListItem>
                            <asp:ListItem Value="16">Loreto </asp:ListItem>
                            <asp:ListItem Value="17">Madre de Dios </asp:ListItem>
                            <asp:ListItem Value="18">Moquegua </asp:ListItem>
                            <asp:ListItem Value="19">Pasco </asp:ListItem>
                            <asp:ListItem Value="20">Puno </asp:ListItem>
                            <asp:ListItem Value="21">San Martín </asp:ListItem>
                            <asp:ListItem Value="22">Tacna </asp:ListItem>
                            <asp:ListItem Value="23">Tumbes </asp:ListItem>
                            <asp:ListItem Value="24">Ucayali </asp:ListItem>

                        </asp:DropDownList>
                    </div>




                </div>
                <div class="col-sm-9 col-md-6">

                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Nombre Completo"></asp:Label>
                        <asp:TextBox ID="txtNombre" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Apellido Materno"></asp:Label>
                        <asp:TextBox ID="txtAmaterno" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Estado Civil"></asp:Label>
                        <asp:DropDownList ID="ddlEstadoCivil" runat="server" CssClass="form-control" Width="85%">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                <asp:ListItem Value="1">Soltero(a)</asp:ListItem>
                                <asp:ListItem Value="2">Casado(a)</asp:ListItem>
                                <asp:ListItem Value="3">Viudo(a)</asp:ListItem>
                                <asp:ListItem Value="4">Divorciado(a)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label21" runat="server" Text="Sexo"></asp:Label>
                        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control" Width="85%" OnSelectedIndexChanged="ddlSexo_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                            <asp:ListItem Value="1">Masculino </asp:ListItem>
                            <asp:ListItem Value="2">Femenino </asp:ListItem>
                            <asp:ListItem Value="3">No definido </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label22" runat="server" Text="Provincia"></asp:Label>
                        <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" Width="85%" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                            <asp:ListItem Value="1">Daniel Alcides Carrión </asp:ListItem>
                            <asp:ListItem Value="2">Oxapampa </asp:ListItem>
                            <asp:ListItem Value="3">Pasco </asp:ListItem>
                            <asp:ListItem Value="4">Cerro Omate </asp:ListItem>
                            <asp:ListItem Value="5">Ilo </asp:ListItem>
                            <asp:ListItem Value="6">Mariscal </asp:ListItem>
                            <asp:ListItem Value="7">Manu </asp:ListItem>
                            <asp:ListItem Value="8">Tahuamanu </asp:ListItem>
                            <asp:ListItem Value="9">Tambopata </asp:ListItem>
                            <asp:ListItem Value="10">Alto Amazonas </asp:ListItem>
                            <asp:ListItem Value="11">Datem del Marañón </asp:ListItem>
                            <asp:ListItem Value="12">Loreto </asp:ListItem>
                            <asp:ListItem Value="13">Mariscal Ramón Castilla </asp:ListItem>
                            <asp:ListItem Value="14">Maynas </asp:ListItem>
                            <asp:ListItem Value="15">Putumayo </asp:ListItem>
                            <asp:ListItem Value="16">Requena </asp:ListItem>
                            <asp:ListItem Value="17">Ucayali </asp:ListItem>
                            <asp:ListItem Value="18">Chiclayo </asp:ListItem>
                            <asp:ListItem Value="19">Ferreñafe </asp:ListItem>
                            <asp:ListItem Value="20">Lambayeque </asp:ListItem>
                            <asp:ListItem Value="21">Ascope </asp:ListItem>
                            <asp:ListItem Value="22">Bolívar </asp:ListItem>
                            <asp:ListItem Value="23">Chepén </asp:ListItem>
                            <asp:ListItem Value="24">Gran Chimmú </asp:ListItem>
                            <asp:ListItem Value="25">Julcán </asp:ListItem>
                            <asp:ListItem Value="26">Otuzco </asp:ListItem>
                            <asp:ListItem Value="27">Pacasmayo </asp:ListItem>
                            <asp:ListItem Value="28">Pataz </asp:ListItem>
                            <asp:ListItem Value="29">Sánchez Carrión </asp:ListItem>
                            <asp:ListItem Value="30">Santiago de Chuco </asp:ListItem>
                            <asp:ListItem Value="31">Trujillo </asp:ListItem>
                            <asp:ListItem Value="32">Virú </asp:ListItem>
                            <asp:ListItem Value="33">Chanchamayo </asp:ListItem>
                            <asp:ListItem Value="34">Chupaca </asp:ListItem>
                            <asp:ListItem Value="35">Concepción </asp:ListItem>
                            <asp:ListItem Value="36">Huancayo </asp:ListItem>
                            <asp:ListItem Value="37">Jauja </asp:ListItem>
                            <asp:ListItem Value="38">Junín </asp:ListItem>
                            <asp:ListItem Value="39">Satipo </asp:ListItem>
                            <asp:ListItem Value="40">Tarma </asp:ListItem>
                            <asp:ListItem Value="41">Yauli </asp:ListItem>
                            <asp:ListItem Value="42">Chincho </asp:ListItem>
                            <asp:ListItem Value="43">Ica </asp:ListItem>
                            <asp:ListItem Value="44">Nasca </asp:ListItem>
                            <asp:ListItem Value="45">Palpa </asp:ListItem>
                            <asp:ListItem Value="46">Pisco </asp:ListItem>
                            <asp:ListItem Value="47">Ambo </asp:ListItem>
                            <asp:ListItem Value="48">Dos de Mayo </asp:ListItem>
                            <asp:ListItem Value="49">Huacaybamba </asp:ListItem>
                            <asp:ListItem Value="50">Huamalíes </asp:ListItem>
                            <asp:ListItem Value="51">Huánuco </asp:ListItem>
                            <asp:ListItem Value="52">Lauricocha </asp:ListItem>
                            <asp:ListItem Value="53">Leoncio Prado </asp:ListItem>
                            <asp:ListItem Value="54">Marañon </asp:ListItem>
                            <asp:ListItem Value="55">Pachitea </asp:ListItem>
                            <asp:ListItem Value="56">Puerto Inca </asp:ListItem>
                            <asp:ListItem Value="57">Yarowilca </asp:ListItem>
                            <asp:ListItem Value="58">Acobamba </asp:ListItem>
                            <asp:ListItem Value="59">Angaraes </asp:ListItem>
                            <asp:ListItem Value="60">Castrovirreyna </asp:ListItem>
                            <asp:ListItem Value="61">Churcampa </asp:ListItem>
                            <asp:ListItem Value="62">Huancavelica </asp:ListItem>
                            <asp:ListItem Value="63">Huaytará </asp:ListItem>
                            <asp:ListItem Value="64">Tayacaja </asp:ListItem>
                            <asp:ListItem Value="65">Acomayo </asp:ListItem>
                            <asp:ListItem Value="66">Anta </asp:ListItem>
                            <asp:ListItem Value="67">Calca </asp:ListItem>
                            <asp:ListItem Value="68">Canas </asp:ListItem>
                            <asp:ListItem Value="69">Canchis </asp:ListItem>
                            <asp:ListItem Value="70">Chumbivilcas </asp:ListItem>
                            <asp:ListItem Value="71">Cusco </asp:ListItem>
                            <asp:ListItem Value="72">Espinar </asp:ListItem>
                            <asp:ListItem Value="73">La Convención </asp:ListItem>
                            <asp:ListItem Value="74">Paruro </asp:ListItem>
                            <asp:ListItem Value="75">Paucartambo </asp:ListItem>
                            <asp:ListItem Value="76">Quispicanchi </asp:ListItem>
                            <asp:ListItem Value="77">Urubamba </asp:ListItem>
                            <asp:ListItem Value="78">Callao </asp:ListItem>
                            <asp:ListItem Value="79">Cajabamba </asp:ListItem>
                            <asp:ListItem Value="80">Cajamarca </asp:ListItem>
                            <asp:ListItem Value="81">Celendín </asp:ListItem>
                            <asp:ListItem Value="82">Chota </asp:ListItem>
                            <asp:ListItem Value="83">Contumazá </asp:ListItem>
                            <asp:ListItem Value="84">Cutervo </asp:ListItem>
                            <asp:ListItem Value="85">Hualgayoc </asp:ListItem>
                            <asp:ListItem Value="86">Jaén </asp:ListItem>
                            <asp:ListItem Value="87">San Ignacio </asp:ListItem>
                            <asp:ListItem Value="88">San Marcos </asp:ListItem>
                            <asp:ListItem Value="89">San Miguel </asp:ListItem>
                            <asp:ListItem Value="90">San Pablo </asp:ListItem>
                            <asp:ListItem Value="91">Santa Cruz </asp:ListItem>
                            <asp:ListItem Value="92">Cangallo </asp:ListItem>
                            <asp:ListItem Value="93">Huamanga </asp:ListItem>
                            <asp:ListItem Value="94">Huanca Sancos </asp:ListItem>
                            <asp:ListItem Value="95">Huanta </asp:ListItem>
                            <asp:ListItem Value="96">La Mar </asp:ListItem>
                            <asp:ListItem Value="97">Lucanas </asp:ListItem>
                            <asp:ListItem Value="98">Parinacochas </asp:ListItem>
                            <asp:ListItem Value="99">Páucar del Sara Sara </asp:ListItem>
                            <asp:ListItem Value="100">Sucre </asp:ListItem>
                            <asp:ListItem Value="101">Victor Fajardo </asp:ListItem>
                            <asp:ListItem Value="102">Vicashuamán </asp:ListItem>
                            <asp:ListItem Value="103">Arequipa </asp:ListItem>
                            <asp:ListItem Value="104">Camaná </asp:ListItem>
                            <asp:ListItem Value="105">Caravellí </asp:ListItem>
                            <asp:ListItem Value="106">Castilla </asp:ListItem>
                            <asp:ListItem Value="107">Caylloma </asp:ListItem>
                            <asp:ListItem Value="108">Condesuyos </asp:ListItem>
                            <asp:ListItem Value="109">Islay </asp:ListItem>
                            <asp:ListItem Value="110">La Unión </asp:ListItem>
                            <asp:ListItem Value="111">Abancay </asp:ListItem>
                            <asp:ListItem Value="112">Andahuaylas </asp:ListItem>
                            <asp:ListItem Value="113">Antabamba </asp:ListItem>
                            <asp:ListItem Value="114">Aymaraes </asp:ListItem>
                            <asp:ListItem Value="115">Chincheros </asp:ListItem>
                            <asp:ListItem Value="116">Cotabambas </asp:ListItem>
                            <asp:ListItem Value="117">Grau </asp:ListItem>
                            <asp:ListItem Value="118">Ajia </asp:ListItem>
                            <asp:ListItem Value="119">Antonio Raimondi </asp:ListItem>
                            <asp:ListItem Value="120">Asunción </asp:ListItem>
                            <asp:ListItem Value="121">Bolognesi </asp:ListItem>
                            <asp:ListItem Value="122">Carhuaz </asp:ListItem>
                            <asp:ListItem Value="123">Carlos Fermín Fitzacarrald </asp:ListItem>
                            <asp:ListItem Value="124">Casma </asp:ListItem>
                            <asp:ListItem Value="125">Corongo </asp:ListItem>
                            <asp:ListItem Value="126">Huaraz </asp:ListItem>
                            <asp:ListItem Value="127">Huari </asp:ListItem>
                            <asp:ListItem Value="128">Huarmey </asp:ListItem>
                            <asp:ListItem Value="129">Huaylas </asp:ListItem>
                            <asp:ListItem Value="130">Mariscal Luzuriaga </asp:ListItem>
                            <asp:ListItem Value="131">Ocros </asp:ListItem>
                            <asp:ListItem Value="132">Pallasca </asp:ListItem>
                            <asp:ListItem Value="133">Pomabamba </asp:ListItem>
                            <asp:ListItem Value="134">Recuay </asp:ListItem>
                            <asp:ListItem Value="135">Santa </asp:ListItem>
                            <asp:ListItem Value="136">Sihuas </asp:ListItem>
                            <asp:ListItem Value="137">Yungay </asp:ListItem>
                            <asp:ListItem Value="138">Bagua </asp:ListItem>
                            <asp:ListItem Value="139">Bongará </asp:ListItem>
                            <asp:ListItem Value="140">Chachapoyas </asp:ListItem>
                            <asp:ListItem Value="141">Condorcanqui </asp:ListItem>
                            <asp:ListItem Value="142">Luya </asp:ListItem>
                            <asp:ListItem Value="143">Rodríguez de Mendoza </asp:ListItem>
                            <asp:ListItem Value="144">Utcubamba </asp:ListItem>
                            <asp:ListItem Value="145">Barranca</asp:ListItem>
                            <asp:ListItem Value="146">Cajatambo </asp:ListItem>
                            <asp:ListItem Value="147">Canta </asp:ListItem>
                            <asp:ListItem Value="148">Cañete </asp:ListItem>
                            <asp:ListItem Value="149">Huaral </asp:ListItem>
                            <asp:ListItem Value="150">Huarochirí </asp:ListItem>
                            <asp:ListItem Value="151">Huaura </asp:ListItem>
                            <asp:ListItem Value="152">Lima </asp:ListItem>
                            <asp:ListItem Value="153">Oyón </asp:ListItem>
                            <asp:ListItem Value="154">Yauyos </asp:ListItem>


                        </asp:DropDownList>
                    </div>




                </div>
            </fieldset>

            <section style="padding: 10px;"></section>

            <fieldset class="border" style="width: 90%; margin-left: 90px">
                <legend class="hdrText">Domicilio</legend>


                <div class="col-sm-3 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label11" runat="server" Text="Direccion"></asp:Label>
                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control" Width="200%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Text="Departamento"></asp:Label>
                        <section style="padding: 2px;"></section>
                        <asp:TextBox ID="txtDepartamento" runat="server" Text="Lima" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                </div>


                <div class="col-sm-9 col-md-6">
                    <section style="padding: 35px;"></section>
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Distrito"></asp:Label>
                        <asp:DropDownList ID="ddlDistrito" runat="server" CssClass="form-control" Width="85%">
                            <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                            <asp:ListItem Value="1">Ancón </asp:ListItem>
                            <asp:ListItem Value="2">Ate Vitarte </asp:ListItem>
                            <asp:ListItem Value="3">Barranco </asp:ListItem>
                            <asp:ListItem Value="4">Breña </asp:ListItem>
                            <asp:ListItem Value="5">Carabayllo </asp:ListItem>
                            <asp:ListItem Value="6">Chaclacayo </asp:ListItem>
                            <asp:ListItem Value="7">Chorrillos </asp:ListItem>
                            <asp:ListItem Value="8">Cieneguilla </asp:ListItem>
                            <asp:ListItem Value="9">Comas </asp:ListItem>
                            <asp:ListItem Value="10">El Agustino </asp:ListItem>
                            <asp:ListItem Value="11">Independencia </asp:ListItem>
                            <asp:ListItem Value="12">Jesús María </asp:ListItem>
                            <asp:ListItem Value="13">La Molina </asp:ListItem>
                            <asp:ListItem Value="14">La Victoria </asp:ListItem>
                            <asp:ListItem Value="15">Lima </asp:ListItem>
                            <asp:ListItem Value="16">Lince </asp:ListItem>
                            <asp:ListItem Value="17">Los Olivos </asp:ListItem>
                            <asp:ListItem Value="18">Lurigancho </asp:ListItem>
                            <asp:ListItem Value="19">Lurín </asp:ListItem>
                            <asp:ListItem Value="20">Magdalena del Mar </asp:ListItem>
                            <asp:ListItem Value="21">Miraflores </asp:ListItem>
                            <asp:ListItem Value="22">Pachacamac </asp:ListItem>
                            <asp:ListItem Value="23">Pucusana </asp:ListItem>
                            <asp:ListItem Value="24">Pueblo Libre </asp:ListItem>
                            <asp:ListItem Value="25">Puente Piedra</asp:ListItem>
                            <asp:ListItem Value="26">Punta Hermosa </asp:ListItem>
                            <asp:ListItem Value="27">Punta Negra </asp:ListItem>
                            <asp:ListItem Value="28">Rímac </asp:ListItem>
                            <asp:ListItem Value="29">San Bartolo</asp:ListItem>
                            <asp:ListItem Value="30">San Borja </asp:ListItem>
                            <asp:ListItem Value="31">San Isidro </asp:ListItem>
                            <asp:ListItem Value="32">San Juan de Lurigancho </asp:ListItem>
                            <asp:ListItem Value="33">San Juan de Miraflores </asp:ListItem>
                            <asp:ListItem Value="34">San Luis </asp:ListItem>
                            <asp:ListItem Value="35">San Martín de Porres </asp:ListItem>
                            <asp:ListItem Value="36">San Miguel </asp:ListItem>
                            <asp:ListItem Value="37">Santa Anita </asp:ListItem>
                            <asp:ListItem Value="38">Santa María del Mar </asp:ListItem>
                            <asp:ListItem Value="39">Santa Rosa </asp:ListItem>
                            <asp:ListItem Value="40">Santiago de Surco </asp:ListItem>
                            <asp:ListItem Value="41">Surquillo </asp:ListItem>
                            <asp:ListItem Value="42">Villa El Salvador </asp:ListItem>
                            <asp:ListItem Value="43">Villa María del Triunfo </asp:ListItem>

                        </asp:DropDownList>
                    </div>

                </div>


            </fieldset>
            <section style="padding: 10px;"></section>

            <fieldset class="border" style="width: 90%; margin-left: 90px">
                <legend class="hdrText">Complementario</legend>

                <div class="col-sm-3 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label13" runat="server" Text="Correo"></asp:Label>
                        <asp:TextBox ID="txtCorreo" runat="server" class="form-control" Width="85%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label14" runat="server" Text="Telefono Fijo"></asp:Label>
                        <asp:TextBox ID="txtTelfijo" onkeypress="javascript:return SoloNumeros(event)" MaxLength="7" MinLength="7" runat="server" class="form-control" Width="85%"></asp:TextBox>

                    </div>
                </div>

                <div class="col-sm-9 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label15" runat="server" Text="Celular"></asp:Label>
                        <asp:TextBox ID="txtCelular" onkeypress="javascript:return SoloNumeros(event)" MaxLength="9" MinLength="9" runat="server" class="form-control" Width="85%"></asp:TextBox>

                    </div>
                    <asp:Label ID="Label4" runat="server" Text="Ocupaciòn"></asp:Label>
                    <asp:DropDownList ID="ddlOcupacion" runat="server" CssClass="form-control" Width="85%">
                        <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
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
                </div>

            </fieldset>
            <section style="padding: 10px;"></section>

            <fieldset class="border" style="width: 90%; margin-left: 90px">
                <legend class="hdrText">Detalle</legend>

                <div class="col-sm-3 col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label17" runat="server" Text="Adjunte un Recibo de luz"></asp:Label>
                        <itemtemplate>

                            <asp:FileUpload ID="FileUpReciboLuz" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                        </itemtemplate>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label18" runat="server" Text="Adjunte un Recibo de Agua"></asp:Label>
                        <itemtemplate>
                            <asp:FileUpload ID="FileUpReciboAgua" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                        </itemtemplate>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label19" runat="server" Text="Adjunte un Recibo de Vivienda"></asp:Label>
                        <itemtemplate>
                            <asp:FileUpload ID="FileUpVivienda" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                        </itemtemplate>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label20" runat="server" Text="Adjunte Constancia Patrocinador"></asp:Label>

                        <itemtemplate>
                            <asp:FileUpload ID="FileUpConstancia" CssClass="form-control glyphicon glyphicon-download-alt" runat="server" Width="100%" Height="6%" />
                        </itemtemplate>
                    </div>
                </div>

                <div class="col-sm-9 col-md-6">
                    <%-- <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" Text="Enviar"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true" style="color:white"></span>
                                                        <p5 style="color:white">Cargar</p5>
                            </asp:LinkButton>
                            <section style="padding: 2px;"></section>
                            <asp:LinkButton ID="LinkButton2" CssClass="btn btn-success" runat="server" Text="Enviar"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true" style="color:white"></span>
                                                        <p5 style="color:white">Cargar</p5>
                            </asp:LinkButton>
                            <section style="padding: 2px;"></section>
                            <asp:LinkButton ID="LinkButton3" CssClass="btn btn-success" runat="server" Text="Enviar"> <span class="glyphicon glyphicon-download-alt" aria-hidden="true" style="color:white"></span>
                                                        <p5 style="color:white">Cargar</p5>
                            </asp:LinkButton>--%>
                </div>
            </fieldset>
            <section style="padding: 10px; margin-left: 100px">

                <asp:LinkButton ID="btnRegistrarSolicitud" CssClass="btn btn-success" Width="10%" runat="server" OnClick="btnRegistrarSolicitud_Click" Text="Enviar"> <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white"></span>
                                                        <p5 style="color:white">Registrar Solicitud</p5>
                </asp:LinkButton>
                <asp:LinkButton ID="btnatras" CssClass="btn btn-info" Width="10%" runat="server" Text="Atras" OnClick="btnatras_Click"> <span class="glyphicon glyphicon-chevron-left" style="color:white" aria-hidden="true"></span>
                                                        <p5 style="color:white">Regresar</p5>
                </asp:LinkButton>
            </section>
        </div>
        <footer>
            <div class="footer-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="footer-content">
                                <div class="footer-head">
                                    <div class="footer-logo">
                                        <h2><span>San</span>Cosme</h2>
                                    </div>

                                    <p>Somos una Cooperativa de Ahorro y Crédito que tiene 64 años de vida institucional; lo cual habla mucho de nuestra solidez y confianza retribuida por nuestros asociados; los cuales a través de estos años han ido logrando concretar muchas de sus metas personales y familiares.La solidez de nuestros 64 años nos hace ser considerada la más exitosa y representativa del Distrito de La Victoria.</p>
                                    <div class="footer-icons">
                                        <ul>
                                            <li>
                                                <a href="#"><i class="fab fa-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-google"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end single footer -->
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="footer-content">
                                <div class="footer-head">
                                    <h4>información</h4>
                                    <p>
                                        Cooperativa de ahorro y crédito.
               
                                    </p>
                                    <div class="footer-contacts">
                                        <p><span>Teléfono:</span>993 403 034</p>
                                        <p><span>Correo:</span> informes@coopacsancosme.com</p>
                                        <p><span>Horario de Trabajo:</span> 9am-6pm</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end single footer -->
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="footer-content">
                                <div class="footer-head">
                                    <h4>Blog</h4>
                                    <div class="flicker-img">
                                        <a href="#">
                                            <img src="img/portfolio/7.jpg" alt="" /></a>
                                        <a href="#">
                                            <img src="img/portfolio/8.jpg" alt="" /></a>
                                        <a href="#">
                                            <img src="img/portfolio/9.jpg" alt="" /></a>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-area-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="copyright text-center">
                                <p>
                                    &copy; Copyright <strong>SanCosme</strong>. Todos los derechos reservados
             
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="lib/jquery/jquery.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/venobox/venobox.min.js"></script>
        <script src="lib/knob/jquery.knob.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/parallax/parallax.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/nivo-slider/js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="lib/appear/jquery.appear.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>





        <!-- Contact Form JavaScript File -->
        <script src="contactform/contactform.js"></script>
        <script src="jquery.validationEngine-en.js" type="text/javascript"></script>

        <script src="js/main.js"></script>


        <!-- Alertas -->
        <script src="js/sweetalert.js"></script>
        <script>
            function alertDnivacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese su DNI',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function alertDnidigitos() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'El DNI solo puede contener 8 digitos',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function alertNombreVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Nombre completo',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertApaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Apellido Paterno',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function alertAmaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Apeliido Materno',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertEstadoCivilVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Estado Civil',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function alertSexolVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Sexo',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertFechaNacVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Fecha de Nacimiento',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
            function alertFechaNacMayor18() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Tiene que ser persona mayor a 18 años',
                    showConfirmButton: false,
                    timer: 2000
                })
            }



            function alertDireccionVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Direccion',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertDepartamentoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Lugar de Nacimiento',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertDistritoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Distrito',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertProvinciaVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Provincia',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function alertCorreoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Correo Electronico',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertCelularVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Numero celular',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertTelefonoVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Ingrese Telefono Fijo',
                    showConfirmButton: false,
                    timer: 2000
                })
            }

            function alertOcupacionVacio() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Seleccione su Ocupacion',
                    showConfirmButton: false,
                    timer: 2000
                })
            }


            function RegistrarSolicitud() {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Registrado',
                    text: 'Se Registro la Solicitud exitosamente, esperar credenciales en su bandeja de correo',
                    showConfirmButton: false,
                    timer: 4000
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
        </script>
    </form>
</body>
</html>
