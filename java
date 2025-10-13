AJT
Practica1
A)Create a simple calculator application using servlet.
Index.html
<html>
    <head>
        <title>Calculator App</title>
    </head>
    <body>
<form action="CP" >
 Enter First NumCalculatorServletber <input type="text" name="txtN1" ><br>
 Enter Second Number <input type="text" name="txtN2" ><br>
 Select an Operation
<input type="radio" name="opr" value="+">ADDTION
<input type="radio" name="opr" value="-">SUBSTRACTION
<input type="radio" name="opr" value="*">MULTIPLY
<input type="radio" name="opr" value="/">DIVIDE <br>
<input type="reset">
<input type="submit" value="Calculate" >
</form>
    </body>
</html>

CP.java (servlet)
package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class CP extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Servlet CalculatorServlet</title></head><body>");
double n1 = Double.parseDouble(request.getParameter("txtN1"));
 double n2 = Double.parseDouble(request.getParameter("txtN2"));
 double result =0;
 String opr=request.getParameter("opr");
 if(opr.equals("+")) result=n1+n2; if(opr.equals("-")) result=n1-n2;
 if(opr.equals("*")) result=n1*n2; if(opr.equals("/")) result=n1/n2;
 out.println("<h1> Result = "+result); out.println("</body></html>");}
}


B)Create a servlet for a login page. If the username and password are correct then it says message “Hello <username>” else a message “login failed”
Index.html
<html>
    <head>
        <title>Login Form</title>
    </head>
<form action="LoginPage" >
 Enter User ID<input type="text" name="txtId"><br>
 Enter Password<input type="password" name="txtPass"><br>
<input type="reset">
<input type="submit" value=" Click to Login " >
</form>
</html>

LoginPage.java (Servlet)
package Servlet;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class LoginPage extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Servlet LoginServlet</title></head>");
 String uname = request.getParameter("txtId");
 String upass = request.getParameter("txtPass");
 if(uname.equals("admin") && upass.equals("12345")){
 out.println("<body bgcolor=blue >");
 out.println("<h1> Welcome !!! "+uname+"</h1>");
 }
 else{
 out.println("<body bgcolor=red >");out.println("<h1> Login Fail !!! </h1>");
 }
 out.println("</body></html>");
}

}


C)Create a registration servlet in Java using JDBC. Accept the details such as Username, Password, Email, and Country from the user using HTML Form and store the registration details in the database.

MySql Command from mysql software:- 
1. Select services -> expand databases -> right click on MySQL server at 
localhost:3306[disconnected] -> click on connect -> enter password (tiger) -> 
OK 
2. Again right click on MySQL server at localhost:3306 -> select Create 
database -> enter database name and select the check box to grant permission. 
3. Right click on Table under your daatbase 
4. Enter table name user by replacing untitled. Click on Add column, name -> 
username, type-> varchar, size-> 20, select checkbox of primary key, again click 
on Add column password varchar size 20, again click on Add column emailid 
varchar(20), again click Add column country varchar 10; 
5. add mysql-connector to library folder of the current application

index.html
<html> 
<body> 
<form action="RegistrationServlet" method="post"> 
User name : <input type="text" name="uname"> <br> 
Password : <input type="password" name="pw"><br> 
Email Id : <input type="text" name="email"> <br> 
Country : <select name="coun"> 
<option>select... 
<option> India 
<option> Bangladesh 
<option> Bhutan 
<option> Canada 
</select> <br> 
<input type="submit" value=" Register"> 
</form>
</body> 
</html>

RegistrationServlet.java
import java.io.*; 
import java.sql.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
public class RegistrationServlet extends HttpServlet 
{ public void doPost(HttpServletRequest request, HttpServletResponse response) throws 
IOException, ServletException 
{ Connection con=null; 
PreparedStatement ps=null; 
response.setContentType("text/html"); 
PrintWriter out = response.getWriter(); 
String username=request.getParameter("uname"); 
String password=request.getParameter("pw"); 
String emailid=request.getParameter("email"); 
String country=request.getParameter("coun"); 
try 
{ Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb","root","tiger"); 
out.println("connection done successfully..."); 
ps=con.prepareStatement("insert into user values (?,?,?,?)"); 
ps.setString(1,username); 
ps.setString(2,password); 
ps.setString(3,emailid); 
ps.setString(4,country); 
ps.execute();
out.print("Data insserted successfully!!!!"); 
} 
catch(Exception e) { out.println(e); } 
out.println("<b>"+"<b>"); 
} 
}


Practical 2
A)Using Request Dispatcher Interface create a Servlet which will validate the password entered by the user, if the user has entered "Servlet" as password, then he will be forwarded to Welcome Servlet else the user will stay on the index.html page and an error message will be displayed. 

Index.html
<html>
 <body>
 <form method="post" action="ValidateServlet">
 User Name: <input type="text" name ="un"><br>
 Password: <input type="password" name ="pw"><br>
 <input type="submit" value="Login">
 </form>
 </body>
</html>

ValidateServlet.java (servlet)
    package Servlet;
    import java.io.*;
    import javax.servlet.*;
    import javax.servlet.http.*;
    public class ValidateServlet extends HttpServlet 
    { public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, 
    ServletException
            { res.setContentType("text/html");
    PrintWriter out=res.getWriter(); 
     String username=req.getParameter("un");
    String password=req.getParameter("pw");
     if(password.equals("Servlet"))
     {
     req.setAttribute("s1username",username);
     req.setAttribute("s1password",password); 
     RequestDispatcher rd= req.getRequestDispatcher("/WelcomeServlet");
     rd.forward(req, res);
     }
     else
     { 
     out.print("Incorrect password");
     RequestDispatcher rd= req.getRequestDispatcher("/index.html");
     rd.include(req, res);
     }
     }
}

WelcomeServlet.java (servlet)
package Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class WelcomeServlet extends HttpServlet
{ 
 public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, 
IOException
         {
 res.setContentType("text/html");
 try (PrintWriter out = res.getWriter()) { 
 String s2username = (String)req.getAttribute("s1username"); 
 String s2password = (String)req.getAttribute("s2password"); 
 out.println("Welcome "+s2username); 
 }
}
}

B)Create a servlet that uses Cookies to store the number of times a user has visited servlet.

Index.html
<html>
 <body>
 <form method="post" action="ValidateServlet">
 User Name: <input type="text" name ="un"><br>
 Password: <input type="password" name ="pw"><br>
 <input type="submit" value="Login">
 </form>
 </body>
</html>

Page1.java (servlet)
package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
public class Page1 extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Page1</title></head>");
 out.println("<body bgcolor=pink >");
 String uname = request.getParameter("txtName");
 out.println("<h1>~~~ Welcome "+uname+"</h1>");
 Cookie ck1 = new Cookie("username", uname);
 Cookie ck2 = new Cookie("visit","1");
 response.addCookie(ck1); response.addCookie(ck2);
 out.println("<h1><a href=Page22 >Click to visit Page 22 </a></h1>");
 out.println("</body>");
 out.println("</html>");
 }
 }

