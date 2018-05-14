<%-- 
    Document   : sacaFactura
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
        <title>Sacar factura</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", "root"); //el espacio de la contraseña está vacío
            Statement s = conexion.createStatement();
            ResultSet listado = s.executeQuery("SELECT * FROM Det_Factura");

            request.setCharacterEncoding("UTF-8");
            // Comprueba la existencia del código de factura introducido
            String consultaCodFacturas = "SELECT * FROM Det_Factura WHERE CodDetFact="
                    + Integer.valueOf(request.getParameter("CodDetFact"));

            ResultSet numeroDeFacturas = s.executeQuery(consultaCodFacturas);
            numeroDeFacturas.last();

            if (numeroDeFacturas.getRow() != 0) {
                out.println("Lo siento, no se ha podido dar de alta, ya existe una factura con el código "
                        + request.getParameter("CodDetFact") + ".");
            } else {
                String insercion = "INSERT INTO Det_Factura VALUES (" + Integer.valueOf(request.getParameter("CodDetFact"))
                        + "," + Integer.valueOf(request.getParameter("CodVideojuegos"))
                        + "," + Integer.valueOf(request.getParameter("Cantidad"))
                        + "," + Double.valueOf(request.getParameter("Precio"))//cambios para introducir decimales
                        + "," + Integer.valueOf(request.getParameter("Factura_idFactura")) + ")";
                s.execute(insercion);
                out.println("Factura creada correctamente.");
            }
            conexion.close();
        %>
        <br>
        <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>document.location = "facturas.jsp"</script>
</body>
</html>