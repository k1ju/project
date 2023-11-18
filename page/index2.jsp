<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <form action="signup2.jsp">
        <input type="text" required autofocus name="id_value">
        <input type="password" required name="pw_value">
        <input type="submit" value="회원가입완료">
        <!-- <input type="reset" value="reset"> -->
    </form>

    <form action="accountList2.jsp">
        <input type="submit" value="계정목록출력">
    </form>
    
</body>
