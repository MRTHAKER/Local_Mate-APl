<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%
try{
	String url="jdbc:mysql://localhost:3306/local_mate";
	String uname="root";
	String pass="Sumo@123";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection(url,uname,pass);
	String firstname=request.getParameter("FirstName");
	String lastname=request.getParameter("LastName");
	String email=request.getParameter("Email");
	String gender=request.getParameter("Gender");
	String mobile=request.getParameter("Mobile");
	String userpassword=request.getParameter("Password");
	PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?,?,?)");
	ps.setInt(1,0);
	ps.setString(2,firstname);
	ps.setString(3,lastname);
	ps.setString(4,email);
	ps.setString(5,gender);
	ps.setString(6,mobile);
	ps.setString(7,userpassword);
	int k=ps.executeUpdate();
	JSONObject obj = new JSONObject();
	if(k>0){
	obj.put("done", new Boolean(true));
	}
	else{
	obj.put("error", new Boolean(false));
       }
	out.println(obj);
}
catch(Exception e){}
%>
                
