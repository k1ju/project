<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>

<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.util.ArrayList" %>

<%  request.setCharacterEncoding("utf-8");
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");

    String userId = request.getParameter("id_value");
    String userName = request.getParameter("name_value");
    String userBirth = request.getParameter("birth_value");

    String sql = "SELECT email,pw FROM user WHERE email = ? AND name = ? AND birth = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,userId);
    query.setString(2,userName);
    query.setString(3,userBirth);
    
    ResultSet result = query.executeQuery();

    ArrayList<String> idList = new ArrayList<String>();
    ArrayList<String> pwList = new ArrayList<String>();
    
    while(result.next()){
        String id = result.getString(1);
        String pw = result.getString(2);

        idList.add("\"" + id + "\"");
        pwList.add("\"" + pw + "\"");
    }
%>

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

    <form action="pwChangeOk.jsp">
        <div class="inner_box id_box">
            <input  class='login_input' id="id_input" name="id_value" type="text" placeholder="아이디" required>
        </div>
        <div class="inner_box id_box">
            <input  class='login_input' id="id_input" name="before_pw_value" type="password" placeholder="현재 비밀번호" required>
        </div>
        <div class="inner_box">
            <input  class='login_input' id="id_input" name="after_pw_value" type="password" placeholder="변경할 비밀번호 입력" required>
        </div>
        <div class="inner_box">
            <input  class='login_input' id="id_input"  type="password" placeholder="변경할 비밀번호 입력 확인">
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

<script>

    
<!-- 에러발생 코드 추가-->
</script>
    
</body>
