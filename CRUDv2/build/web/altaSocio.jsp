<%-- 
    Document   : altaSocio
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de socios</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", ""); //el espacio de la contraseña puede estar vacío. En cualquier caso la contraseña es root
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery("SELECT * FROM socios");

            request.setCharacterEncoding("UTF-8");

            // Comprueba la existencia del número de socio introducido
            String consultaCodSocio = "SELECT * FROM socios WHERE CodSocios="
                    + Integer.valueOf(request.getParameter("CodSocios"));

            ResultSet numeroDeSocios = s.executeQuery(consultaCodSocio);
            numeroDeSocios.last();

            if (numeroDeSocios.getRow() != 0) {
                out.println("Lo siento, no se ha podido dar de alta, ya existe un socio con el código "
                        + request.getParameter("CodSocios") + ".");
            } else {
                String insercion = "INSERT INTO socios VALUES (" + Integer.valueOf(request.getParameter("CodSocios"))
                        + ", '" + request.getParameter("DNI") + "', '"
                        + request.getParameter("Nombre")
                        + "', '" + request.getParameter("Apellidos")
                        + "', '" + request.getParameter("Teléfono")
                        + "', '" + request.getParameter("Email")
                        + "', '" + request.getParameter("Genero")
                        + "', '" + request.getParameter("Direccion")
                        + "', '" + request.getParameter("Asociado") + "')";
                s.execute(insercion);
                out.println("Socio dado de alta correctamente.");
            }
            conexion.close();
        %>
        <br>
        <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>document.location = "socios.jsp"</script>
</body>
</html>