Page22.java (servlet)
package Servlet;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class Page22 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Page22</title></head>");
 out.println("<body bgcolor=yellow >");
 Cookie [] ck = request.getCookies();
 for(int i=0;i<ck.length;i++){
 if(ck[i].getName().equals("visit")){
 int count = Integer.parseInt(ck[i].getValue())+1;
 out.println("<h1>Visit No : "+count+"</h1>");
 ck[i] = new Cookie("visit",count+"");
 response.addCookie(ck[i]);
 }
else {
 out.println(ck[i].getName()+ " = "+ck[i].getValue()); }
 out.println("<h1><a href=Page33 >Click to visit Page 3 </a></h1>");
 out.println("<h1><a href=Page44 >Click to visit Page 4 </a></h1>");
 out.println("<h1><a href=Page5 >Click to visit Page 5 </a></h1>");
 out.println("</body>");
 out.println("</html>");
 } }

}

Page33.java (servlet)
package Servlet;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class Page33 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Page33</title></head>");
 out.println("<body bgcolor=yellow >");
 Cookie [] ck = request.getCookies();
 for(int i=0;i<ck.length;i++){
 if(ck[i].getName().equals("visit")){
 int count = Integer.parseInt(ck[i].getValue())+1;
 out.println("<h1>Visit No : "+count+"</h1>");
 ck[i] = new Cookie("visit",count+"");
 response.addCookie(ck[i]);
 }
else {
 out.println(ck[i].getName()+ " = "+ck[i].getValue()); }
 out.println("<h1><a href=Page33 >Click to visit Page 3 </a></h1>");
 out.println("<h1><a href=Page44 >Click to visit Page 4 </a></h1>");
 out.println("<h1><a href=Page5 >Click to visit Page 5 </a></h1>");
 out.println("</body>");
 out.println("</html>");
 } }

}

Page44.java (servlet)
package Servlet;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class Page44 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Page44</title></head>");
 out.println("<body bgcolor=yellow >");
 Cookie [] ck = request.getCookies();
 for(int i=0;i<ck.length;i++){
 if(ck[i].getName().equals("visit")){
 int count = Integer.parseInt(ck[i].getValue())+1;
 out.println("<h1>Visit No : "+count+"</h1>");
 ck[i] = new Cookie("visit",count+"");
 response.addCookie(ck[i]);
 }
else {
 out.println(ck[i].getName()+ " = "+ck[i].getValue()); }
 out.println("<h1><a href=Page33 >Click to visit Page 3 </a></h1>");
 out.println("<h1><a href=Page44 >Click to visit Page 4 </a></h1>");
 out.println("<h1><a href=Page5 >Click to visit Page 5 </a></h1>");
 out.println("</body>");
 out.println("</html>");
 } }

}
C)Create a servlet demonstrating the use of session creation and destruction. Also check whether the user has visited this page first time or has visited earlier also using sessions.
Index.html
<html>
<head><title>Session Demo</title></head>
<form action="Page1" method="get" >
 Enter User ID <input type="text" name="txtName"><br>
<input type="reset" ><input type="submit" >
</form>
</html>

Page1.java (servlet)
package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Page1 extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Servlet Page1</title></head>");
 HttpSession hs = request.getSession(true);
 if(hs.isNew()){
 out.println("<body bgcolor=yellow>");
 String name = request.getParameter("txtName");
 hs.setAttribute("uname", name);
 hs.setAttribute("visit", "1");
 out.println("<h1>Welcome First Time</h1>");
 }
 else{
 out.println("<h1>Welcome Again</h1>");
 int visit = Integer.parseInt((String)hs.getAttribute("visit"))+1;
 out.println("<h1>You Visited "+visit+"Times</h1>");
 hs.setAttribute("visit", ""+visit);
 }
 out.println("<h1>Your Session ID "+hs.getId()+"</h1>");
 out.println("<h1>You Logged in at "+new java.util.Date(hs.getCreationTime())+"</h1>");
 out.println("<h1><a href=Cookies>Click for Page 2 </a></h1>");
 out.println("<h1><a href=Page3>Click for Page 3 </a></h1>");
 out.println("<h1><a href=Page4>Click for Page 4 </a></h1>");
 out.println("<h1><a href=LogoutServlet>Click to Terminate Session </a></h1>");
 out.println("</body>");
 out.println("</html>");
 }
 }

Cookies.java (servlet)
package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Cookies extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Servlet Page2</title></head>");
 HttpSession hs = request.getSession(false);
 out.println("<h1>Welcome Again on Page No. 2</h1>");
 int visit = Integer.parseInt((String)hs.getAttribute("visit"))+1;
 out.println("<h1>You Visited "+visit+"Times</h1>");
 hs.setAttribute("visit", ""+visit);
 out.println("<h1>Your Session ID "+hs.getId()+"</h1>");
 out.println("<h1>You Logged in at "+new java.util.Date(hs.getCreationTime())+"</h1>");
 out.println("<h1><a href=Cookies>Click for Page 1 </a></h1>");
 out.println("<h1><a href=Page3>Click for Page 3 </a></h1>");
 out.println("<h1><a href=Page4>Click for Page 4 </a></h1>");
 out.println("<h1><a href=LogoutServlet>Click for Terminate Session </a></h1>");
 out.println("</body>");
 out.println("</html>");
 }
 }

LogoutServlet (servlet)
package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LogoutServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 PrintWriter out = response.getWriter();
 out.println("<html><head><title>Servlet LogoutServlet</title></head>");
 out.println("<body>");
 javax.servlet.http.HttpSession hs = request.getSession();
 if(hs != null) hs.invalidate();
 out.println("<h1>You are Logged out now........</h1>");
 out.println("</body>");
 out.println("</html>");
 }
 }

Practical 3
A)Create a Servlet application to upload and download a file.
Index.html
<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
 Select File to Upload:<input type="file" name="file" id="file">
 Destination <input type="text" value="/tmp" name="destination">
 <br>
 <input type="submit" value="Upload file" name="upload" id="upload">
 </form>

FileUploadServlet (servlet)
package Servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, 
IOException
{
 res.setContentType("text/html");
 PrintWriter out = res.getWriter();
 String path=req.getParameter("destination");
 Part filePart=req.getPart("file");
 String sfilePart=req.getPart("file").toString();
 out.print("<br> filePart: "+sfilePart);
 String filename=filePart.getSubmittedFileName().toString();
 out.print("<br><br><hr> file name: "+filename);
 OutputStream os=null;
 InputStream is=null;
try {
 os=new FileOutputStream(new File(path+File.separator+filename));
 is=filePart.getInputStream();
 int read=0;
 byte[] b=new byte[1024];
 while ((read = is.read(b)) != -1) {
 os.write(b, 0, read);
 }
 out.println("<br>file uploaded sucessfully...!!!");
 }
 catch(FileNotFoundException e){out.print(e);}
} }

Index1.html
<body>
 <h1>File Download Application</h1>
 Click <a href="https://www.google.com/">Google</a>
 <br/><br/>
 Click <a href="DownloadServlet?filename=TOC.pdf">Table Of Contents</a>
