<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%

request.setCharacterEncoding("utf-8");

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/login.css">
</head>
<body>

    <div id="container">
        <header>로그인</header>

        <div id="image_box">
            <img id ="image" src="../image/kakao.png">
        </div>
        <form action="../action/loginAction.jsp">
            <div class="inner_box id_box">
                <input  class='login_input' name="id_value" id="id_input" type="text" placeholder="id">
                <Img id="icon_menu" src="../image/icon_menu.png">
            </div>
            <div class="inner_box">
                <input  class='login_input' name="pw_value" type="password" placeholder="password">
            </div>
            <div class="inner_box Btn">
                <input type="submit" class="loginBtn" value="로그인">
            </div>
        </form>
        <p>----------또는----------</p>
        <div class="inner_box Btn">
            <a href="signup.jsp"> 
                <button class = "loginBtn" id="QRloginBtn" type="text">회원가입</button>
            </a>   
        </div>
        <p>자동로그인</p>

        <footer>
            <a href="idFind.jsp">
                <p id="find_id">카카오계정 찾기</p>
            </a>
           
            <a href="pwCheck.jsp">
                <p id="chagne_pw">비밀번호 재설정</p>
            </a>
        </footer>
    </div>
</body>
</html>



