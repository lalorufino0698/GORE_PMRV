<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Detalle_Solicitud.aspx.cs" Inherits="WF_Detalle_Solicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        fieldset {
            background-color: #D5D8DC;
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

        }
    </style>

    <fieldset>
        <h3 style="text-align: center; color: black"><b>DETALLE DE SOLICITUD</b></h3>
        <asp:Label ID="txtcodpatrooooci" runat="server" Text="" Visible="false"></asp:Label>
        <section style="padding: 10px;"></section>
        <div class="row register-form" style="margin-left: 190px">
            <asp:Label ID="txtCodSoliGrid" runat="server" Text="" Visible="false"></asp:Label>
            <div class="col-sm-3 col-md-5">
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Dni"></asp:Label>
                    <asp:TextBox ID="txtDni" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Datos Patrocinador"></asp:Label>
                    <asp:TextBox ID="txtNomPatrocinador" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Telefono Fijo"></asp:Label>
                    <asp:TextBox ID="txtTfijo" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Departamento"></asp:Label>
                    <asp:TextBox ID="txtDepartamento" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Fecha Nacimiento"></asp:Label>
                    <asp:TextBox ID="txtfechaNac" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Provincia"></asp:Label>
                    <asp:TextBox ID="txtProvincia" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Estado Civil"></asp:Label>
                    <asp:TextBox ID="txtEcivil" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Correo"></asp:Label>
                    <asp:TextBox ID="txtCorreo" runat="server" class="form-control" Width="100%"></asp:TextBox>
                </div>


            </div>

            <div class="col-sm-3 col-md-5">
                <div class="form-group">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Nombre Completo"></asp:Label>
                        <asp:TextBox ID="txtNombreCompleto" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" Text="Codigo Patrocinador"></asp:Label>
                        <asp:TextBox ID="txtCodPatrocinador" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label9" runat="server" Text="Celular"></asp:Label>
                        <asp:TextBox ID="txtCelular" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label14" runat="server" Text="Ocupacion"></asp:Label>
                        <asp:TextBox ID="txtOcupacion" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Text="Fecha Registro"></asp:Label>
                        <asp:TextBox ID="txtFechaRegistro" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label15" runat="server" Text="Estado Solicitud"></asp:Label>
                        <asp:TextBox ID="txtEsolicitud" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Direccion"></asp:Label>
                        <asp:TextBox ID="txtDireccion" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label16" runat="server" Text="Afiliacion"></asp:Label>
                        <asp:TextBox ID="txtAfiliacion" runat="server" class="form-control" Width="100%"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

    </fieldset>




    <fieldset class="border" style="width: 100%">
        <legend>Información Imágenes</legend>
        <div class="form-group">
            <asp:Repeater ID="Repeater2" runat="server">
                <itemtemplate>
                    <div class="col-md-4">
                        <img id="hola" class="img-responsive align-content-center" style="height: 500px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMSol_Recibo_Luz"))%>" />

                    </div>

                    <div class="col-md-4">
                        <img id="hola1" class="img-responsive align-content-center" style="margin-left: -110px; height: 450px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMSol_Recibo_agua"))%>" />

                    </div>
                    <div class="col-md-4">
                        <img id="hola2" class="img-responsive align-content-center" style="margin-left: -40px; height: 500px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMSol_Imagen_Vivienda"))%>" />

                    </div>


                    <img id="hola3" class="img-responsive align-content-center" style="margin-left: 560px; margin-top: -400px; height: 500px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMSol_Constancia"))%>" />



                </itemtemplate>

            </asp:Repeater>
        </div>


        <div class="col">
            <section style="padding: 5px;"></section>
            <asp:Panel runat="server" ID="pendientes">
                <a id="btnVerificar" href="https://sroppublico.jne.gob.pe/Consulta/Afiliado" class="btn btn-success" style="width: 10%" target="_blank"><span class="glyphicon glyphicon-check" style="color: white" aria-hidden="true"></span>Verificar</a>
                <asp:LinkButton ID="btnatras" CssClass="btn btn-info" OnClick="btnatras_Click" runat="server" style="width: 10%" Text="Atras">
                    <span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>
                    <p5 style="color: white">Regresar</p5>
                </asp:LinkButton>

            </asp:Panel>
            <asp:Panel runat="server" ID="aceptadas">
                <a id="btnAceptadas" href="WF_Listar_Solicitud_Aceptada.aspx" class="btn btn-success"><span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>Regresar</a>
            </asp:Panel>

            <asp:Panel runat="server" ID="denegadas">
                <a id="btnDenegadas" href="WF_Listar_Solicitud_Denegadas.aspx" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left" style="color: white" aria-hidden="true"></span>Regresar</a>
            </asp:Panel>

        </div>

    </fieldset>




</asp:Content>

