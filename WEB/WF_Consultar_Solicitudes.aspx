<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Consultar_Solicitudes.aspx.cs" Inherits="WF_Consultar_Solicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body {
            background-color: #E6E6E7;
        }

        .field {
            display: flex;
            position: relative;
            margin-left: 1100px;
            width: 25%;
            flex-direction: row;
            box-shadow: 1px 1px 0 rgb(22, 160, 133), 2px 2px 0 rgb(22, 160, 133), 3px 3px 0 rgb(22, 160, 133), 4px 4px 0 rgb(22, 160, 133), 5px 5px 0 rgb(22, 160, 133), 6px 6px 0 rgb(22, 160, 133), 7px 7px 0 rgb(22, 160, 133);
        }

            .field > input[type=text],
            .field > button {
                display: block;
                font: 1.1em 'Montserrat Alternates';
            }


            .field > input[type=text] {
                flex: 1;
                padding: 0.3em;
                border: 0.3em solid rgb(26, 188, 156);
            }

            .field > button {
                padding: 0.6em 0.7em;
                background-color: rgb(26, 188, 156);
                color: white;
                border: none;
            }
    </style>

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

    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section style="padding: 50px;"></section>
    <h3 style="text-align: center; color: black"><b>LISTA DE SOLICITUDES</b></h3>

    <div class="row">
        <div class="col-sm-3" style="margin-left: 80px">
            <asp:Label ID="Label12" runat="server" Text="Fecha de Regristro"></asp:Label>
            <asp:TextBox ID="txtfecha" runat="server" class="form-control" TextMode="Date" Width="50%"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <asp:Label ID="Label2" runat="server" Text="Socio"></asp:Label>
            <asp:TextBox ID="txtsocio" runat="server" class="form-control" onkeypress="javascript:return SoloNumeros(event,this)" Width="50%"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <asp:Label ID="Label3" runat="server" Text="Estados"></asp:Label>

            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="50%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="">Seleccione una opción> </asp:ListItem>

            </asp:DropDownList>

        </div>

        <div class="btn-group" role="group">
            <asp:LinkButton ID="btnBuscarSocio" CssClass="btn btn-info" Width="" OnClick="btnBuscarSocio_Click" runat="server" Text="Enviar">
                <span class="glyphicon glyphicon-search" aria-hidden="true" style="color: white"></span>
            </asp:LinkButton>

            <asp:LinkButton style="margin-left: 50px" ID="btnBorrar" CssClass="btn btn-warning" runat="server" OnClick="btnBorrar_Click" Text="Enviar">
                <span class="glyphicon glyphicon-erase" aria-hidden="true" style="color: white"></span>
            </asp:LinkButton>

        </div>
        <section style="padding: 20px;"></section>
        <asp:GridView ID="gv_Tabla_Lista_Solicitudes" runat="server" OnRowCommand="gv_Tabla_Lista_Solicitudes_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Solicitudes_PageIndexChanging" style="margin-left: 10px" EmptyDataText="No hay Solicitudes" CssClass="table-condensed table-hover" Width="98%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_Tabla_Lista_Solicitudes_RowDataBound" AllowSorting="true" OnSorting="gv_Tabla_Lista_Solicitudes_Sorting">
            <columns>
                <asp:BoundField DataField="PK_ISol_Cod" HeaderText="N°" />
                <asp:BoundField DataField="DSol_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}" SortExpression="DSol_Fecha_Registro">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="ISol_Dni" HeaderText="DNI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="VSol_Nombre_Completo" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VSol_Apellido_Paterno" HeaderText="Apellido Paterno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VSol_Apellido_Materno" HeaderText="Apellido Materno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>



                </asp:BoundField>

                <asp:BoundField DataField="VSol_Direccion" HeaderText="Dirreccion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VSol_Correo" HeaderText="Correo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="ISol_Celular" HeaderText="Celular" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>

                </asp:BoundField>

                <asp:BoundField DataField="VEsol_Estado_Solicitud" HeaderText="Estado Solicitud" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>


            </columns>

            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />

        </asp:GridView>
</asp:Content>



