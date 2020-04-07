<%@ page import="java.sql.*"%>
<%@ page session="false" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%
try{
String url="jdbc:mysql://localhost:3306/local_mate";
String uname="root";
String pass="Sumo@123";
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection(url,uname,pass);
String email=request.getParameter("Email");
String location=request.getParameter("Location");
Statement st=con.createStatement();
String sql="select email from location where NOT email='"+email+"' AND location='"+location+"'";
ResultSet rs=st.executeQuery(sql);
JSONObject obj=new JSONObject();
if(rs.next()==false){
	obj.put("done", new Boolean(false));
	out.println(obj);
}else{
JSONArray j=new JSONArray();
obj.put("done", new Boolean(true));
rs.beforeFirst();
int i=0;
while(rs.next()){
j.add(i,rs.getString(1));
i++;
}
obj.put("array",j);
out.println(obj);
}
}
catch(Exception e){}
%>
