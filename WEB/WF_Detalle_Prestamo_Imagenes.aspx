<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Detalle_Prestamo_Imagenes.aspx.cs" Inherits="WF_Detalle_Prestamo_Imagenes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   <!-- Latest compiled and minified CSS -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section style="margin-left: 100px">


      
                        <h3 style="text-align: center" class="register-heading"><b>DETALLE DE VERIFICACIÓN DE IMAGENES DEL PRESTAMO</b></h3>
                        <section style="padding: 10px;"></section>
                        <div class="row register-form" style="margin-left: 190px">
                            <asp:Label ID="txtCodSoliGrid" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="txtestado" runat="server" Text="" Visible="false"></asp:Label>

                         <fieldset class="border" style="width: 80%; margin-left:100px">
                         <legend class="hdrText">Proceso de Identificación Positiva</legend>
                               <div class="form-group">
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-4">
                                                <img id="dni" class="img-responsive align-content-center" style="width: 300px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Copia_DNI"))%>" />

                                            </div>

                                            <div class="col-md-4">
                                                <img id="libreta" class="img-responsive align-content-center" style="width: 300px; margin-left: 120px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Libreta_Socio"))%>" />

                                            </div>
                                            

                                        </ItemTemplate>

                                    </asp:Repeater>
                                </div>
                          </fieldset>

                             <fieldset class="border" style="width: 80%; margin-left:100px;margin-top:25px">
                                   <legend class="hdrText">Proceso de Validación de Salud</legend>
                                 <div class="form-group">
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-4">
                                                <img id="salud" class="img-responsive align-content-center" style="width: 300px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Declaracion_Salud"))%>" />

                                            </div>

                                            <div class="col-md-4">
                                                <img id="fpp" class="img-responsive align-content-center" style="width: 300px; margin-left: 120px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_FPP"))%>" />

                                            </div>
                                            

                                        </ItemTemplate>

                                    </asp:Repeater>
                                </div>
                                 </fieldset>

                            <fieldset class="border" style="width: 80%; margin-left:100px;margin-top:25px">
                             <legend class="hdrText">Proceso de Validación de Aportes</legend>
                                <div class="form-group">
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-4">
                                                <img id="aportes" class="img-responsive align-content-center" style="width: 300px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Aportes_Sociales"))%>" />

                                            </div>

                                            <div class="col-md-4">
                                                <img id="declaracion" class="img-responsive align-content-center" style="width: 300px; margin-left: 120px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Declaracion_Jurada"))%>" />

                                            </div>
                                            

                                        </ItemTemplate>

                                    </asp:Repeater>
                                </div>
                                </fieldset>

                            <fieldset class="border" style="width: 80%; margin-left:100px;margin-top:25px"">
                                 <legend class="hdrText">Proceso de Validación de Ingresos</legend>
                                <div class="form-group">
                                    <asp:Repeater ID="Repeater4" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-4">
                                                <img id="ultimomes" class="img-responsive align-content-center" style="width: 300px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Boleta_Pago"))%>" />

                                            </div>

                                            <div class="col-md-4">
                                                <img id="declaingresos" class="img-responsive align-content-center" style="width: 300px; margin-left: -10px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Declaracion_Ingresos"))%>" />

                                            </div>
                                            <div class="col-md-4">
                                                <img id="declaingresosnot" class="img-responsive align-content-center" style="width: 300px; margin-left: 0px; height: 385px" src="data:image/png;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"IMPre_Ingresos_Notariales"))%>" />

                                            </div>
                                            

                                        </ItemTemplate>

                                    </asp:Repeater>
                                </div>
                                </fieldset>

                           

                            </div>
                   

                 <section style="padding: 10px"></section>

                            <section style="margin-left:300px;">
                                        <asp:LinkButton ID="btnatras" CssClass="btn btn-info" OnClick="btnatras_Click" runat="server" Text="Atras"> <span class="glyphicon glyphicon-chevron-left" style="color:white" aria-hidden="true"></span>
                                                        <p5 style="color:white">Regresar</p5>
                                    </asp:LinkButton>
                            </section>

                           <section style="margin-left:300px;">
                                <asp:Panel runat="server" ID="aceptadas">
                                        <a id="btnAceptadas" href="WF_Listar_Prestamos_Aceptados.aspx" class="btn btn-success"><span class="glyphicon glyphicon-chevron-left" style="color:white" aria-hidden="true"></span> Regresar</a>
                                </asp:Panel>
                        </section>

                <section style="margin-left:300px;">
                              <asp:Panel runat="server" ID="denegadas">
                                        <a id="btnDenegadas" href="WF_Listar_Prestamos_Denegados.aspx" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left" style="color:white" aria-hidden="true"></span> Regresar</a>
                            </asp:Panel>
                    </section>
            
        </section>
</asp:Content>


