<%-- 
    Document   : videojuegos
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
        <title>Gestión de Videojuegos</title>
    </head>
    <body>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Gestión de Videojuegos</h1>      
                <p>Aquí podrá consultar el listado de videojuegos, modificarlos, insertarlos y eliminarlos</p>
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
            //En ésta nueva versión hemos incluido un buscador, para que se agilice más la búsqueda
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", "");
            Statement s = null;//conexion.createStatement();
            s = conexion.createStatement();
            ResultSet listado = null;// = s.executeQuery("SELECT * FROM videojuegos");

            String query = request.getParameter("b");
            String busqueda;
            if (query != null) {
                busqueda = "SELECT * FROM videojuegos WHERE titulo like '%" + query + "%'"
                        + " or plataforma like '%" + query + "%'"
                        + " or desarrolladora like '%" + query + "%'"
                        + " or publisher like '%" + query + "%'"
                        + " or precio like '%" + query + "%'"
                        + " or stock like '%" + query + "%'";
            } else {
                busqueda = "select * from videojuegos order by CodVideojuegos asc";
            }
            listado = s.executeQuery(busqueda);
        %>
        <div class="container-fluid">
            <div class="table-responsive">
                <table class="table">
                    <tr><th>CodVideojuegos</th><th>Título</th><th>Plataforma</th><th>Desarrolladora</th><th>Publisher</th><th>Precio</th><th>Stock</th></tr>
                    <form method="get" action="altaVideojuego.jsp"> 
                        <tr><td><input type="text" name="CodVideojuegos" size="5"></td>
                            <td><input type="text" name="Titulo" size="7"></td>
                            <!--CAMBIOS DE LA VERSIÓN CRUD 2.0 ARRAYLIST-->
                            <td> <div class="form-group">
                                    <select class="form-control" id="sel1" name="Plataforma">
                                        <%
                                            ArrayList<String> plataforma = new ArrayList();
                                            plataforma.add("PS4");
                                            plataforma.add("Xbox One");
                                            plataforma.add("Nintendo Switch");
                                            plataforma.add("PC");
                                            for (String n : plataforma) {
                                                out.println("<option>" + n + "</option>");
                                            }
                                        %>
                                    </select>

                                </div></td>
                            <!---------------------------------------------------------->
                            <!--<td><input type="text" name="Plataforma" size="5"></td>-->
                            <td><input type="text" name="Desarrolladora" size="5"></td>
                            <td><input type="text" name="Publisher" size="7"></td>
                            <td><input type="text" name="Precio" size="3"></td>
                            <td><input type="text" name="Stock" size="3"></td>


                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
                    </form>
                    <%
                        while (listado.next()) {
                            out.println("<tr><td>");
                            out.println(listado.getString("CodVideojuegos") + "</td>");
                            out.println("<td>" + listado.getString("titulo") + "</td>");
                            out.println("<td>" + listado.getString("plataforma") + "</td>");
                            out.println("<td>" + listado.getString("desarrolladora") + "</td>");
                            out.println("<td>" + listado.getString("publisher") + "</td>");
                            out.println("<td>" + listado.getString("precio") + "</td>");
                            out.println("<td>" + listado.getString("stock") + "</td>");
                    %>
                    <td>
                        <form method="get" action="editaVideojuego.jsp">
                            <input type="hidden" name="CodVideojuegos" value="<%=listado.getString("CodVideojuegos")%>">
                            <input type="hidden" name="Titulo" value="<%=listado.getString("Titulo")%>">
                            <input type="hidden" name="Plataforma" value="<%=listado.getString("Plataforma")%>">
                            <input type="hidden" name="Desarrolladora" value="<%=listado.getString("Desarrolladora")%>">
                            <input type="hidden" name="Publisher" value="<%=listado.getString("Publisher")%>">
                            <input type="hidden" name="Precio" value="<%=listado.getString("Precio")%>">
                            <input type="hidden" name="Stock" value="<%=listado.getString("Stock")%>">
                            <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Editar</button>

                        </form>
                    </td>

                    <td>
                        <form method="get" action="borraVideojuego.jsp">
                            <input type="hidden" name="CodVideojuegos" value="<%=listado.getString("CodVideojuegos")%>"/>
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
