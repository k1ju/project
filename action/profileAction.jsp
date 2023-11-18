<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.ResultSet"%>

<%
String userId = (String)session.getAttribute("userId");
String userName = request.getParameter("name_value");
String userBirth = request.getParameter("birth_value");
String userProfile = request.getParameter("profile_value");

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");
String sql = "UPDATE user SET name = ?, birth = ? , profile = ? WHERE email = ? ";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,userName);
query.setString(2,userBirth);
query.setString(3,userProfile);
query.setString(4,userId);

int rs = query.executeUpdate();

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("정보변경이 완료되었습니다")
        location.href="profile.jsp"

        console.log(<%=username%>)
        console.log(<%=userbirth%>)
        console.log(<%=userprofile%>)
        console.log(<%=userId%>)

    </script>
    
    
</body>
</html>