</body>

DownloadServlet (servlet)
package Servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class DownloadServlet extends HttpServlet 
{ public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException 
{ response.setContentType("APPLICATION/OCTET-STREAM"); 
 String filename = request.getParameter("filename"); 
 ServletContext context = getServletContext();
InputStream is = context.getResourceAsStream("/" + filename);
 ServletOutputStream os = response.getOutputStream();
 response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 
// if comment this statement then it will ask you about the editor with which you want to open the file 
 int i;
 byte b[]=new byte[1024];
 while ((i=is.read(b)) != -1) {
 os.write(b); 
 } 
 is.close(); 
 os.close(); 
}
}

B)Develop Simple Servlet Question Answer Application using Database

Create a table in mysql 
Click on ‘Services’ tab 
Create a database 
Database name: queansdb 
Table name: queans 
Fields: 
queno integer primary key 
question varchar 200 
opt1 varchar 100 
opt2 varchar 100 
opt3 varchar 100 
opt4 varchar 100 
anskey varchar 1

Insert min 2 records 
Right click on table-> click on ‘view data’ -> right click on empty dataset -> insert a record > click on ‘Add Row’ -> OK

add mysql connector to Libray 
click on projects tab 
right click on libraries 
click on add jar 
browse the connector ‘mysql-connector-java-5.1.23-bin’ in folder: C:\Program Files\NetBeans 8.0\ide\modules\ext click on OK

QueAnsDBServlet.java
package dbapp; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.io.*; 
import java.sql.*; 
public class QueAnsDBServlet extends HttpServlet 
{
public void doGet(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException 
{ 
response.setContentType("text/html"); 
PrintWriter out = response.getWriter(); 
try 
{ 
out.print("<html><body><br>"); 
out.println("<form method='post' action='Marks'>"); 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/queansdb","root","tiger"); 
Statement st = con.createStatement(); 
String sql="select * from queans"; 
ResultSet rs = st.executeQuery(sql); 
int i=0; 
out.print("<center>Online Exam</center>"); 
while(rs.next()) 
{ 
i++; 
out.print("<br><br><hr>"+rs.getInt(1)+" "); 
out.print(rs.getString(2)); 
out.print("<br><input type=radio name="+i+" value=1>"+rs.getString(3)); 
out.print("<br><input type=radio name="+i+" value=2>"+rs.getString(4)); 
out.print("<br><input type=radio name="+i+" value=3>"+rs.getString(5)); 
out.print("<br><input type=radio name="+i+" value=4>"+rs.getString(6)); 
String ans="ans"+i;
out.println("<br><input type=hidden name="+ans+" value="+rs.getString(7)+">"); 
} 
out.println("<br><input type=hidden name=total value="+i+">"); 
out.println("<input type=submit value=submit>"); 
out.println("</form>"); 
out.print("</body></html>"); 
} 
catch(Exception e) 
{ 
out.println("ERROR "+e.getMessage()); 
} 
} 
}

Marks.java
package dbapp; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.io.*; 
public class Marks extends HttpServlet 
{ public void doPost(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException 
{ response.setContentType("text/html"); 
PrintWriter out = response.getWriter();
try 
{ out.print("<html><body>"); 
int total=Integer.parseInt(request.getParameter("total")); 
int marks=0; 
for(int i=1; i<=total; i++) 
{ 
String sel=request.getParameter(new Integer(i).toString()); 
String ans=request.getParameter("ans"+i); 
if (sel.equals(ans)) marks++; 
} 
out.println("Total Marks : "+marks); 
out.print("</body></html>"); 
} 
catch(Exception e) 
{ 
out.println("ERROR "+e.getMessage()); 
} 
} 
}


C)Create simple Servlet application to demonstrate Non-Blocking Read Operation.
Go to folder>web-inf>make booklist.txt
Index.html
<html>
<head>
<title>Non Blocking IO</title>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="0; URL=NonBlockingServlet">
</head>
<body>
</body>
</html>

NonBlockingServlet.java (servlet)
package mypack;
import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class NonBlockingServlet extends HttpServlet {
 protected void service(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 try (PrintWriter out = response.getWriter()) {
 
 out.println("<h1>FileReader</h1>");
 String filename="/WEB-INF/booklist.txt";
 ServletContext c=getServletContext();
 InputStream in=c.getResourceAsStream(filename);
 String 
path="http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/ReadingNonBloclingServlet"; 
 URL url=new URL(path);
 HttpURLConnection conn=(HttpURLConnection)url.openConnection();
 conn.setChunkedStreamingMode(2);
 conn.setDoOutput(true);
 conn.connect();
 if(in!=null)
 {
 InputStreamReader inr=new InputStreamReader(in);
 BufferedReader br = new BufferedReader(inr);
 String text="";
 System.out.println("Reading started....");
 BufferedWriter bw=new BufferedWriter(new 
OutputStreamWriter(conn.getOutputStream()));
 while((text=br.readLine())!=null){
 out.print(text+"<br>");
 try{
 Thread.sleep(1000);
 out.flush();
 }
 catch(InterruptedException ex){}
}out.print("reading completed....");
 bw.flush();
 bw.close();
 }
 }
 }
}

ReadingListener.java (servlet)
package mypack;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.AsyncContext;
import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
public class ReadingListener implements ReadListener
{
 private ServletInputStream input = null;
 private AsyncContext ac = null;
 ReadingListener(ServletInputStream in, AsyncContext c) {
 input = in;
 ac = c;
 }
 @Override
 public void onDataAvailable() throws IOException {
 } 
 public void onAllDataRead() throws IOException {
 ac.complete();
 }
 public void onError(final Throwable t) {
 ac.complete();
 t.printStackTrace();
 } 
}

ReadingNonBlockingServlet.java (servlet)
package mypack;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
*
* @author Beena 
*/
@WebServlet (name = "ReadingNonBlockingServlet", urlPatterns = 
{"/ReadingNonBlockingServlet"},asyncSupported = true )
public class ReadingNonBlockingServlet extends HttpServlet {
@Override
 protected void service(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html");
 AsyncContext ac = request.startAsync();
 ServletInputStream in=request.getInputStream();
 in.setReadListener(new ReadingListener(in,ac));
 }
}
Practical 4
A)Develop a simple JSP application to display values obtained from the use of intrinsic objects of various types.

Index.jsp (jsp)
<html><head><title>JSP Page</title></head>
<body>
<h1>Use of Intrinsic Objects in JSP</h1>
<h1>Request Object </h1>
 Query String <%=request.getQueryString() %><br>
 Context Path <%=request.getContextPath() %><br>
 Remote Host <%=request.getRemoteHost() %><br>
<h1>Response Object </h1>
 Character Encoding Type <%=response.getCharacterEncoding() %><br>
 Content Type <%=response.getContentType() %><br>
 Locale <%=response.getLocale() %><br>
<h1>Session Object </h1>
 ID <%=session.getId() %><br>
 Creation Time <%=new java.util.Date(session.getCreationTime()) %><br>
 Last Access Time<%=new java.util.Date(session.getLastAccessedTime()) %><br>
