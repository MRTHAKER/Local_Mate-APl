<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="java.util.*"%>
<%
if(request.getParameterMap().containsKey("gg")){
try{
String url="jdbc:mysql://localhost:3306/local_mate";
	String uname="root";
	String pass="Sumo@123";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection(url,uname,pass);
String email=request.getParameter("gg");
Statement st=con.createStatement();
String sql="select image from image where email='"+email+"'";
ResultSet rs=st.executeQuery(sql);
JSONObject obj=new JSONObject();
if(rs.next()==false){
	obj.put("done", new Boolean(false));
	out.println(obj);
}else{
rs.beforeFirst();
int i=0;
rs.next();
obj.put("string",rs.getString(1));
out.println(obj);
}
}
catch(Exception e){}
}
else{
JSONObject obj;
String email=request.getParameter("e");
try{
	String url="jdbc:mysql://localhost:3306/local_mate";
	String uname="root";
	String pass="Sumo@123";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection(url,uname,pass);
	Statement st=con.createStatement();
	String sql="select image from image where email='"+email+"'";
	ResultSet rs=st.executeQuery(sql);
	obj=new JSONObject();
	if(rs.next()==false){
	PreparedStatement ps=con.prepareStatement("insert into image values(?,?)");
	ps.setString(1,request.getParameter("i"));
	ps.setString(2,email);
	int k=ps.executeUpdate();
	obj = new JSONObject();
	if(k>0){
	obj.put("done", new Boolean(true));
	}
	else{
	obj.put("done", new Boolean(false));
       }
	
}else{
	PreparedStatement ps=con.prepareStatement("update image set image=? where email=?");
	ps.setString(1,request.getParameter("i"));
	ps.setString(2,email);
	int k=ps.executeUpdate();
	obj = new JSONObject();
	if(k>0){
	obj.put("done", new Boolean(true));
	}
	else{
	obj.put("done", new Boolean(false));
       }
	out.println(obj);
}
}
catch(Exception e){}
}
%>
                
