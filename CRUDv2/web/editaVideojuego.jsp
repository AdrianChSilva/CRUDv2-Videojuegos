<%-- 
    Document   : editaVideojuego
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
    <% request.setCharacterEncoding("UTF-8");%>
    <div class="container-fluid">
        <br><br>
        <div class="panel panel-info">
            <div class="panel-heading text-center">Editar Videojuego</div>
            <form method="get" action="editaVideojuegoModificado.jsp">

                <div class="form-group">
                    <label>&nbsp;&nbsp;Título&nbsp;</label><input type="text" size="7" name="Titulo" value="<%= request.getParameter("Titulo")%>">
                </div>
                <div class="form-group">
                    <label>&nbsp;&nbsp;Plataforma&nbsp;</label><input type="text" size="5" name="Plataforma" value="<%= request.getParameter("Plataforma")%>">
                </div>
                <div class="form-group">
                    <label>&nbsp;&nbsp;Desarrolladora&nbsp;</label><input type="text" size="5" name="Desarrolladora" value="<%= request.getParameter("Desarrolladora")%>">
                </div>
                <div class="form-group">
                    <label>&nbsp;&nbsp;Publisher&nbsp;</label><input type="text" name="Publisher" size="7" value="<%= request.getParameter("Publisher")%>">
                </div>
                <div class="form-group">
                    <label>&nbsp;&nbsp;Precio&nbsp;</label><input type="text" name="Precio" size="20" value="<%= request.getParameter("Precio")%>">
                </div>
                <div class="form-group">
                    <label>&nbsp;&nbsp;Stock&nbsp;</label><input type="text" name="Stock" size="1" value="<%= request.getParameter("Stock")%>">
                </div>
                <hr>
                &nbsp;&nbsp;<a href="videojuegos.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                <input type="hidden" name="CodVideojuegos" value="<%=request.getParameter("CodVideojuegos")%>"/>
            </form>

        </div>
        <div class="text-center">&copy;Adrian Chamorro Silva</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
