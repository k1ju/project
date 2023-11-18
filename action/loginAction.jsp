<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>

<% request.setCharacterEncoding("utf-8");

String userId = request.getParameter("id_value");
String userPw = request.getParameter("pw_value");

String sql = "SELECT * from user where email = ? and pw = ?";

String dbURL = "jdbc:mysql://localhost/project";
String dbID = "stageus";
String dbPassword = "1234";

Class.forName("com.mysql.jdbc.Driver");
Connection connect =  DriverManager.getConnection(dbURL,dbID,dbPassword);

PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,userId);
query.setString(2,userPw);
ResultSet result = query.executeQuery();



if(result.next()){
    userId = result.getString("email");
    String userName = result.getString("name");
    String userIdx = result.getString("idx");

    session.setAttribute("userId",userId);
    session.setAttribute("userName",userName);
    session.setAttribute("userIdx",userIdx);
    response.sendRedirect("../page/main.jsp"); // 페이지이동
}
else{
    response.sendRedirect("../page/login.jsp");
}
 
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<script>
    alert("로그인실패")
    location.href="../page/login.jsp"

</script>

    
</body>
</html>