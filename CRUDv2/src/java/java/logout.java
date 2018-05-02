/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java;
    import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author adrian.chamorrosilva
 */

public class logout extends HttpServlet{
 
 @Override
 protected void doGet(HttpServletRequest req, HttpServletResponse resp)
   throws ServletException, IOException {
  // TODO Auto-generated method stub
  
  HttpSession session = req.getSession();
  session.invalidate();
  resp.sendRedirect("login.jsp");
 }
}


