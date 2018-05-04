<%-- 
    Document   : editaVideojuegoModificado
    Author     : Adrian
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica Videojuegos</title>
    </head>
    <body>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", "");//usuario y contraseña que tengas en tu servidor
          Statement s = conexion.createStatement();

          request.setCharacterEncoding("UTF-8");

          String actualizacion = "UPDATE videojuegos SET "
            + " titulo='" + request.getParameter("Titulo")
            + "', plataforma='" + request.getParameter("Plataforma")
            + "', desarrolladora='" + request.getParameter("Desarrolladora")
            + "', publisher='" + request.getParameter("Publisher")
            + "', precio=" + Double.valueOf(request.getParameter("Precio"))//Cambios para introducir decimales
            + ", stock=" + Integer.valueOf(request.getParameter("Stock"))

            + " WHERE CodVideojuegos=" + Integer.valueOf(request.getParameter("CodVideojuegos"));
          s.execute(actualizacion);
          out.println("Videojuego actualizado correctamente.");

          conexion.close();
        %>
        <br>
        <a href="videojuegos.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Volver</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>
