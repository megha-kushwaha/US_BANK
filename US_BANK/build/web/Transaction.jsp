<%-- 
    Document   : Transaction
    Created on : 19 Aug, 2021, 4:30:19 PM
    Author     : hp
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
    
<jsp:include page="nav.jsp" />
        
    <center> <h1 class="mt-5 ">Transaction</h1></center>
        <div class="container" Style="margin-top: 10rem;">
        <div class="card-deck">
            <div class="card bg-primary">
              <div class="card-body text-center">
                
                  <%
                      Class.forName("com.mysql.jdbc.Driver");  
                      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usbank","root","");  
                      String id= request.getParameter("id");
                      
                      PreparedStatement pst =con.prepareStatement("select * from customer where id = ?");
                      pst.setString(1,id);
                      ResultSet rs=pst.executeQuery(); 
                      while(rs.next()){
                     
                  %>
                  
                  <label>NAME :&nbsp;&nbsp; </label>  <%=rs.getString(2)%><br>
       
                  <label>EMAIL :&nbsp;&nbsp; </label><%=rs.getString(3)%><br>
                  <label>CURRENT BALANCE :&nbsp;&nbsp; </label><%=rs.getString(5)%><br>
                  
                  <%     
                      }
                  %>
                
                  
              </div>
            </div>
                  
            <div class="card bg-warning">
              <div class="card-body text-center">
               
                  <form action="#" method="post" onsubmit="myFunction()">
                    <div class="form-group">
                      <label for="name">Select Name:</label>
                       <select class="form-control" name="receivername" >
                             <%
                            Class.forName("com.mysql.jdbc.Driver");  
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usbank","root","");  
                            pst =con.prepareStatement("select Name from customer");
                            rs=pst.executeQuery(); 
                            %>
                            <option value=""></option>
                            <%
                            while(rs.next()){

                        %> 
                        <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                       <%
                         }
                       %>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="Amt">Amount:</label>
                      <input type="number" class="form-control" placeholder="enter amount.." name="Amt" >
                    </div>
                      <input type="submit" class="btn btn-primary" value="Send" name="submit"onClick="window.location.reload();">
                  </form>
                </div>
            </div>
        </div>
                      <br><br>
                      <center><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myThistory">View Transaction History</button></center>
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
                              Statement stmt=con.createStatement();  
                              rs=stmt.executeQuery("select * from transaction_history");  
                              while(rs.next())  
                              {
                                String ids =rs.getString(1);
                                
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
                       
                        <%
                            if(request.getParameter("submit")!=null){
                       
                            String receiver =request.getParameter("receivername");
                            int amount = Integer.parseInt(request.getParameter("Amt"));
                            Class.forName("com.mysql.jdbc.Driver");  
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usbank","root","");
                            Calendar calendar = Calendar.getInstance();
                            java.sql.Timestamp startDate = new Timestamp(calendar.getTime().getTime());
                            
                            pst =con.prepareStatement("select * from customer where id = ?");
                            String sender="";
                            int SAmt=0;
                            pst.setString(1,id);
                            rs=pst.executeQuery(); 
                            while(rs.next()){
                            sender=rs.getString(2);SAmt=rs.getInt(5);
                             }
                                 
                             int Amt=SAmt-amount;
                             
                               pst =con.prepareStatement("update customer set Current_Balance=? where id = ?");
                               pst.setInt(1,Amt);
                           pst.setString(2,id);
                           
                           pst.executeUpdate();
                           
                           
                             pst= con.prepareStatement("insert into transaction_history(Sender,Receiver,DateTime,Amount) values(?,?,?,?)");
                             pst.setString(1,sender);
                             pst.setString(2,receiver);
                             pst.setTimestamp(3,startDate);
                             pst.setInt(4,amount);
                             pst.executeUpdate();
                            
                           con.close();
                            
                             
                            }
                            
                            
                         

                       %> 
                  
                      
                       
                       
    </body>
</html>
