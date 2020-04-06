<%@ page import="java.sql.*"%>
<%@ page session="false" %>
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
String email=request.getParameter("Email");
String location=request.getParameter("Location");
Statement st=con.createStatement();
String sql="select * from location where email='"+email+"'";
ResultSet rs=st.executeQuery(sql);
JSONObject obj;
if(rs.next()==false){
PreparedStatement ps=con.prepareStatement("insert into location values(?,?,?)");
	ps.setString(1,location);
	ps.setString(2,email);
	ps.setInt(3,0);
int k=ps.executeUpdate();
	obj = new JSONObject();
	if(k>0){
	obj.put("done", new Boolean(true));
	}
	else{
	obj.put("error", new Boolean(false));
       }
	out.println(obj);
}else{
PreparedStatement pst=con.prepareStatement("update location set location=? where email=?");
	pst.setString(1,location);
	pst.setString(2,email);
int kk=pst.executeUpdate();
	obj = new JSONObject();
	if(kk>0){
	obj.put("done", new Boolean(true));
	}
	else{
	obj.put("error", new Boolean(false));
       }
	out.println(obj);
}
}
catch(Exception e){}
%>
