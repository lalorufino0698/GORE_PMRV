<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Historial_Prestamo.aspx.cs" Inherits="WF_Historial_Prestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/sitegridview.css" rel="stylesheet" />
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section style="padding: 20px;"></section>
    <asp:Label ID="txtCodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtCodSocio" runat="server" Text="" Visible="false"></asp:Label>



    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 95%">
        <h1 style="text-align: center; color: #73879C; margin: 30px"><strong>Historial de Prestamos</strong> </h1>
        <div class="sub_head_right" style="margin-left: 20%">
            <img src="img/cabecera.png" alt="Alternate Text" style="height: 60px" />
        </div>
        <fieldset>
            <legend><b>Mi Historial de Prestamos</b></legend>
            <section style="padding: 10px;"></section>
            <asp:GridView ID="gv_Tabla_Historial_Prestamo_Socio" runat="server" EmptyDataText="Usted no ha solicitado ningun prestamos hasta el momento" OnRowCommand="gv_Tabla_Historial_Prestamo_Socio_RowCommand" OnPageIndexChanging="gv_Tabla_Historial_Prestamo_Socio_PageIndexChanging" OnRowDataBound="gv_Tabla_Historial_Prestamo_Socio_RowDataBound" CssClass="table table-bordered table-hover" Width="80%" AutoGenerateColumns="False" GridLines="None">
                <columns>

                    <asp:BoundField DataField="PK_IPre_Cod" HeaderText="Nº Prestamo" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaRegistro" HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="VTP_Nombre" HeaderText="Tipo" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="NumeroCuotas" HeaderText="Cuotas" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="FPre_Tasa_Mensual" HeaderText="Tasa Mensual" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="FPre_Tcea" HeaderText="TCEA" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EstadoDePrestamo" HeaderText="Estado" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>

                </columns>
                <headerstyle backcolor="#6fdefc" forecolor="Black" font-bold="true" />
            </asp:GridView>
        </fieldset>
    </fieldset>

</asp:Content>

