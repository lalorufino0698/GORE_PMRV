<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDirector.master" AutoEventWireup="true" CodeFile="PageDirector.aspx.cs" Inherits="PageDirector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
           <div class="right_col" role="main" id="materiales">
               <div class="">
                   <div class="clearfix"></div>
                   <div class="row">

                       <div class="col-md-12 col-sm-12">
                           <div class="x_panel">
                               <h3 style="text-align: center">Registrar Recurso o Material</h3>
                               <div class="x_title">

                                   <ul class="nav navbar-right panel_toolbox">
                                       <li>
                                           <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                       </li>


                                   </ul>
                                   <div class="clearfix"></div>
                               </div>
                               <div class="x_content">

                                   <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3 label-align" style="font-size: 18px">Autor</label>
                                       <div class="col-md-6 col-sm-6">

                                           <asp:TextBox runat="server" CssClass="form-control" ID="autor"></asp:TextBox>
                                       </div>
                                   </div>
                                   <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" style="font-size: 18px">Resumen</label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:TextBox runat="server" class="form-control" ID="resumen" name="resumen"></asp:TextBox>
                                       </div>
                                   </div>
                                   <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" style="font-size: 18px">Tema</label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:TextBox runat="server" class="form-control" ID="tema" name="tema" > </asp:TextBox>
                                       </div>
                                   </div>
                                   <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" style="font-size: 18px">Año</label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:TextBox runat="server" class="form-control" ID="anio" type="datetime" name="anio"></asp:TextBox>
                                       </div>
                                   </div>
                                   <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" style="font-size: 18px">Idioma/Lenguaje </label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:TextBox runat="server" class="form-control" ID="idiomalenguaje" type="text" name="idiomalenguaje"> </asp:TextBox>
                                       </div>
                                   </div>
                                   <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" style="font-size: 18px">Fuente</label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:TextBox runat="server" class="form-control" ID="fuente" type="text" name="fuente" ></asp:TextBox>
                                       </div>
                                   </div>
                                  <%-- <div class="field item form-group">
                                       <label class="col-form-label col-md-3 col-sm-3  label-align" style="font-size: 18px">Nombre del archivo</label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:TextBox runat="server" class="form-control" type="text" ID="nombrearchivo" name="namearchivo" ></asp:TextBox>
                                       </div>
                                   </div>--%>

                                   <div class="field item form-group">
                                       <label for="ftpFileUpload" class="col-form-label col-md-3 col-sm-3 label-align" style="font-size: 18px">
                                           Archivos
                                       </label>
                                       <div class="col-md-6 col-sm-6">
                                           <asp:FileUpload ID="ftpFileUpload" runat="server" />

                                       </div>
                                   </div>
                                   <br />
                                   <div>
                                       <div class="form-group">
                                           <div class="col-md-6 offset-md-3">
                                               <asp:Button class="btn btn-primary" runat="server" ID="Guardar" Text="Guardar" OnClick="Guardar_Click"></asp:Button>
                                               <asp:Button class="btn btn-success" runat="server" ID="Limpiar" Text="Limpiar" OnClick="Limpiar_Click"></asp:Button>
                                           </div>
                                       </div>
                                   </div>

                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
    <script src="js/sweetalert.js"></script>
    <script>

        function autorVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese el autor',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function resumenVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un resumen',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function temaVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un tema',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function anioVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un año',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function idiomaLenguajeVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un idioma/lenguaje',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function fuenteVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese una fuente',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function nombreArchivoVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un nombre de archivo',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function archivoVacia() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Cargue un archivo',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function inicioExitoso() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Bienvenido',
                text: 'Inicio sesion exitosamente',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function contraseñaincorrecta() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'No coincide la contraseña',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function noexisteUsuario() {
            Swal.fire({
                position: 'center',
                icon: 'warning',
                title: 'No existe Usuario',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function registroExitoso() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Se registró exitosamente',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function Director() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Usted, es el Director',
                showConfirmButton: false,
                timer: 1000
            })
        }
        function Docente() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Usted, es el Docente',
                showConfirmButton: false,
                timer: 1000
            })
        }

        function errordatos() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese sus Datos nuevamente',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function Auxiliar() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Usted es el Auxiliar',
                showConfirmButton: false,
                timer: 1000
            })
        }

    </script>


</asp:Content>

