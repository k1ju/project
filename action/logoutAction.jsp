<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%
session.invalidate(); // 세션 삭제,로그아웃
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
        alert('로그아웃되었습니다')
        location.href="../page/login.jsp"
    </script>
</body>
</html>