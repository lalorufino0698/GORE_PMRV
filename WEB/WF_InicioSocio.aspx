<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Socio.master" AutoEventWireup="true" CodeFile="WF_InicioSocio.aspx.cs" Inherits="WF_InicioSocio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <style>
         @import url("https://fonts.googleapis.com/css?family=Montserrat&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Montserrat", sans-serif;
}
/*Cards*/
.container-card {
  display: grid; /* Usamos grid en lugar de flex para un control más preciso */
  grid-template-columns: repeat(4, 1fr); /* Define 4 columnas iguales */
  gap: 20px; /* Espaciado entre las tarjetas */
  width: 100%;
  max-width: 1100px;
  margin: auto;
}
.title-cards {
  width: 100%;
  max-width: 1080px;
  margin: auto;
  padding: 20px;
  margin-top: 20px;
  text-align: center;
  color: #7a7a7a;
}
.card {
  width: 100%;
  margin: 20px;
  border-radius: 6px;
  overflow: hidden;
  background: #fff;
  box-shadow: 0px 1px 10px rgba(0, 0, 0, 0.2);
  transition: all 400ms ease-out;
  cursor: default;
}
.card:hover {
  box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.4);
  transform: translateY(-3%);
}
.card img {
  width: 100%;
  height: 210px;
}
.card .contenido-card {
  padding: 15px;
  text-align: center;
}
.card .contenido-card h3 {
  margin-bottom: 15px;
  color: #7a7a7a;
}
.card .contenido-card p {
  line-height: 1.8;
  color: #6a6a6a;
  font-size: 14px;
  margin-bottom: 5px;
}
.card .contenido-card a {
  display: inline-block;
  padding: 10px;
  margin-top: 10px;
  text-decoration: none;
  color: #2fb4cc;
  border: 1px solid #2fb4cc;
  border-radius: 4px;
  transition: all 400ms ease;
  margin-bottom: 5px;
}
.card .contenido-card a:hover {
  background: #2fb4cc;
  color: #fff;
}
@media only screen and (min-width: 320px) and (max-width: 768px) {
  .container-card {
    flex-wrap: wrap;
  }
  .card {
    margin: 15px;
  }
}

     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="title-cards">
      <h2>Servicios que Ofrecemos</h2>
    </div>
    <div class="container-card">
      <div class="card">
        <figure>
          <img
            src="https://cdn.pixabay.com/photo/2015/06/24/16/36/office-820390_1280.jpg"
          />
        </figure>
        <div class="contenido-card">
          <h3>Diseño Gràfico</h3>
          <p>
            Podemos crear la identidad corporativa de tu empresa. Diseño ,
            Maquetación de folletos, Catálogos, Papelería y mucho más.
          </p>
          <a href="#">Leer Màs</a>
        </div>
      </div>
      <div class="card">
        <figure>
          <img
            src="https://cdn.pixabay.com/photo/2015/11/05/09/52/touch-screen-1023966_1280.jpg"
          />
        </figure>
        <div class="contenido-card">
          <h3>Gestión de Redes</h3>
          <p>
            Nosotros creamos y optimizamos tus perfiles en las Redes Sociales.
            Importantes para que tu presencia online sea completa.
          </p>
          <a href="#">Leer Màs</a>
        </div>
      </div>
      <div class="card">
        <figure>
          <img
            src="https://cdn.pixabay.com/photo/2021/08/05/12/36/software-development-6523979_1280.jpg"
          />
        </figure>
        <div class="contenido-card">
          <h3>Desarrollo Web</h3>
          <p>
            Creamos tu página web utilizando las últimas tecnologías
            disponibles. Una Web adaptativa a tu móvil o Tablet y con un gestor
            de contenido fácil.
          </p>
          <a href="#">Leer Màs</a>
        </div>
      </div>
        <div class="card">
  <figure>
    <img
      src="https://cdn.pixabay.com/photo/2021/08/05/12/36/software-development-6523979_1280.jpg"
    />
  </figure>
  <div class="contenido-card">
    <h3>Desarrollo Web</h3>
    <p>
      Creamos tu página web utilizando las últimas tecnologías
      disponibles. Una Web adaptativa a tu móvil o Tablet y con un gestor
      de contenido fácil.
    </p>
    <a href="#">Leer Màs</a>
  </div>
</div>
        <div class="card">
  <figure>
    <img
      src="https://cdn.pixabay.com/photo/2021/08/05/12/36/software-development-6523979_1280.jpg"
    />
  </figure>
  <div class="contenido-card">
    <h3>Desarrollo Web</h3>
    <p>
      Creamos tu página web utilizando las últimas tecnologías
      disponibles. Una Web adaptativa a tu móvil o Tablet y con un gestor
      de contenido fácil.
    </p>
    <a href="#">Leer Màs</a>
  </div>
</div>
        <div class="card">
  <figure>
    <img
      src="https://cdn.pixabay.com/photo/2021/08/05/12/36/software-development-6523979_1280.jpg"
    />
  </figure>
  <div class="contenido-card">
    <h3>Desarrollo Web</h3>
    <p>
      Creamos tu página web utilizando las últimas tecnologías
      disponibles. Una Web adaptativa a tu móvil o Tablet y con un gestor
      de contenido fácil.
    </p>
    <a href="#">Leer Màs</a>
  </div>
</div>
        <div class="card">
  <figure>
    <img
      src="https://cdn.pixabay.com/photo/2021/08/05/12/36/software-development-6523979_1280.jpg"
    />
  </figure>
  <div class="contenido-card">
    <h3>Desarrollo Web</h3>
    <p>
      Creamos tu página web utilizando las últimas tecnologías
      disponibles. Una Web adaptativa a tu móvil o Tablet y con un gestor
      de contenido fácil.
    </p>
    <a href="#">Leer Màs</a>
  </div>
</div>
        <div class="card">
  <figure>
    <img
      src="https://cdn.pixabay.com/photo/2021/08/05/12/36/software-development-6523979_1280.jpg"
    />
  </figure>
  <div class="contenido-card">
    <h3>Desarrollo Web</h3>
    <p>
      Creamos tu página web utilizando las últimas tecnologías
      disponibles. Una Web adaptativa a tu móvil o Tablet y con un gestor
      de contenido fácil.
    </p>
    <a href="#">Leer Màs</a>
  </div>
</div>

    </div>
</asp:Content>

