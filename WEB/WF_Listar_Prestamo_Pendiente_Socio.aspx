<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Listar_Prestamo_Pendiente_Socio.aspx.cs" Inherits="WF_Listar_Prestamo_Pendiente_Socio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/sitegridview.css" rel="stylesheet" />
    <link rel="stylesheet" href="dist/style.css">
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
    <section style="padding: 20px;"></section>
    <asp:Label ID="txtCodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtCodSocio" runat="server" Text="" Visible="false"></asp:Label>

    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 95%">
        <h1 style="text-align: center; color: #73879C; margin: 30px"><strong>Lista de Prestamo Pendiente</strong> </h1>
        <div class="sub_head_right" style="margin-left: 20%">
            <img src="img/cabecera.png" alt="Alternate Text" style="height: 60px" />
        </div>
        <fieldset>
            <legend><b>Mis Prestamos Pendientes</b></legend>
            <section style="padding: 10px;"></section>
            <asp:GridView ID="gv_Tabla_Prestamo_Pendiente_Socio" runat="server" EmptyDataText="Usted no tiene prestamos pendientes" OnPageIndexChanging="gv_Tabla_Prestamo_Pendiente_Socio_PageIndexChanging" OnRowCommand="gv_Tabla_Prestamo_Pendiente_Socio_RowCommand" OnRowDataBound="gv_Tabla_Prestamo_Pendiente_Socio_RowDataBound" CssClass="table table-bordered table-hover" Width="80%" AutoGenerateColumns="False" GridLines="None">

                <Columns>

                    <asp:BoundField DataField="PK_IPre_Cod" HeaderText="N° Prestamo" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="FechaRegistro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">

                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>

                    </asp:BoundField>

                    <asp:BoundField DataField="NumeroCuotas" HeaderText="Numero Cuotas" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>


                    <asp:BoundField DataField="LugarResidencia" HeaderText="Residencia" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>


                    <asp:BoundField DataField="CantidadMiembros" HeaderText="Cantidad Miembros" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="IngresosFijos" HeaderText="Ingresos Fijos" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="IngresosVariables" HeaderText="Ingresos Variables" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EstadoDePrestamo" HeaderText="Estado del Prestamo" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>

                </Columns>
                <HeaderStyle BackColor="#6fdefc" ForeColor="Black" Font-Bold="true" />
            </asp:GridView>
        </fieldset>
    </fieldset>



</asp:Content>