</body>
</html>

B)Develop a simple JSP application to pass values from one page to another with 
validations. (Name-txt, age-txt, hobbies-checkbox, email-txt, gender-radio button).
WebPages>Validate.jsp>index.html
Index.html
<html> 
<body> 
<form action="Validate.jsp"> 
Enter Your Name <input type="text" name="name"><br> 
Enter Your Age <input type="text" name="age"><br> 
Select Hobbies <input type="checkbox" name="hob" value="Singing">Gussa 
<input type="checkbox" name="hob" value="Reading">Reading Books 
<input type="checkbox" name="hob" value="Football">Playing Football<br> 
Enter E-mail<input type="text" name="email"><br> 
Select Gender <input type="radio" name="gender" value="male">Male 
<input type="radio" name="gender" value="female">Female 
<input type="radio" name="gender" value="other">Other<br> 
<input type="hidden" name="error" value=""> 
<input type="submit" value="Submit Form"> 
</form > 
</body> 
</html>

Validate.jsp (jsp)
<%@page contentType="text/html" pageEncoding="UTF-8" import="Hetvi.*"%>

<html> 
<head> 
<title>JSP Page</title> 
</head> 
<body> 
<h1>Validation Page</h1> 
<jsp:useBean id="obj" scope="request" 
 class="Hetvi.Ratnam" > 
<jsp:setProperty name="obj" property="*"/>
</jsp:useBean> 
<%if(obj.validate()) 
{%> 
<jsp:forward page="successful.jsp"/> 
<% } 
else {%> 
<jsp:include page="index.html"/> 
<%}%> 
<%=obj.getError() %> 
</body> 
</html>

Servlet>Java class (java class)
package Hetvi; 
import java.beans.*; 
import java.io.Serializable; 
import java.util.regex.Matcher; 
import java.util.regex.Pattern; 
 
public class Ratnam 
{ 
String name,hob,email,gender,error; 
int age; 
public Ratnam() 
{ 
name=""; 
hob=""; 
email=""; 
gender=""; 
error=""; 
age=0; 
} 
public void setName(String n)
        { 
name=n; 
} 
public String getName() 
{ 
return name; 
} 
public void setAge(int a) 
{ 
age=a; 
} 
public int getAge() 
{ 
return age; 
} 
public void setHob(String h) 
{ 
hob=h; 
} 
public String getHob() 
{ 
return hob; 
} 
public void setEmail(String e) 
{ 
email=e; 
} 
public String getEmail() 
{ 
return email; 
} 
public void setGender(String g) 
{ 
gender=g; 
} 
public String getGender() 
{ 
return gender; 
} 
public String getError()
        { 
return error; 
} 
public boolean validate() 
{ 
boolean res=true; 
if(name.trim().equals("")) 
{ 
error+="<br>Enter First Name"; 
res=false; 
} 
if(age<0||age>99) 
{ 
error+="<br>Age Invalid"; 
res=false; 
} 
String emailregex="^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)@[A-Za-z0-9-]+(\\.[A-Za-z0-9 -]+)(\\.[A-Za-z]{2,})$"; 
Boolean b=email.matches(emailregex); 
if(!b) 
{ 
error+="<br>email Invalid"; 
res=false; 
} 
return res; 
} 
}

C)Create a registration and login JSP application to register and authenticate the user based on username and password using JDBC.

Create table userpass
UNAME, PASS1, EMAIL, CTRY
dip1, hello, abc@gmail.com, India

Index.html 
<html> 
<head> 
<title>New User Registration Page</title> 
</head> 
<body> 
<form action="Registration.jsp"> 
<h1>New User Registration Page</h1> 
Enter User Name<input type="text" name="txtName"><br> 
Enter Password<input type="password" name="txtPass1"><br> 
Re-Enter Password<input type="password" name="txtPass2"><br> 
Enter Email<input type="text" name="txtEmail"><br> 
Enter Country Name<select name="txtCon"> 
<option>India</option> 
<option>France</option> 
<option>England</option> 
<option>Argentina</option> 
</select><br> 
<input type="submit" value="REGISTER"><input type="reset"> 
</form> 
</body> 
</html>

Registration.jsp 
<%@page contentType="text/html" import="java.sql.*"%> 
<html><body> 
<h1>Registration JSP Page</h1> 
<% 
String uname=request.getParameter("txtName"); 
String pass1=request.getParameter("txtPass1"); 
String pass2=request.getParameter("txtPass2"); 
String email=request.getParameter("txtEmail"); 
String ctry=request.getParameter("txtCon"); 
if(pass1.equals(pass2)) 
{ 
try 
{ 
Class.forName("com.mysql.jdbc.Driver");
Connection 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb",”root”,”tiger”); 
PreparedStatement stmt=con.prepareStatement("insert into userpass values(?,?,?,?)"); 
stmt.setString(1,uname); 
stmt.setString(2,pass1); 
stmt.setString(3,email); 
stmt.setString(4,ctry); 
int row=stmt.executeUpdate(); 
if(row==1) 
{ 
out.println("Registration Successful");} 
else 
{ 
out.println("Registration FAILED!!!!"); 
%> 
<jsp:include page="index.html"></jsp:include> 
<% 
} 
}catch(Exception e){out.println(e);} 
} 
else 
{ 
out.println("<h1>Password Mismatch</h1>"); 
%> 
<jsp:include page="index.html"></jsp:include> 
<% } 
%> 
</body> 
</html>

Login.html
<html> 
<body> 
<h1>Login Page</h1> 
<form action="Login.jsp"> 
Enter User Name<input type="text" name="txtName"><br> 
Enter Password<input type="password" name="txtPass"><br> 
<input type="submit" value="~~~LOGIN~~"><input type="reset"> 
</form>
</body> 
</html>
Login.jsp 
<%@page contentType="text/html" import="java.sql.*"%> 
<html><body> 
<h1>Registration JSP Page</h1> 
<% 
String uname=request.getParameter("txtName"); 
String pass=request.getParameter("txtPass"); 
ResultSet rs=null; 
try{ 
Class.forName("com.mysql.jdbc.Driver"); 
Connection 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb"",”root”,”tiger”); 
Statement stmt=con.createStatement(); 
rs=stmt.executeQuery("select password from userpass where username='"+uname+"'"); 
rs.next(); 
if(pass.equals(rs.getString(1))) 
{ 
out.println("<h1>~~~LOGIN SUCCESSFULLL~~~</h1>"); 
} 
else 
{ 
out.println("<h1>password does not match!!!!!</h1>"); 
%> 
<jsp:include page="index.html"></jsp:include> 
<% 
} 
}catch(Exception e){ 
out.println("<h1>User does not exist!!!!!</h1>"); 
%> 
<jsp:include page="index.html"></jsp:include> 
<% 
} 
%> 
</body> 
</html>


Practical 5
A)Create an html page with fields, eno, name, age, desg, salary. Now on submit this data to a JSP page which will update the employee table of database with matching eno.

