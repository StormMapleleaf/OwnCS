request. setCharacterEncoding("UTF-8");
response. setCharacterEncoding("UTF-8");
response. setHeader("Content-type","text/plain;charset = UTF -8") ;
String message;
PrintWriter out = response. getWriter();
String country= request. getParameter("country");
if(country. equals("中国")) {
message ="这是一个中国的用户";
request. setAttribute("message", message);
out. println("FirstServlet已经处理完毕,可以转发");
//获得用于转发的 RequestDispatcher 对象
RequestDispatcher rd= request. getRequestDispatcher("SecondServlet");
rd. forward(request, response);

request. setAttribute("num",1);
out. println("FirstServlet 请求已经被转发");
}