<%-- 
    Document   : index
    Author     : adrian.chamorrosilva
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <title>Gestion - Pag Principal</title>
    </head>
    <body>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Gestión de socios, videojuegos y facturas</h1>      
                <p>Pinche en algun boton según la acción deseada</p>
            </div>
        </div>


        <div class="container-fluid">
            <br></br>
            
            <button  type="button" class="btn btn-primary btn-lg btn-block"  onclick="location.href = 'socios.jsp';">Socios</button>
            <br></br>
            <button type="button" class="btn btn-success btn-lg btn-block" onclick="location.href = 'videojuegos.jsp';" >Videojuegos</button>
            <br></br>
            <button type="button" class="btn btn-warning btn-lg btn-block" onclick="location.href = 'facturas.jsp';">Facturas</button>
            <br></br>

        </div>
         <div class="text-center">&copy; Adrián Chamorro Silva</div>
        <!-- Scripts necesarios de bootstrap-->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