create table emp(empid varchar(10) PRIMARY KEY, ename varchar(50), salary varchar(50),age 
varchar(50) ) 
insert into emp values('1','aaa','221234','11') 
insert into emp values('2','bbb','334567','22') 
insert into emp values('3','ccc','44454','33') 
insert into emp values('4','ddd','55123','44')

Index.html
<html>
<body>
<form action="UpdateEmp.jsp" >
 Enter Employee Number<input type="text" name="txtEno" ><br>
 Enter Name<input type="text" name="txtName" ><br>
 Enter age<input type="text" name="txtAge" ><br>
 Enter Salary<input type="text" name="txtSal" ><br>
<input type="reset" ><input type="submit">
</form>
</body>
</html>

UpdateEmp.jsp
<%@page contentType="text/html" import="java.sql.*" %>
<html><body>
<h1>Employee Record Update</h1>
<%
 String eno=request.getParameter("txtEno"); 
 String name=request.getParameter("txtName");
 String age = request.getParameter("txtAge");
 String sal = request.getParameter("txtSal");
 try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb","root","Hetvi");
 PreparedStatement stmt = con.prepareStatement("select * from emp where empid=?");
 stmt.setString(1, eno); 
 ResultSet rs = stmt.executeQuery();
 if(rs.next()){
 out.println("<h1>~~~ Employee "+name+" Exist ~~~ </h1>");
 PreparedStatement pst1= con.prepareStatement("update emp set salary=? where empid=?");
 PreparedStatement pst2= con.prepareStatement("update emp set age=? where empid=?");
 pst1.setString(1, sal); pst1.setString(2, eno);
 pst2.setString(1, age); pst2.setString(2, eno);
 pst1.executeUpdate(); pst2.executeUpdate();
 }
 else{
 out.println("<h1>Employee Record not exist !!!!!</h1>");
 }
 }catch(Exception e){out.println(e);}
 %></body></html>

B)Create a JSP page to demonstrate the use of Expression language.
Index.html
<body>
<h3>welcome to index page</h3>

<form action="ExpressionLanguage.jsp">
Enter Name:<input type="text" name="name" /><br/><br/>
<input type="submit" value="Submit"/>
</form>
</body>

ExpressionLanguage.jsp
<body> 
Welcome, ${ param.name } 
Session Value is ${ sessionScope.user } 
Cookie name is , ${cookie.name.value} 
</body>

ELArithemeticOperator.jsp
<body> 
<%-- arithmetic op --%> 
5*5+4: ${5*5+4} <br> 
1.4E4+1.4: ${1.4E4+1.4}<br> 
10 mod 4: ${10 mod 4}<br> 
15 div 3: ${15 div 3}<br> 
</body>

ELLogicalOperator.jsp
<body> 
<%-- LogicalOperator --%> 
<h2>Logical Operator</h2> 
true and true: ${true and true}<br> 
true && false: ${true && false}<br> 
true or true: ${true or true}<br> 
true || false: ${true || false}<br> 
not true: ${not true}<br> 
!false: ${!false} 
</body>

ELRelationalOperator.jsp
<body> 
<%-- RelationalOperator --%> 
<h2>Relational Operator</h2> 
10.0==10: ${10.0==10} <br> 
10.0 eq 10: ${10.0 eq 10} <br> 
((20*10)!= 200): ${((20*10)!= 200)} <br> 
3 ne 3: ${3 ne 3} <br> 
3.2>=2: ${3.2>=2} <br> 
3.2 ge 2: ${3.2 ge 2} <br> 
2<3: ${2<3} <br> 
4 lt 6: ${4 lt 6} <br> 
2 <= 4: ${2 <= 4} <br> 
4 le 2: ${4 le 2} 
</body>

ELconditionalop.jsp
<body> 
<h2>Conditional Operator</h2> 
The result of 10>2 is: "${(10>1)?'greater':'lesser'}" 
</body>

Empty Operator.jsp
<H1>Empty Operator Example</H1> 
The Value for the Empty operator is:: ${empty "txxt"}

C)Create a JSP application to demonstrate the use of JSTL

Index.html
<html><body>
<a href="setDemo.jsp"> SetDemo</a>
<a href="Maxif.html"> MaxIF</a>
<a href="ForeachDemo.jsp"> ForEachDemo</a>
<a href="outDemo.jsp"> OutDemo</a>
<a href="URLDemo.jsp"> URLDemo</a>
<a href="choose_when_otherwise.jsp"> choose_when_otherwise</a>
</body></html>

outDemo.jsp (jsp)
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="name" value="Hetvi"/>
My name is: <c:out value= "${name}" />

setDemo.jsp (jsp)
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<c:set var="pageTitle" scope="application"
value="Welcome!!" />
${pageTitle}

choose_when_otherwise.jsp
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="income" value="${4000*4}"/>
Your Income is: <c:out value="${income}"/>
<c:choose>
 <c:when test="${income <=1000}">
     Income is not good
 </c:when>
 <c:when test="${income > 10000}">
 Income is Very Good
 </c:when>
 <c:otherwise>
 Income is undetermined
 </c:otherwise>
</c:choose>

URLDemo.jsp (jsp)
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/index.html"/>

Maxif.html
<form action ="IFDemo.jsp">
 x=<input type="text" name="x" /><br>
 y=<input type="text" name="y" /><br>
 <input type="submit" value="Check Max" />
 </form>

IfDemo.jsp (jsp)
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="x" value="${param.x}"/>
<c:set var="y" value="${param.y}"/>
<c:if test="${x>y}">
 <font color="blue"><h2>The Ans is:</h2></font>
 <c:out value="${x} is greater than ${y}"/>
</c:if>

ForeachDemo.jsp (jsp)
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach begin="1" end="10" var="i">
 The Square of <c:out value=" ${i}=${i*i}"/><br>
 </c:forEach>   

Practical 6
A)Create a Currency Converter application using EJB.
Index.html
<html><head><title>Currency Converter</title></head>
<body>
<form action="CCServlet" >
 Enter Amount <input type="text" name="amt"><br>
 Select Conversion Type
<input type="radio" name="type" value="r2d" checked>Rupees to Dollar
<input type="radio" name="type" value="d2r" >Dollor to Rupees<br>
<input type="reset" ><input type="submit" value="CONVERT" >
</form>
</body>
</html>

CCServlet.java (servlet)
package Servlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.ejb.EJB;
import Servlet.CCBean;
public class CCServlet extends HttpServlet {
 @EJB CCBean obj;
public void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
double amt = Double.parseDouble(request.getParameter("amt"));
if(request.getParameter("type").equals("r2d"))
{
out.println("<h1>"+amt+ " Rupees = "+obj.r2Dollor(amt)+" Dollors</h1>");
}
if(request.getParameter("type").equals("d2r"))
{
out.println("<h1>"+amt+ " Dollors = "+obj.d2Rupees(amt)+" Rupees</h1>");
}
}
}

CCBean.java (sessionbean)
package Servlet;
import javax.ejb.Stateless;
@Stateless
public class CCBean {
public CCBean(){}
public double r2Dollor(double r){ return r/65.65; }
public double d2Rupees(double d){ return d*65.65; }
}


