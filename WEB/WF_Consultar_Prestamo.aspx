<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Consultar_Prestamo.aspx.cs" Inherits="WF_Consultar_Prestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="scripts/jquery.tablesorter.js" type="text/javascript"></script>
    <script src="scripts/jquery.quicksearch.js" type="text/javascript"></script>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section style="padding: 50px;"></section>
    <h3 style="text-align: center; color: black"><b>CONSULTAR PRESTAMO</b></h3>

    <asp:Label ID="txtCorreo" runat="server" Text="" Visible="false"></asp:Label>

    <div class="row">
        <div class="col-sm-3" style="margin-left: 80px">
            <asp:Label ID="Label12" runat="server" Text="Fecha de Regristro"></asp:Label>
            <asp:TextBox ID="txtfecha" runat="server" class="form-control" TextMode="Date" Width="50%"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <asp:Label ID="Label4" runat="server" Text="Socio"></asp:Label>
            <asp:TextBox ID="txtsocio" runat="server" onkeypress="javascript:return SoloNumeros(event,this)" class="form-control" Width="50%"></asp:TextBox>
        </div>
        <div class="col-sm-3">
            <asp:Label ID="Label21" runat="server" Text="Estados"></asp:Label>
            <asp:DropDownList ID="ddlPrestamoxEstado" runat="server" CssClass="form-control" Width="50%" OnSelectedIndexChanged="ddlPrestamoxEstado_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Text="Seleccionar Opcion" Value="0" Selected="True"></asp:ListItem>

            </asp:DropDownList>

        </div>


        <div class="btn-group" role="group">
            <asp:LinkButton ID="btnBuscarSocio" CssClass="btn btn-info" Width="" runat="server" OnClick="btnBuscarSocio_Click" Text="Enviar"> <span class="glyphicon glyphicon-search" aria-hidden="true"  style="color:white"></span> 
            </asp:LinkButton>

            <asp:LinkButton Style="margin-left: 50px" ID="btnBorrar" CssClass="btn btn-warning" Width="" runat="server" OnClick="btnBorrar_Click" Text="Enviar"> <span class="glyphicon glyphicon-erase" aria-hidden="true" style="color:white"></span>
            </asp:LinkButton>

        </div>
        <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

        <section style="padding: 20px;"></section>

        <div style="margin-left: 50px">
            <asp:GridView ID="gv_Tabla_Consuktar_Prestamo" runat="server" OnRowCommand="gv_Tabla_Consuktar_Prestamo_RowCommand" OnPageIndexChanging="gv_Tabla_Consuktar_Prestamo_PageIndexChanging" EmptyDataText="No se encontraron datos" CssClass="table-condensed table-hover" Width="98%" AutoGenerateColumns="False" GridLines="None" OnDataBound="gv_Tabla_Consuktar_Prestamo_DataBound" OnRowDataBound="gv_Tabla_Consuktar_Prestamo_RowDataBound" AllowSorting="true" OnSorting="gv_Tabla_Consuktar_Prestamo_Sorting">
                <Columns>
                    <asp:BoundField DataField="PK_IPre_Cod" HeaderText="N° Prestamo" />
                    <asp:BoundField DataField="FechaRegistro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" SortExpression="FechaRegistro">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="VTP_Nombre" HeaderText="Tipo Prestamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Importe" HeaderText="Importe" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="NumeroCuotas" HeaderText="Numero Cuotas" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="FPre_Tasa_Mensual" HeaderText="Tasa Mensual" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="FPre_Tcea" HeaderText="TCEA" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="IS_Dni" HeaderText="DNI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="DatosSocio" HeaderText="Datos De Socio" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="EstadoDePrestamo" HeaderText="Estado Prestamo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center" Font-Bold="true"></ItemStyle>
                    </asp:BoundField>

                </Columns>

                <HeaderStyle BackColor="#008080" ForeColor="white" Font-Bold="true" />
            </asp:GridView>
        </div>
        <script src="js/sweetalert.js"></script>
        <script>
            function DNInoencontrado() {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'No se Encontraron datos',
                    showConfirmButton: false,
                    timer: 2000
                })
            }
        </script>
</asp:Content>

