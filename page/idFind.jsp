<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/idFind.css">

</head>
<body>

    <div id="container">
        <header>아이디찾기</header>
        <div id="image_box">
            <img id ="image" src="../image/kakao.png">
        </div>

        <form action="idFindOk.jsp">
            <div class="inner_box id_box">
                <input  class='login_input' name="name_value" id="id_input" type="text" placeholder="이름">
            </div>
            <div class="inner_box">
                <input  class='login_input' name="birth_value" id="id_input" type="text" placeholder="생년월일 8자리">
            </div>

            <div class="inner_box Btn" id="submitBtn">
                <input type="submit" id="confirmBtn" value="확인">
                <!-- <button id="confirmBtn" type="text">확인</button> -->
            </div>
        </form>
        
        <div class="letter">
            ----------또는----------
        </div>
        
        <div class="inner_box Btn" id="login_signup">
            <a href="login.jsp">
                <button class = "twoBtn" id="loginBtn" type="text">로그인</button>
            </a>
            <a href="signup.jsp"> 
                <button class = "twoBtn" id="signupBtn" type="text">회원가입</button>
            </a>
        </div>

        <footer>
            <a href="pwCheck.jsp">
                <span class="letter">
                    비밀번호 재설정
                </span>
            </a>
        </footer>
    </div>
    
</body>
