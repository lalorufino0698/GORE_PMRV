<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_Listar_Afiliaciones.aspx.cs" Inherits="WF_Listar_Afiliaciones" %>

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
    <fieldset class="border" style="width: 95%; margin-left: 15px; height: 95%">
        <h1 style="text-align: center; color: #73879C; margin: 30px"><strong>Lista de Afiliaciones</strong> </h1>
        <div class="sub_head_right" style="margin-left: 20%">
            <img src="img/cabecera.png" alt="Alternate Text" style="height: 60px" />
        </div>
        <fieldset>
            <legend><b>Afiliaciones Realizadas</b></legend>
            <div class="form-group" style="margin-left: 15%">
                <asp:Label ID="Label12" runat="server" Text="Representante"><b>Cantidad Disponible</b></asp:Label>
            </div>
            <div class="form-group" style="margin-left: 15%">
                <asp:TextBox ID="txtcantidad" runat="server" class="form-control" Style="width: 50%; margin-left: 7%"></asp:TextBox>
            </div>
            <section style="padding: 10px;"></section>
            <asp:GridView ID="gv_Tabla_Lista_Afiliaciones" runat="server" EmptyDataText="Usted no ha patrocinado aun a ninguna persona" CssClass="table-condensed table-hover" Width="60%" AutoGenerateColumns="False" GridLines="None" style="text-align: center; margin-left: auto; margin-right: auto">
                <columns>
                    <asp:BoundField DataField="PK_IA_Cod" HeaderText="N°" />
                    <asp:BoundField DataField="IA_Dni" HeaderText="Dni" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>
                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VA_Nombre_Completo" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>
                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VA_Apellido_Paterno" HeaderText="Apellido Paterno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>
                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VA_Apellido_Materno" HeaderText="Apellido Materno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <headerstyle cssclass="text-center"></headerstyle>
                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VA_Correo" HeaderText="Correo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" Visible="false">
                        <headerstyle cssclass="text-center"></headerstyle>

                        <itemstyle cssclass="text-center"></itemstyle>
                    </asp:BoundField>
                </columns>
                <headerstyle backcolor="#6fdefc" forecolor="Black" font-bold="true" />
            </asp:GridView>
        </fieldset>

    </fieldset>
</asp:Content>
