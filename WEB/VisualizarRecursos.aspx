<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Docente.master" AutoEventWireup="true" CodeFile="VisualizarRecursos.aspx.cs" Inherits="VisualizarRecursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
        }

        /* Card container */
        .card-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        /* Individual card */
        .card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            width: 300px;
            padding: 15px;
            transition: transform 0.3s ease;
        }

            .card:hover {
                transform: translateY(-10px);
            }

            .card img {
                width: 100%;
                border-radius: 10px;
            }

            .card h3 {
                color: #1a2cc5;
                margin: 15px 0 10px;
                font-size: 1.2em;
            }

            .card p {
                color: #666;
                font-size: 0.9em;
                line-height: 1.5;
                margin: 0 0 10px;
            }

        .price {
            display: block;
            font-size: 1.2em;
            font-weight: bold;
            color: #000;
            margin-bottom: 10px;
        }

        button {
            background-color: #1a2cc5;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            button:hover {
                background-color: #0f1d8b;
            }
        /* Estilos para el botón */
        .card-button {
            background-color: #1a2cc5; /* Color de fondo */
            color: #fff; /* Color de texto */
            border: none; /* Sin borde */
            padding: 10px 20px; /* Relleno alrededor del texto */
            font-size: 1em; /* Tamaño de la fuente */
            border-radius: 5px; /* Bordes redondeados */
            cursor: pointer; /* Cambia el cursor a mano cuando se pasa sobre el botón */
            transition: background-color 0.3s ease; /* Efecto al pasar el mouse */
        }

            /* Estilo cuando el mouse pasa sobre el botón */
            .card-button:hover {
                background-color: #0f1d8b; /* Color de fondo al pasar el mouse */
            }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

       <h1 style="text-align:center;">Materiales Educativos</h1>
        <p style="text-align:center;">En este espacio encontrarás una variedad de materiales educativos digitales del CAFED para que los utilices dentro y fuera del aula con el fin de 
            fortalecer y dinamizar tus aprendizajes.</p>
       <section id="files-section" style="background-color: #faf8f2; padding: 40px;">
    <h3 style="text-align: center; font-size: 2em; margin-bottom: 20px;">Materiales</h3>
    <div id="CardsContainer" class="card-container" runat="server">
        <!-- El contenido generado dinámicamente se insertará aquí -->
      
    </div>
</section>

</asp:Content>

