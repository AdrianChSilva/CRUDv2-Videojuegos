<%-- 
    Document   : loginAction
    Author     : adrian.chamorrosilva
--%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%

            HashMap<String, String> login = new HashMap();

            login.put("admin", "admin");
            login.put("usuario", "usuario");
            
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("pass");

            if (login.containsKey(usuario)) {
                if (login.get(usuario).equals(contraseña)) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("index.jsp");

                } else {
                    out.println("<div class='alert alert-success' role='alert'>Contraseña incorrecta</div>");
                    out.println("<a href='login.jsp' class='btn btn-primary'><span class='glyphicon glyphicon-home'></span> Volver </button></a>");
                }
            } else {
                out.println("<div class='alert alert-success' role='alert'>El usuario no existe</div>");
                out.println("<a href='login.jsp' class='btn btn-primary'><span class='glyphicon glyphicon-home'></span> Volver </button></a>");
            }
            
            /**
             * Nota: Soy consciente de que se trata de un login "débil", por describirlo de alguna forma.
             * ¿Por qué digo ésto? Porque realmente no es obligatorio logearse para acceder a la aplicación.
             * Si en la barra de direcciones, donde pone http://localhost:8080/CRUDv2/login.jsp , cambiamos
             * "login.jsp" por "videojuegos.jsp" (o cualquier otra clase de la aplicación) accedería sin
             * ningún problema y podría realizar todas las acciones CRUD.
             * 
             * He intentado por todos los medios aplicar un servlet que compruebe que se está logeado en
             * todo momento. Pero ha sido misión casi imposible. Al menos, todos estos dias de ensayo y error
             * me ha servido para aprender mucho acerca de las rutas, logins y servlet.
             * 
             * No obstante, creo que ésto se ciñe a lo exigido para ésta segunda entrega.
             */
        %> 
    </body>
</html>
