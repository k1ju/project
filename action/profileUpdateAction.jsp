<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
request.setCharacterEncoding("utf-8");
String userIdx = null;
if(session.getAttribute("userIdx") != null){
    userIdx = (String)session.getAttribute("userIdx");
}else{
    response.sendRedirect("logoutAction.jsp");
}

String userName = request.getParameter("name_value");
String userId = request.getParameter("id_value");
String userBirth = request.getParameter("birth_value");
String userSignupDate = request.getParameter("signup_date_value");
String userProfile = request.getParameter("profile_value");

String dbURL = "jdbc:mysql://localhost/project";
String dbId = "stageus";
String dbPw = "1234";

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection(dbURL,dbId,dbPw);
String sql = "UPDATE user SET email = ?, name = ?, birth = ?, signup_date = ?, profile = ?";
sql += "WHERE idx = ?";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,userId);
query.setString(2,userName);
query.setString(3,userBirth);
query.setString(4,userSignupDate);
query.setString(5,userProfile);
query.setString(6,userIdx);

query.executeUpdate();



%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("변경되었습니다")
        location.href="../page/profile.jsp"
    </script>
    
</body>
</html>