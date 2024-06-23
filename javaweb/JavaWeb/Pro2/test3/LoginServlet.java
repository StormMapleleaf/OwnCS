request. setCharacterEncoding("UTF -8");
response. setCharacterEncoding("UTF-8");
response. setHeader("Content-type","text/plain;charset = UTF -8") ;
String username= request. getParameter("username");
String password= request. getParameter("password");
if(username!= null&&password!= null) { 
if(username. equals(password)) { 
HttpSession session= request. getSession(); 
session. setAttribute("username", username); 
response. sendRedirect("WelcomeServlet"); 
} else{
response. getWriter(). append("用户名密码错误,请重新登录,5 秒后回到登录页面······");
response. setHeader("Refresh", "5;URL= login. html");}
}
else{
response. getWriter(). append("禁止直接访问,5秒后回到登录页面······");
response. setHeader("Refresh", "5;URL= login. html");}