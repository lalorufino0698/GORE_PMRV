<%@ Page Title="" Language="C#" MasterPageFile="~/Cajera.master" AutoEventWireup="true" CodeFile="WF_Gestionar_Socios.aspx.cs" Inherits="WF_Gestionar_Socios" %>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section style="padding: 50px;"></section>
    <h3 style="text-align: center; color: black"><b>LISTA DE SOCIOS</b></h3>

    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

    <section style="padding: 20px;"></section>
    <asp:Label ID="txtcodSocioGrid" runat="server" Text="" Visible="false"></asp:Label>
    <div style="margin-left: 200px">

        <table width="900" border="0" cellpadding="0" cellspacing="0" class="table">
            <tbody>
                <tr>
                    <td class="td_left celda_arriba">Socios Habilitados:</td>
                    <td class="td_right_col2 celda_arriba">

                        <asp:TextBox ID="txtcantidad" runat="server" class="form-control" Width="25%" Height="50%" CssClass="auto-style1" Enabled="false"></asp:TextBox>
            </tbody>
        </table>

        <asp:GridView ID="gv_Tabla_Lista_Socios" runat="server" OnRowCommand="gv_Tabla_Lista_Socios_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Socios_PageIndexChanging" EmptyDataText="No hay Socios afiliados a la Cooperativa" CssClass="table-condensed table-hover" Width="95%" AutoGenerateColumns="False" GridLines="None" OnRowDataBound="gv_Tabla_Lista_Socios_RowDataBound" AllowSorting="true" OnSorting="gv_Tabla_Lista_Socios_Sorting" >
            <columns>
                <asp:BoundField DataField="PK_IS_Cod" HeaderText="N°" />
                <asp:BoundField DataField="DS_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}" SortExpression="DS_Fecha_Registro">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="IS_Dni" HeaderText="DNI" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" >
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="VS_Nombre_Completo" HeaderText="Nombre Completo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VS_Apellido_Paterno" HeaderText="Apellido Paterno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VS_Apellido_Materno" HeaderText="Apellido Materno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="DS_Fecha_Nacimiento" HeaderText="Fecha Nacimiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="VESocio_Estado_Socio" HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>


                <asp:TemplateField HeaderText="Opciones" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <itemtemplate>


                        <asp:LinkButton ID="btnSuspender" CssClass="btn btn-danger" runat="server" CommandName="Suspender" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Denegar" Style="color: white">
                            Suspender
                        </asp:LinkButton>
                    </itemtemplate>

                </asp:TemplateField>




            </columns>

            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>

    </div>

    <!-- Alertas -->
    <script src="js/sweetalert.js"></script>

</asp:Content>

