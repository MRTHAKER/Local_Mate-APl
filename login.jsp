<%@ page import="java.sql.*"%>
<%@ page session="false" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%
try{
String url="jdbc:mysql://localhost:3306/local_mate";
String uname="root";
String pass="Sumo@123";
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection(url,uname,pass);
String username=request.getParameter("Email");
String userpassword=request.getParameter("Password");
Statement st=con.createStatement();
String sql="select email,password from register where email='"+username+"'";
ResultSet rs=st.executeQuery(sql);
JSONObject obj = new JSONObject();
if(rs.next()==false){
obj.put("done", new Boolean(false));
}
else{
String fromdbuname=rs.getString(1);
String fromdbpass=rs.getString(2);
if(username.equals(fromdbuname) && userpassword.equals(fromdbpass)){
obj.put("done", new Boolean(true));
}
else{
obj.put("done", new Boolean(false));
}
}
out.println(obj);
}
catch(Exception e){}
%>