B)Develop a Simple Room Reservation System Application Using EJB
Create table ROOM
TOTAL, OCC [100-0]

Index.html 
<html> 
<head> 
<title>Room Reservation</title> 
</head> 
<body> 
<form method="post" action="RoomClient"> 
<br> No of Rooms <input type=text name="t1"> 
<br> <input type="submit" name="btn" value="CheckIN"> 
<br> <input type="submit" name="btn" value="CheckOUT"> 
</form> 
</body> 
</html>

Step2: Create a session bean named as RoomBean in the package named ejb. Select the option Stateless and click on Local Interface. 
Here you will find two files created in the ejb package named as RoomBean.java and RoomBeanLocal.java and RoomBeanLocal.java 
package ejb; 
import javax.ejb.Local; 
@Local 
public interface RoomBeanLocal { 
public int checkin(int no); 
public int checkout(int no); 
}

RoomBean.java 
package ejb; 
import javax.ejb.Stateless; 
import java.sql.*; 
@Stateless 
public class RoomBean implements RoomBeanLocal { 
public int checkin(int no) { 
try 
{ 
Class.forName("com.mysql.jdbc.Driver"); 
Connection 
con=DriverManager.getConnection("jdbc:mysql://localhost/roomdb","root","tiger"); 
String sql1 = "select * from room"; 
Statement st=con.createStatement(); 
ResultSet rs=st.executeQuery(sql1); 
rs.next(); 
int total=rs.getInt(1); 
int occ=rs.getInt(2); 
int free=total-occ; 
System.out.println(total); 
System.out.println(free); 
if (free>=no) 
{ 
String sql2="update room set occ=?"; 
PreparedStatement ps=con.prepareStatement(sql2); 
ps.setInt(1, occ+no);

int res=ps.executeUpdate(); 
return res; 
} 
else return 0; 
} 
catch(Exception e) 
{ 
return 0; 
} 
} 
public int checkout(int no) { 
try 
{ Class.forName("com.mysql.jdbc.Driver"); 
Connection 
con=DriverManager.getConnection("jdbc:mysql://localhost/roomdb","root","tiger"); 
String sql1 = "select * from room"; 
Statement st=con.createStatement(); 
ResultSet rs=st.executeQuery(sql1); 
rs.next(); 
int total=rs.getInt(1); 
int occ=rs.getInt(2); 
if (occ>=no) 
{ 
String sql2="update room set occ=?"; 
PreparedStatement ps=con.prepareStatement(sql2); 
ps.setInt(1, occ-no);
int res=ps.executeUpdate(); 
return res; 
} 
else return 0; 
} 
catch(Exception e) 
{ 
return 0; 
} 
} 
}

Step 3: Create a Servlet file named as RoomClient. Do not click on web.xml 
(Deployment Descriptor) 
package servlet; 
import ejb.RoomBeanLocal; 
import java.io.*; 
import javax.ejb.EJB; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import javax.servlet.annotation.*; 
@WebServlet(name = "roomclient", urlPatterns = {"/roomclient"}) 
public class roomclient extends HttpServlet { 
@EJB RoomBeanLocal obj; 
protected void doPost(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException { 
response.setContentType("text/html"); 
PrintWriter out = response.getWriter(); 
try { 
int no=Integer.parseInt(request.getParameter("t1"));
String b=request.getParameter("btn"); 
int res=0; 
if(b.equals("CheckIN")) 
{ 
res=obj.checkin(no); 
if (res==1) 
out.println(no + " rooms check-in"); 
} 
if(b.equals("CheckOUT")) 
{ 
res=obj.checkout(no); 
if (res==1) 
out.println(no + " rooms check-out"); 
} 
if(res==0) 
out.println("Not possible to do Check IN / OUT"); 
out.println("<br><br><a href=index.html> Back </a>"); 
} 
finally { 
out.close(); 
} 
} 
}


C)Develop simple shopping cart application using EJB [Stateful Session Bean].

Step 1 creating application 
File -> new project-> java web->web application -> Prac6CShoppingCartApp -> select Use dedicated folder for storing libraries -> finish 
Step 2: Creating a stateful session bean Source package -> new -> other -> enterprise java beans -> session bean -> next -> new session bean -> ejb name: ->ShoppingCart -> package: -> ejb -> session type option -> Stateful -> finish. 

ShoppingCart.java 
package ejb; 
import java.sql.*; 
import java.util.*; 
import javax.ejb.*; 
@Stateful 
public class ShoppingCart 
{ List<String> contents; 
String customerName; 
private Connection conn = null; 
private ResultSet rs; 
private Statement stmt = null; 
private String query = null; 
public void initialize(String person) 
{ if (person != null) { 
customerName = person; 
try { 
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cartdb", "root", 
"tiger"); 
} catch(ClassNotFoundException | IllegalAccessException | InstantiationException | 
SQLException e) { 
System.err.println("Sorry failed to connect to the Database." + e.getMessage()); 
} 
} 
contents = new ArrayList<>(); 
} 
public void addBook(String title) { 
try { 
stmt = conn.createStatement(); 
query = "INSERT INTO cart VALUES('" + customerName + "','" + title + "')"; 
stmt.executeUpdate(query); 
} catch(SQLException e) { 
System.err.println("Sorry failed to insert values from the database table. " + e.getMessage()); 
} 
} 
public void removeBook(String title) { 
try { 
stmt = conn.createStatement(); 
query = "DELETE FROM cart WHERE UserName='" + customerName + "' AND 
ItemName='" + title + "'"; 
stmt.executeUpdate(query); 
} catch(SQLException e) { 
System.err.println("Sorry failed to delete values from the database table. " + e.getMessage()); 
}
} 
public List<String> getContents() { 
try { 
stmt = conn.createStatement(); 
query = "SELECT * FROM cart WHERE UserName='" + customerName + "'"; 
rs = stmt.executeQuery(query); 
while(rs.next()) { 
contents.add(rs.getString("ItemName")); 
} 
} catch(SQLException e) { 
System.err.println("Sorry failed to select values from the database table. " + e.getMessage()); 
} 
return contents; 
} 
@Remove() 
public void remove() { 
contents = null; 
} 
}

