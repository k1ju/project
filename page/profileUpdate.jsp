<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");

String userIdx = null; // 세션 검사, 문자형
if(session.getAttribute("userIdx") != null){
    userIdx = (String)session.getAttribute("userIdx");
}else{
    response.sendRedirect("login.jsp");
}

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");
String sql = "SELECT name,email,birth,signup_date,profile FROM user WHERE idx = ? "; //sql 생성, 사용자의 정보 조회하기
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,userIdx); // 세션입력시 타입 문자형->숫자형 전환
ResultSet result = query.executeQuery();

result.next();
String userName = result.getString(1);
String userId = result.getString(2);
String userBirth = result.getString(3);
String userSignupDate = result.getString(4);
String userProfile = null;
if(result.getString(5) == null){
    userProfile = "";
}else{
    userProfile = result.getString(5);
}


%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/main.css">

</head>
<body>

    <header>
        <div id="header_left">
            <a href="main.jsp">
                <button id = "logo" class="Btn">tistory</button>
            </a>
        </div>

        <div id='image_box'>
            <img id="image" src="../image/kakao.png">
        </div>
        <div class="Btn_box">
            <a href="postList.jsp">
                <button class="Btn">글목록</button>
            </a>
        </div>
        <div id="header_right">
            <div class="Btn_box">
                <a href="profile.jsp">
                    <button class="Btn">내 정보</button>
                </a>
            </div>
            <div class="Btn_box">
                <a href="../action/logoutAction.jsp">
                    <button class="Btn">로그아웃</button>
                </a>
            </div>
        </div>
    </header>

    <div id="input_container">
        <p class="title">-------회원정보 수정하기-------</p>
        <div id="info_container" class = "box">
            <p class="title">-------계정 프로필-------</p>

            <form action="../action/profileUpdateAction.jsp">
                <p>이름 : <input name = "name_value" value="<%=userName%>"> </p>
                <p>이메일 : <input name = "id_value" value="<%=userId%>" readonly> </p>
                <p>생일 : <input name = "birth_value" value="<%=userBirth%>"> </p>
                <p>가입일 : <input name = "signup_date_value" value="<%=userSignupDate%>" readonly></p>
                <div id="input_content">
                    프로필 : <input name = "profile_value" class ="input" value="<%=userProfile%>">
                </div>

                <div>
                    비밀번호 : <input type = "password" name="pw_value">
                </div>

                <div class="Btn_box">
                    <input class="Btn" type="submit" value="수정 확인">
                </div>
            </form>    
        </div>
    </div>


</body>
</html>