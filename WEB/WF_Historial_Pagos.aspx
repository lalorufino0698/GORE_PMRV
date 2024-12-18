<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Historial_Pagos.aspx.cs" Inherits="WF_Historial_Pagos" %>

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
    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtCodPatrocinador" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtcodSocio" runat="server" Text="" Visible="false"></asp:Label>
    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 95%">
        <h1 style="text-align: center; color: #73879C; margin: 30px"><strong>Lista de Historial de Pagos</strong> </h1>
        <div class="sub_head_right" style="margin-left: 20%">
            <img src="img/cabecera.png" alt="Alternate Text" style="height: 60px" />
        </div>
        <fieldset>
            <legend><b>Historial de Pago</b></legend>
            <section style="padding: 10px;"></section>
            <asp:GridView ID="gv_Tabla_Historial_Pago" runat="server" EmptyDataText="Usted no tiene ningun pago registrado" 
                OnPageIndexChanging="gv_Tabla_Historial_Pago_PageIndexChanging" 
                OnRowCommand="gv_Tabla_Historial_Pago_RowCommand" 
                OnRowDataBound="gv_Tabla_Historial_Pago_RowDataBound" 
                CssClass="table table-bordered table-hover" Width="65%" 
                AutoGenerateColumns="False" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="IC_NumeroCuota" HeaderText="N° Cuota" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="DPago_Fecha" HeaderText="Fecha Pago" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FPago_Monto" HeaderText="Monto" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VEcu_Estado_Cuota" HeaderText="Estado" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#6fdefc" ForeColor="Black" Font-Bold="true" />
            </asp:GridView>
        </fieldset>
    </fieldset>

</asp:Content>