Step 3: creating a web client using index.jsp 
Right click on wewb pages -> new -> JSP -> filename -> index -> finish. 
<%@page import="java.util.Iterator, java.util.List, javax.naming.InitialContext, 
ejb.ShoppingCart"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<%! 
private static ShoppingCart cart;
public void jspInit() { 
try { 
InitialContext ic = new InitialContext(); 
cart = (ShoppingCart) ic.lookup("java:global/Prac6CShoppingCartApp/ShoppingCart"); 
} catch (Exception ex) { 
System.out.println("Could not create cart bean." + ex.getMessage()); 
} 
} 
%> 
<% 
if(request.getParameter("txtCustomerName") != null) { 
cart.initialize(request.getParameter("txtCustomerName")); 
} else { 
cart.initialize("Guest"); 
} 
if (request.getParameter("btnRmvBook") != null) { 
String books[] = request.getParameterValues("chkBook"); 
if (books != null) { 
for (int i=0; i<books.length; i++) { 
cart.removeBook(books[i]); 
} 
} 
} 
if (request.getParameter("btnAddBook") != null) { 
String books[] = request.getParameterValues("chkBook"); 
if (books != null) {
for (int i=0; i<books.length; i++) { 
cart.addBook(books[i]); 
} 
} 
} 
%> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Shopping Cart</title> 
</head> 
<body style="background-color: pink;"> 
<h1 style="text-align: center;">Books For Sale</h1><br> 
<form method="post"> 
Customer Name: <input type="text" name="txtCustomerName" value=<%= 
request.getParameter("txtCustomerName")%> /><br> 
<b>Book Titles</b><br> 
<input type="checkbox" name="chkBook" value="Struts 2.0 For Beginners">Struts 
2.0 For Beginners<br> 
<input type="checkbox" name="chkBook" value="Oracle 11g For 
Professionals">Oracle 11g For Professionals<br> 
<input type="checkbox" name="chkBook" value="Hibernate 3 For 
Beginners">Hibernate 3 For Beginners<br> 
<input type="checkbox" name="chkBook" value="Java Persistence API In EJB 3 
For Beginners">Java Persistence API In EJB 3 For Beginners<br> 
<br> 
<input type='submit' value='Add To My Basket' name='btnAddBook'>
<input type='submit' value='Remove From My Basket' 
name='btnRmvBook'><br><br><br> 
<% 
if(cart!=null) 
{ 
out.print("<b>Basket</b><br>"); 
List<String> bookList = cart.getContents(); 
Iterator iterator = bookList.iterator(); 
while (iterator.hasNext()) 
{ 
String title = (String) iterator.next(); 
%> 
<%= title %><br> 
<% 
} 
} 
%> 
</form> 
</body> 
</html> 

Step 4: 
Create database and database table Services -> create database -> cartdb >select cartdb - > right click -> create table -> cart -> UserName varchar 35 
ItemName varchar 50 
Finish.
Step 5. 
Add mysql connector to the library under project tab. 
Step 6: build and run the application.


Practical 7
A)Develop simple EJB application to demonstrate Servlet Hit count using Singleton Session Beans. 
Index.html
package servlet; 
import ejb.CountServletHitsBean; 
import java.io.*; 
import javax.ejb.EJB; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.*; 
@WebServlet(name = "ServletClient", urlPatterns = {"/ServletClient"}) 
public class ServletClient extends HttpServlet { 
@EJB CountServletHitsBean obj; 
@Override 
protected void service (HttpServletRequest req, HttpServletResponse res) throws ServletException, 
IOException 
{ 
res.setContentType("text/html"); 
PrintWriter out=res.getWriter(); 
out.print("<b>Number of times this Servlet is accessed </b>: "+obj.getCount()); 
} 
}

CountServletHitsBean.java (session bean)
package Servlet;
import javax.ejb.Singleton;
@Singleton
public class CountServletHitsBean {
 private int hitCount;
 public synchronized int getCount()
 {
 return hitCount++;
 }
}

ServletClient.java
package Servlet;
import Servlet.CountServletHitsBean;
import java.io.*;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "ServletClient", urlPatterns = {"/ServletClient"})
public class ServletClient extends HttpServlet {
@EJB CountServletHitsBean obj;
@Override
protected void service (HttpServletRequest req, HttpServletResponse res) throws ServletException, 
IOException
{
 res.setContentType("text/html");
 PrintWriter out=res.getWriter();
 out.print("<b>Number of times this Servlet is accessed </b>: "+obj.getCount());
}
}

B)Develop simple visitor Statistics application using Message Driven Bean [Stateless Session Bean]. 
Web-> web application -> Pract7BVisitorStatisticsMDBApp -> select dedicated folders for storing libraries -> finish. 
Step 1: 
index.jsp 
<%@page import="javax.jms.JMSException"%> 
<%@page import="javax.naming.InitialContext"%> 
<%@page import="javax.jms.Connection"%> 
<%@page import="javax.jms.TextMessage"%> 
<%@page import="javax.jms.MessageProducer"%> 
<%@page import="javax.jms.Session"%> 
<%@page import="javax.jms.Queue"%> 
<%@page import="javax.jms.ConnectionFactory"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<%! 
private static ConnectionFactory connectionFactory; 
private static Queue queue; 
Connection connection=null; 
Session mySession=null; 
MessageProducer messageProducer=null; 
TextMessage message=null; 
%> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> 
</head> 
<body> 
Welcome to My Home Page 
<% 
try{ 
InitialContext ic= new InitialContext(); 
queue= (Queue)ic.lookup("jms/Queue"); 
connectionFactory=(ConnectionFactory)ic.lookup("jms/QueueFactory");
connection= connectionFactory.createConnection(); 
mySession=connection.createSession(false, Session.AUTO_ACKNOWLEDGE); 
messageProducer=mySession.createProducer(queue); 
message=mySession.createTextMessage(); 
message.setText(request.getRemoteAddr()); 
messageProducer.send(message); 
} 
catch(JMSException e) 
{ 
System.out.println("Exception Occoured "+e.toString()); 
} 
%> 
</body> 
</html> 
Step2: Create a Database name visitorstat  Create table name  userstat  column names Firstvisitdt – timestamp Hostname – varchar 30 PrimaryKey 
Visits – int Step3: Create a Session Bean named as VisitorStatBean  Select Stateless  package name as ejb, do not select Local / Remote 
package ejb; 
import java.sql.*; 
import javax.annotation.PostConstruct; 
import javax.annotation.PreDestroy; 
import javax.ejb.Stateless; 
@Stateless 
public class VisitorStatBean { 
private Connection conn=null; 
private ResultSet rs; 
private Statement st=null; 
private String query =null; 
@PostConstruct 
public void connect() 
{ 
try { 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
conn=DriverManager.getConnection("jdbc:mysql://localhost/visitorstat", "root", "tiger"); 
}
catch (Exception e) { 
System.err.println(e.getMessage()); 
} 
} 
@PreDestroy 
public void disconnect() 
{ 
try { 
conn.close(); 
} catch (Exception e) { 
System.err.println(e.getMessage()); 
} 
} 
public void addVisitor(String host) 
{ 
try { 
st= conn.createStatement(); 
query="insert into userstat (hostname,visits) values ('"+host+"','1')"; 
st.executeUpdate(query); 
} 
catch (SQLException e) 
{ 
try { 
st=conn.createStatement(); 
query="update userstat set visits=visits+1 where hostname='"+host+"' "; 
st.executeUpdate(query); 
} 
catch (SQLException ex) { 
System.err.println("Cannot Update"+e.getMessage()); 
} 
} 
} 
}
Step 4: Right click on Source Packages  Select New Other Enterprise Java Bean 
 MessageDrivenBean  EJB Name: BasicMessageBean Package: ejb Select 
