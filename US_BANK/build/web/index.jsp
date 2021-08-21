
  
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
        
        <jsp:include page="nav.jsp" />
        
        
        <div id="back">
        <div class="line1"></div>
        <div class="line2"></div>
      <div id="content" style="background-image:url('img/saving_ac_bg_v2.png');background-size: cover;">
         
          <div id="rect" class="d-flex flex-column flex-wrap align-content-center p-5 mt-4">
         
              <button type="button" class="btn btn-outline-info mt-5" data-toggle="modal" data-target="#myModal">OUR CUSTOMERS</button>
              <button type="button" class="btn btn-outline-info" data-toggle="modal" data-target="#myThistory">TRANSFER HISTORY</button>
            
          </div>
          </div>
      </div>
      
      <!-- Customer table-->
   

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">CUSTOMER LIST</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">


                    <table class="table table-hover table-bordered ">
                    <thead class="thead-dark">
                      <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact NO.</th>
                        <th>Current Balance</th>
                        <th>Operation</th>
                      </tr>
                    </thead>
                    <tbody>
                           <%

                             Class.forName("com.mysql.jdbc.Driver");  
                             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usbank","root","");  
                             Statement stmt=con.createStatement();  
                             ResultSet rs=stmt.executeQuery("select * from customer");  
                              while(rs.next())  
                              {
                                String id =rs.getString(1);
                        %>

                                  <tr>
                                    <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td><a href="Transaction.jsp?id=<%=id%>"><button type="button" class="btn btn-warning">Transact</button></a></td>
                                   
                                  </tr>
                     <%
                          }
                     %>
                    </tbody></div>
                  </table>


            
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
   

  <!-- The Modal -->
  <div class="modal fade" id="myThistory">
    <div class="modal-dialog modal-lg modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">TRANSACTION HISTORY</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">


                    <table class="table table-hover table-bordered ">
                    <thead class="thead-dark">
                      <tr>
                        <th>SENDER Name</th>
                        <th>RECEIVER Name</th>
                        <th>DATE & TIME</th>
                        <th>AMOUNT</th>
                      </tr>
                    </thead>
                    <tbody>
                           <%

                             Class.forName("com.mysql.jdbc.Driver");  
                              con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usbank","root","");  
                              stmt=con.createStatement();  
                              rs=stmt.executeQuery("select * from transaction_history");  
                              while(rs.next())  
                              {
                                String id =rs.getString(1);
                        %>

                                  <tr>
                                    <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                  
                                  </tr>
                     <%
                          }
                     %>
                    </tbody></div>
                  </table>


            
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
    </body>
</html>
