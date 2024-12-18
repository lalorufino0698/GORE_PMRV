<%@ Page Title="" Language="C#" MasterPageFile="~/GerenteGeneral.master" AutoEventWireup="true" CodeFile="WF_Listar_Solicitud_Denegadas.aspx.cs" Inherits="WF_Listar_Solicitud_Denegadas" %>

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
    <script src="scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section style="padding: 50px;"></section>
    <h3 style="text-align: center; color: black"><b>LISTA DE SOLICITUDES DENEGADAS</b></h3>
    <asp:Label ID="txtCorreo" runat="server" Text="" Visible="false"></asp:Label>
    <%--registro de socio--%>
    <asp:Label ID="txtdni" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtdnisocio" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtnombrecompleto" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtApaterno" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtAmaterno" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtfechaNacimiento" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtfechaRegistro" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtFKsol" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="txtfksocio" runat="server" Text="" Visible="true"></asp:Label>
    <asp:Label ID="txtcodsolDenegada" runat="server" Text="" Visible="true"></asp:Label>

  <script type="text/javascript">
      var dataFound = false; // Declarar la variable a nivel global
      function Search_Gridview(strKey) {
          var strData = strKey.value.toLowerCase().split(" ");
          var tblData = document.getElementById('<%= gv_Tabla_Lista_Solicitud_Denegada.ClientID %>');
          for (var i = 1; i < tblData.rows.length; i++) {
              var rowData = tblData.rows[i].innerHTML;
              var styleDisplay = 'none';
              for (var j = 0; j < strData.length; j++) {
                  if (rowData.toLowerCase().indexOf(strData[j]) >= 0) {
                      styleDisplay = '';
                      dataFound = true;
                  } else {
                      styleDisplay = 'none';
                      break;
                  }
              }
              tblData.rows[i].style.display = styleDisplay;
          }
      }
      function HandleEnterKey(event) {
          console.log("HandleEnterKey called");
          if (event.keyCode === 13) {
              event.preventDefault();
              var txtFillter = document.getElementById('<%= txtFillter.ClientID %>');
                Search_Gridview(txtFillter);
                var noDataMessage = document.getElementById('noDataMessage'); // Obtener el elemento por ID
                noDataMessage.style.display = dataFound ? 'none' : 'block';
            }
        }
      $(document).ready(function () {
          $("#search").click(function () {
              var txtFillter = document.getElementById('<%= txtFillter.ClientID %>');
                Search_Gridview(txtFillter);
                var noDataMessage = document.getElementById('noDataMessage'); // Obtener el elemento por ID
                noDataMessage.style.display = dataFound ? 'none' : 'block';
            });
      });
  </script>


     <div class="field" id="searchform">
        <asp:TextBox placeholder="Ingresar elemento a buscar" ID="txtFillter" runat="server" onkeydown="HandleEnterKey(event)" />
        <button type="button" id="search">Buscar</button>
    </div>
    <section style="padding: 20px;"></section>

    <div style="margin-left: 50px">
        <asp:GridView ID="gv_Tabla_Lista_Solicitud_Denegada" runat="server" OnRowCommand="gv_Tabla_Lista_Solicitud_Denegada_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Solicitud_Denegada_PageIndexChanging" EmptyDataText="No hay Solicitudes Denegadas" CssClass="table-condensed table-hover" Width="90%" AutoGenerateColumns="False" GridLines="None" OnDataBound="gv_Tabla_Lista_Solicitud_Denegada_DataBound" OnRowDataBound="gv_Tabla_Lista_Solicitud_Denegada_RowDataBound">
            <columns>
                <asp:BoundField DataField="PK_ISol_Cod" HeaderText="N°" />
                <asp:BoundField DataField="ISol_Dni" HeaderText="Dni" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
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


                <asp:BoundField DataField="DSol_Fecha_Nacimiento" HeaderText="Fecha Nacimiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="DSol_Fecha_Registro" HeaderText="Fecha Registro" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VSol_Direccion" HeaderText="Direccion" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VSol_Correo" HeaderText="Correo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>

                <asp:BoundField DataField="ISol_Celular" HeaderText="Celular" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="ISol_Telefono_Fijo" HeaderText="Telefono" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>

                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>
                <asp:BoundField DataField="VEsol_Estado_Solicitud" HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <headerstyle cssclass="text-center"></headerstyle>
                    <itemstyle cssclass="text-center" font-bold="true"></itemstyle>
                </asp:BoundField>


                <asp:TemplateField HeaderText="Ver" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                    <itemtemplate>
                        <asp:LinkButton ID="btnver" CssClass="btn btn-info" runat="server" CommandName="Ver" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Ver" Style="color: white">
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>

                        </asp:LinkButton>
                    </itemtemplate>
                </asp:TemplateField>
            </columns>
            <headerstyle backcolor="#008080" forecolor="white" font-bold="true" />
        </asp:GridView>
</div>

    <div id="noDataMessage" style="display: none; text-align: center">
        <h1>No se encontraron datos.</h1>
    </div>
       <!-- Alertas -->
    <script src="js/sweetalert.js"></script>
    <script>
        function temporizador() {

            const Toast = Swal.mixin({
                toast: true,
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                onOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })
            Toast.fire({
                icon: 'success',
                title: '¡Mensaje enviado con exito! Revise su bandeja de entrada'
            })
        }
        function error() {
            Swal.fire({
                icon: 'error',
                title: 'Uups...',
                text: 'Correo no existente!'
            })
        }
        function correcto() {
            Swal.fire({
                icon: 'success',
                title: 'Correo enviado!',
                text: 'Revise su bandeja de entrada'
            })
        }

    </script>

</asp:Content>