Project Destination  Click on Add Button  Destination Name: 
jms/Queue  
Destination Type select the option Queue click on OK Click on Next  Activation 
Configuration Properties should be as it is.  Click on Finish 
package ejb; 
import javax.annotation.Resource; 
import javax.ejb.ActivationConfigProperty; 
import javax.ejb.EJB; 
import javax.ejb.MessageDriven; 
import javax.ejb.MessageDrivenContext; 
import javax.jms.JMSException; 
import javax.jms.Message; 
import javax.jms.MessageListener; 
import javax.jms.TextMessage; 
@MessageDriven(activationConfig = { 
@ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/Queue"), 
@ActivationConfigProperty(propertyName = "destinationType", propertyValue = 
"javax.jms.Queue") 
}) 
public class BasicMessageBean implements MessageListener { 
@EJB VisitorStatBean vs; 
@Resource 
private MessageDrivenContext mdc; 
public BasicMessageBean() { 
} 
@Override 
public void onMessage(Message message) { 
try { 
if(message instanceof TextMessage){ 
TextMessage msg= (TextMessage) message; 
vs.addVisitor(msg.getText()); 
} 
} 
catch (JMSException e) { 
mdc.setRollbackOnly(); 
}
} 
} 
Step 5: 
Before deploying and running the application, Glassfish Server setting is required. 
Browse the path: 
Localhost:4848 on any browser. 
Find Resources -> connectors -> Connector Resources double click on Connector 
Resources -> click on ‘New’ Button -> write JNDI name as -> jms/QueryFactory. 
Find Admin Object Resources and double click on that -> click on ‘New’ Button -> write JNDI name as -> jms/Queue. 
Now run index.jsp file



C)Develop simple Marks Entry Application to demonstrate accessing Database using EJB.

Step 1: 
Create web application as pract7CMarksApp. 
Step 2: 
Create database marksdb 
Step 3: 
Create tables marks in marksdb database as: 
create table marks (id int primary key auto_increment, sname varchar(35), marks1 int, 
marks2 int, marks3 int); 
step 4: 
index.jsp 
<%@page import="ejb.MarksEntryBean"%> 
<%@page import="javax.naming.InitialContext"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<%! 
private static MarksEntryBean obj; 
public void jspInit() 
{ 
try 
{ 
InitialContext ic=new InitialContext(); 
obj=(MarksEntryBean)ic.lookup("java:global/Pract7CMarksApp/MarksEntryBean"); 
} 
catch(Exception e) 
{
System.out.println(e); 
} 
} 
%> 
<% 
if(request.getParameter("InsertMarks")!=null) 
{ 
String sname; 
int marks1, marks2, marks3; 
sname = request.getParameter("sname"); 
marks1=Integer.parseInt(request.getParameter("m1")); 
marks2=Integer.parseInt(request.getParameter("m2")); 
marks3=Integer.parseInt(request.getParameter("m3")); 
obj.addMarks(sname,marks1,marks2,marks3); 
out.print("Marks entered successfully..!!!!"); 
} 
%> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> 
</head> 
<body> 
<h2>Enter Details</h2> 
<form name="result" method="post"> 
Enter student's name: <input type='text' name="sname" /><br>
Enter subject 1 marks: <input type='text' name="m1" /><br> 
Enter subject 2 marks: <input type='text' name="m2" /><br> 
Enter subject 3 marks: <input type='text' name="m3" /><br> 
<input type='submit' name="InsertMarks" /><br> 
</form> 
</body> 
</html> 
Step 4: 
create stateful java bean as select source package -> session bean -> class name -> MarksEntryBean -> package -> ejb -> bean type-> stateful -> don’t select Local / 
Remote -> finish. 
package ejb; 
import java.sql.*; 
import javax.ejb.Stateful; 
@Stateful 
public class MarksEntryBean { 
String sname; 
int m1,m2,m3; 
Connection con=null; 
Statement st=null; 
String query=""; 
public void addMarks(String sname,int m1,int m2,int m3) 
{ 
try 
{ 
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/marksdb", "root","tiger");
st=con.createStatement(); 
query="insert into marks (sname,marks1,marks2,marks3) values 
('"+sname+"','"+m1+"','"+m2+"','"+m3+"')"; 
st.executeUpdate(query); 
System.out.print("Marks entered sucessfully!!"); 
} 
catch(Exception e){System.out.println(e);} 
} 
}

Practical 8
B)Develop a Guestbook Application Using JPA. (persistence)

Practical 9
A)Develop a Hibernate application to store Feedback of Website Visitor in MySQL 
Database.
create database feedbackdb; 
create table GuestBook( 
vno int PRIMARY KEY AUTO_INCREMENT, 
vname varchar(50), 
msg varchar(100), 
mdate varchar(50) 
)

GuestBookBean.java

package mypack; 
import javax.persistence.*; 
@Entity 
@Table(name="guestbook") 
public class GuestBookBean implements java.io.Serializable { 
@Id 
@GeneratedValue 
@Column(name="vno") 
private Integer visitorNo; 
@Column(name="vname") 
private String visitorName; 
@Column(name="msg") 
private String msg; 
@Column(name="mdate") 
private String msgDate; 
public GuestBookBean() { } 
public Integer getVisitorNo() { return visitorNo; } 
public String getVisitorName() { return visitorName; } 
public String getMsg() { return msg; } 
public String getMsgDate() { return msgDate; } 
public void setVisitorNo(Integer vn) { visitorNo = vn ; }
public void setVisitorName(String vn) { visitorName = vn; } 
public void setMsg(String m) { msg = m; } 
public void setMsgDate(String md) { msgDate=md; } 
} 

Source packages →new → others→select category Hibernate →Hibernate Configuration Wizard
<hibernate-configuration> 
<session-factory> 
<property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property> 
<property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property> 
<property 
name="hibernate.connection.url">jdbc:mysql://localhost:3306/feedbackdb?zeroDateTimeBehavior=co 
nvertToNull</property> 
<property name="hibernate.connection.username">root</property> 
<property name="hibernate.connection.password">root</property> 
<mapping class="mypack.GuestBookBean" /> 
</session-factory> 
</hibernate-configuration>

Index.html
<h1>Website Feedback Form for google.con </h1> 
<form action="fb.jsp" >
Enter Your Name: <input type="text" name="name" ><br> 
Enter Your Message : <textarea rows="10" cols="50" name="message" ></textarea><br> 
<input type="submit" value="Submit My FeedBack " > 
</form>

Fb.jsp
<%@page import="org.hibernate.*, org.hibernate.cfg.*, mypack.*" %> 
<%! 
SessionFactory sf; 
org.hibernate.Session hibSession; 
%> 
<% 
sf = new Configuration().configure().buildSessionFactory(); 
hibSession = sf.openSession(); 
Transaction tx = null; 
GuestBookBean gb = new GuestBookBean(); 
try{ 
tx = hibSession.beginTransaction(); 
String username = request.getParameter("name"); 
String usermsg = request.getParameter("message"); 
String nowtime = ""+new java.util.Date(); 
gb.setVisitorName(username); 
gb.setMsg(usermsg); 
gb.setMsgDate(nowtime); 
hibSession.save(gb); 
tx.commit(); 
out.println("Thank You for your valuable feedback...."); 
}catch(Exception e){out.println(e);} 
hibSession.close(); 
%>

