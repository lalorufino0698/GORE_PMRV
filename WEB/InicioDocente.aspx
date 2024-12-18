<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Docente.master" AutoEventWireup="true" CodeFile="InicioDocente.aspx.cs" Inherits="InicioDocente" %>

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
            grid-template-columns: repeat(5, 1fr); /* Define 4 columnas iguales */
            gap: 20px; /* Espaciado entre las tarjetas */
            width: 100%;
            max-width: 1400px;
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
                    color: #97599e;
                    border: 1px solid #97599e;
                    border-radius: 4px; 
                    transition: all 400ms ease;
                    margin-bottom: 5px;
                }

                    .card .contenido-card a:hover {
                        background: #97599e;
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
        <h1 style="font-size:50px">Tenemos para ti</h1>
    </div>
    <div style="padding:40px"></div>
    <div class="container-card">
        <div class="card">
            <figure>
                <img
                    src="img/gore_img/introd.png" class="img-rectangle" />
            </figure>
            <div class="contenido-card">
                <h3>Introducción</h3>
                <p style="text-align: center;">
                    En esta sección, te damos la bienvenida a nuestro sitio web dedicado a la educación inclusiva. Aquí encontrarás una visión general sobre la importancia de la inclusión en el ámbito educativo.
                </p>
                <a href="#">Ingresar  aquí </a>
            </div>
        </div>
        <div class="card">
            <figure>
                <img
                    src="img/gore_img/recursos-remove.png" height ="200" />
            </figure> 
            <div class="contenido-card">
                <h3>Recursos y Materiales</h3>
                <p style="text-align: center;">
                    Explora una variedad de recursos y materiales didácticos diseñados para apoyar la educación inclusiva. 
                    Aquí encontrarás guías, plantillas, materiales adaptados, herramientas tecnológicas y contenidos multimedia.
                </p>
                <a href="VisualizarRecursos.aspx">Ingresar  aquí </a>
            </div>
        </div>
        <div class="card">
            <figure>
                <img
                    src="img/gore_img/practicas-remove.png" />
            </figure>
            <div class="contenido-card">
                <h3>Prácticas Inclusivas</h3>
                <p style="text-align:center">
                    En esta sección, compartimos estrategias y buenas prácticas inclusivas que puedes implementar en tu aula.
                    Descubre enfoques metodológicos, técnicas pedagógicas y ejemplos concretos.
                </p>
                <a href="#">Ingresar  aquí </a>
            </div>
        </div>
        <div class="card">
            <figure>
                <img
                    src="img/gore_img/evaluacion-remove.png" />
            </figure>
            <div class="contenido-card">
                <h3>Evaluación Auténtica</h3>
                <p style="text-align: center;">
                    La evaluación auténtica es clave para medir el progreso de los estudiantes en un entorno inclusivo. 
                    Aquí encontrarás enfoques de evaluación flexibles y personalizados que consideran las diversas capacidades y estilos de aprendizaje de los alumnos.
                </p>
                <a href="#">Ingresar  aquí </a>
            </div>
        </div>
        <div class="card">
            <figure>
                <img                                               
                    src="img/gore_img/foro-remove.png" />
            </figure>                       
            <div class="contenido-card">
                <h3>Foro o Comunidad</h3>
                <p style="text-align:  center;">
                    Únete a nuestra comunidad educativa en este espacio de diálogo y colaboración. 
                    Comparte experiencias, ideas, preguntas y recursos con otros educadores, expertos y familias que trabajan en pro de la educación inclusiva.
                </p>
                <a href="#">Ingresar  aquí </a>
            </div>
        </div>
   
     


    </div>
</asp:Content>

