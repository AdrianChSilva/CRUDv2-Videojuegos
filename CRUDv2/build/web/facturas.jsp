<%-- 
    Document   : facturas
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
        <title>Gestión de Facturas</title>
    </head>
    <body>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Gestión de Facturas</h1>      
                <p>Aquí podrá consultar el listado de Facturas, sacar una factura y/o eliminarla</p>
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
                <input class="form-control mr-sm-2" name="b" type="text" placeholder=" Buscar por: idFactura o CodDetFact">
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
                busqueda = "SELECT * FROM det_factura inner join videojuegos on det_factura.CodVideojuegos = videojuegos.CodVideojuegos WHERE Factura_idFactura like '%" + query + "%'"
                        + " or CodVideojuegos like '%" + query + "%' ";
            } else {
                busqueda = "select * from det_factura inner join videojuegos on det_factura.CodVideojuegos = videojuegos.CodVideojuegos order by CodDetFact asc";
            }
            listado = s.executeQuery(busqueda);
        %>
        <div class="container-fluid">
            <div class="table-responsive">
                <table class="table">
                    <tr><th>CodDetFact</th><th>CodVideojuegos</th><th>Titulo</th><th>Cantidad</th><th>Precio</th><th>Factura_idFactura</th></tr>
                    <form method="get" action="sacaFactura.jsp"> 
                        <tr><td><input type="number" name="CodDetFact" size="5" required=""></td>
                            <td><input type="number" name="CodVideojuegos" size="7" required=""></td>
                            <td></td>
                            <td><input type="number" name="Cantidad" size="5" required=""></td>
                            <td><input type="number" name="Precio" size="5" required=""></td>
                            <!--CAMBIOS DE LA VERSIÓN CRUD 2.0 ARRAYLIST-->
                            <td> <div class="form-group">
                                    <select class="form-control" id="sel1" name="Factura_idFactura">
                                        <%
                                            /**
                                             * Con esto sacaremos las facturas que se encuentren dentro de la BD.
                                             * No hay que confundir entre Factura y el detalle factura.
                                             * Lo que se muestra realmente en ésta página es la tabla de muchos
                                             * a muchos; detalleFactura. La pk de ésta tabla son los detalles que hay
                                             * DENTRO de una factura. Para que se entienda mejor: emula lo que es el
                                             * típico ticket/factura que te dan al finalizar tu compra.
                                             * 
                                             * Por ello, una factura tiene varios detalles. Esto es porque un cliente
                                             * al comprar genera una factura y en su carro de la compra hay varios productos
                                             * los cuales son los detalles de la factura.
                                             * 
                                             * Entonces, usamos una sentencia sql para obtener las distintas (pk) facturas
                                             * y la almacenamos en un arrayList, que luego se mostrará en un desplegable 
                                             * a la hora de añadir/modificar una factura. Ésto ayudará al usuario ya que éste
                                             * puede no conocer las (pk) facturas que hay dentro de la BD.
                                             */
                                            Class.forName("com.mysql.jdbc.Driver");
                                            s = conexion.createStatement();
                                            int facturas;
                                            String sql;
                                            ArrayList<String> idFactura = new ArrayList();
                                            sql = "select idFactura from factura order by idFactura asc";
                                            ResultSet listaFac = null;
                                            listaFac = s.executeQuery(sql);
                                            while (listaFac.next()) {
                                                idFactura.add(listaFac.getString("idFactura"));
                                            }
                                            for (String x : idFactura) {
                                                out.println("<option>" + x + "</option>");
                                            }

                                        %>
                                    </select>
                                </div></td>
                            <!---------------------------------------------------------->
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
                    </form>
                    <%      while (listado.next()) {
                            out.println("<tr><td>");
                            out.println(listado.getString("CodDetFact") + "</td>");
                            out.println("<td>" + listado.getString("CodVideojuegos") + "</td>");
                            out.println("<td>" + listado.getString("titulo") + "</td>");
                            out.println("<td>" + listado.getString("Cantidad") + "</td>");
                            out.println("<td>" + listado.getString("Precio") + "</td>");
                            out.println("<td>" + listado.getString("Factura_idFactura") + "</td>");
                    %>

                    <td>
                        <form method="get" action="borraFactura.jsp">
                            <input type="hidden" name="CodDetFact" value="<%=listado.getString("CodDetFact")%>"/>
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
