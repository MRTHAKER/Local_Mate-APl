<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%
try{
if(request.getParameterMap().containsKey("update"))
{
	String url="jdbc:mysql://localhost:3306/local_mate";
	String uname="root";
	String pass="Sumo@123";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection(url,uname,pass);
	String firstname=request.getParameter("FirstName");
	String lastname=request.getParameter("LastName");
	String email=request.getParameter("Email");
	String mobile=request.getParameter("Mobile");
	PreparedStatement ps=con.prepareStatement("update register set FirstName=?,LastName=?,Email=?,Mobile=? where email=?");
	ps.setString(1,firstname);
	ps.setString(2,lastname);
	ps.setString(3,email);
	ps.setString(4,mobile);
	ps.setString(5,email);
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
else if(request.getParameterMap().containsKey("display")){
String url="jdbc:mysql://localhost:3306/local_mate";
String uname="root";
String pass="Sumo@123";
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection(url,uname,pass);
String email=request.getParameter("display");
Statement st=con.createStatement();
String sql="select FirstName,LastName,Email,Gender,Mobile from register where email='"+email+"'";
ResultSet rs=st.executeQuery(sql);
JSONObject obj=new JSONObject();
if(rs.next()==false){
	obj.put("done", new Boolean(false));
	out.println(obj);
}else{
obj.put("done", new Boolean(true));
rs.beforeFirst();
rs.next();
obj.put("FirstName",rs.getString(rs.findColumn("FirstName")));
obj.put("LastName",rs.getString(rs.findColumn("LastName")));
obj.put("Email",rs.getString(rs.findColumn("Email")));
obj.put("Gender",rs.getString(rs.findColumn("Gender")));
obj.put("Mobile",rs.getString(rs.findColumn("Mobile")));
out.println(obj);
}
}
else{
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
	PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?,?,?,?)");
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
}
catch(Exception e){out.print(e);}
%>
                
