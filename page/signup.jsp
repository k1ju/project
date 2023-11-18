<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/signup.css">
</head>
<body>

    <div id ="container">
        <header>회원가입</header>

        <div id= 'image_box'>
            <img id="image"src="../image/kakao.png">
        </div>
        
        <div id="inner_container">
            <form action="../action/signupAction.jsp">
                <fieldset>
                    <legend>정보입력</legend>
                    <div id="id_box" class="box">
                        <input class="user_info" type="text" name="id_value" placeholder="사용할 이메일" autofocus >
                    </div>
                    <div id="pw_box" class="box">
                        <input class="user_info" type="password" id="pw_value" name="pw_value" placeholder="사용할 비밀번호" onclick="checkPw()" >
                    </div>

                    <div id="pw_box" class="box">
                        <input class="user_info" type="password" id="pw_value_check" name="pw_value_check" placeholder="비밀번호 확인" onclick="checkPw()" >
                    </div>
                
                    <div class="box">
                        <input class="user_info" type="text" name="name_value" placeholder="이름" >
                    </div>
                    <div class="box">
                        <input class="user_info" type="text" name="birth_value" placeholder="생년월일 8자리" >
                    </div>

                    <p id="banner"></p>

                    <div id="signup_Btn_box">
                        <a href="login.jsp">
                            <input id= "signup_Btn" type = "submit" value="가입완료">
                        </a>    
                    </div>
                    
                </fieldset>
            </form>

            <a href="login.jsp">
                <button class = "twoBtn" id="loginBtn" type="text">로그인</button>
            </a>
            

        </div>    
    </div>
 
    <script>
        function checkPw(){ // 비밀번호 일치확인 함수
        var pwValue = document.getElementById("pw_value").value
        var pwValueCheck = document.getElementById("pw_value_check").value

        if(pwValue != pwValueCheck){
            console.log("비밀번호 불일치확인")
            document.getElementById("banner").innerHTML="비밀번호가 일치하지않습니다"
            document.getElementById("banner").style.color="red"
            document.getElementById("banner").style.fontSize="12px"
        }else{
            console.log("비밀번호 일치확인")
            document.getElementById("banner").innerHTML="비밀번호 일치"
            document.getElementById("banner").style.color="green"
            document.getElementById("banner").style.fontSize="12px"
        }
        }
        var pwValue = document.getElementById("pw_value").value
        var pwValueCheck = document.getElementById("pw_value_check").value

        console.log(pwValue)
        console.log(pwValueCheck)


        

    </script>
    
</body>
