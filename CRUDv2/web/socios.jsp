<%-- 
    Document   : socios
    Author     : adrian.chamorrosilva
--%>
<%@page import="java.util.ArrayList"%>
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
        <title>Gestión de socios</title>
    </head>
    <body>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Gestión de socios</h1>      
                <p>Aquí podrá consultar el listado de socios, modificarlos, insertarlos y eliminarlos</p>
                <p><em>Si se desea editar el DNI, para ello deberá eliminar el socio y volverlo a añadir</em></p>
            </div>
        </div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="videojuegos.jsp">Videojuegos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="facturas.jsp">Facturas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="socios.jsp">Socios</a>
                </li>
            </ul>
            <form method="get" class="form-inline" action="">
                <input class="form-control mr-sm-2" name="b" type="text" placeholder="Buscar">
            </form>
        </nav>  

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", "root");
            Statement s = null;
            ResultSet listado = null;
            s = conexion.createStatement();
            String query = request.getParameter("b");
            String busqueda;
            if (query != null) {
                busqueda = "SELECT * FROM socios WHERE DNI like '%" + query + "%'"
                        + " or nombre like '%" + query + "%'"
                        + " or apellidos like '%" + query + "%'"
                        + " or telefono like '%" + query + "%'"
                        + " or email like '%" + query + "%'"
                        + " or asociado like '%" + query + "%'";
            } else {
                busqueda = "select * from socios order by CodSocios asc";
            }
            listado = s.executeQuery(busqueda);
        %>
        <div class="container-fluid">
            <div class="table-responsive">
                <table class="table">
                    <tr><th>CodSocio</th><th>DNI</th><th>Nombre</th><th>Apellidos</th><th>Teléfono</th><th>Email</th><th>Genero</th><th>Dirección</th><th>Asociado</th></tr>
                    <form method="get" action="altaSocio.jsp"> 
                        <tr><td></td>
                            <!--<td><input type="text" name="CodSocios" size="5" required=""></td>-->
                            <td><input type="text" name="DNI" size="7" required=""  pattern="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))"></td><!-- Mejoras-->
                            <td><input type="text" name="Nombre" size="5"></td>
                            <td><input type="text" name="Apellidos" size="5"></td>
                            <td><input type="text" name="Teléfono" size="7" pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"></td> <!-- Mejoras-->
                            <td><input type="email" name="Email" size="18"></td>
                            <td> <div class="form-group">
                                    <select class="form-control" id="gen" name="Genero" size="">
                                        <%
                                            ArrayList<String> genero = new ArrayList();
                                            genero.add("Hombre");
                                            genero.add("Mujer");
                                            genero.add("No Binario");
                                            for (String x : genero) {
                                                out.println("<option>" + x + "</option>");
                                            }
                                        %>
                                    </select>

                                </div></td>
                           <!-- <td><input type="text" name="Genero" size="1"></td>-->
                            <td><input type="text" name="Direccion" size="20"></td>
                            <td><input type="text" name="Asociado" size="20"></td>

                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
                    </form>

                    <%
                        while (listado.next()) {
                            out.println("<tr><td>");
                            out.println(listado.getString("CodSocios") + "</td>");
                            out.println("<td>" + listado.getString("DNI") + "</td>");
                            out.println("<td>" + listado.getString("Nombre") + "</td>");
                            out.println("<td>" + listado.getString("Apellidos") + "</td>");
                            out.println("<td>" + listado.getString("Telefono") + "</td>");
                            out.println("<td>" + listado.getString("Email") + "</td>");
                            out.println("<td>" + listado.getString("Genero") + "</td>");
                            out.println("<td>" + listado.getString("Direccion") + "</td>");
                            out.println("<td>" + listado.getString("Asociado") + "</td>");
                    %>
                    <td>
                        <form method="get" action="editaSocio.jsp"> 
                            <input type="hidden" name="CodSocios" value="<%=listado.getString("CodSocios")%>">
                            <input type="hidden" name="DNI" value="<%=listado.getString("DNI")%>">
                            <input type="hidden" name="Nombre" value="<%=listado.getString("Nombre")%>">
                            <input type="hidden" name="Apellidos" value="<%=listado.getString("Apellidos")%>">
                            <input type="hidden" name="Telefono" value="<%=listado.getString("Telefono")%>">
                            <input type="hidden" name="Email" value="<%=listado.getString("Email")%>">
                            <input type="hidden" name="Genero" value="<%=listado.getString("Genero")%>">
                            <input type="hidden" name="Direccion" value="<%=listado.getString("Direccion")%>">
                            <input type="hidden" name="Asociado" value="<%=listado.getString("Asociado")%>">
                            <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Editar</button>

                        </form>
                    </td>

                    <td>
                        <form method="get" action="borraSocio.jsp">
                            <input type="hidden" name="CodSocios" value="<%=listado.getString("CodSocios")%>"/>
                            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                        </form>
                    </td></tr>
                    <%
                        } // while   
                        conexion.close();
                    %>


                </table>
            </div>
        </div>

        <div class="text-center">&copy; Adrián Chamorro Silva</div>

        <!-- Scripts necesarios de bootstrap-->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
