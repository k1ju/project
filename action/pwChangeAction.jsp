<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/pwChange.css">

</head>
<body>

    <div id="container">
        <header>비밀번호변경</header>
        <div id="image_box">
            <img id ="image" src="../image/kakao.png">
        </div>

        <form action="pwChange.jsp">
            <div class="inner_box id_box">
                <input  class='login_input' id="id_input" name="id_value" type="text" placeholder="이메일">
            </div>
            <div class="inner_box">
                <input  class='login_input' id="id_input" name="name_value" type="text" placeholder="이름">
            </div>
            <div class="inner_box">
                <input  class='login_input' id="id_input" name="birth_value" type="text" placeholder="생년월일8자리">
            </div>

            <div class="inner_box Btn" id="submitBtn">
                <input type="submit"id="confirmBtn" value="확인" >
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
            <a href = "idFind.jsp" class="letter">
                아이디찾기
            </a>
        </footer>
    </div>
    
</body>
</html>