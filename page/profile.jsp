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
String sql = "SELECT name,email,birth,signup_date,profile FROM user WHERE idx = ? "; //사용자의 정보 조회하기
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,userIdx); // 세션입력시 타입 문자형->숫자형 전환
ResultSet result = query.executeQuery();

String sql2 = "SELECT a.idx,a.title,a.write_date,u.name FROM article a"; // 게시글 정보 불러오기
sql2 += " JOIN user u ON user_idx = u.idx  WHERE a.user_idx = ? ";
PreparedStatement pstmt = connect.prepareStatement(sql2);
pstmt.setString(1,userIdx); 
ResultSet rs = pstmt.executeQuery();

result.next();
String userName = result.getString(1);
String userId = result.getString(2);
String userBirth = result.getString(3);
String userSignupDate = result.getString(4);
String userProfile = null;
if(result.getString(5) == null || result.getString(5) == ""){
    userProfile = "내용없음";
}else{
    userProfile = result.getString(5);
}

ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();
    while(rs.next()){ // sql2 결과 불러오기
        ArrayList<String> articleItem = new ArrayList<String>();
        
        String articleIdx = rs.getString(1);
        String title = rs.getString(2);
        String writeDate = rs.getString(3);
        String name = rs.getString(4);

        articleItem.add("\"" + articleIdx + "\"");
        articleItem.add("\"" + title + "\"");
        articleItem.add("\"" + writeDate + "\"");
        articleItem.add("\"" + name + "\"");
        
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
        <div id="info_container" class = "box">
            <p class="title">-------계정 프로필-------</p>
            <p>이름 : <%=userName%></p>
            <p>이메일 : <%=userId%> </p>
            <p>생일 : <%=userBirth%></p>
            <p>가입일 : <%=userSignupDate%></p>
            <p>프로필 : <%=userProfile%></p>
                
        </div>

        <div id="button_container">
            <div class="Btn_box">
                <a href="profileUpdate.jsp">
                    <button class="Btn">정보수정</button>
                </a>
            </div>
            <div class="Btn_box">
                <a href="pwCheck.jsp">
                    <button class="Btn">비밀번호 재설정</button>
                </a>
            </div>
            <div class="Btn_box">
                <a href="deleteUser.jsp">
                    <button class="Btn">회원탈퇴</button>
                </a>
            </div>
        </div>
    </div>

    <div id="list_container">
        <p class="title">--------내가 쓴 글--------</p>
        <% for( int i=0; i<articleList.size(); i++) { %>
        <p>
            <a href="article.jsp" onclick="transferValue(articleList.get(0))">

            </a>
        </p>

        <p class="title">--------내가 쓴 댓글--------</p>
        
        <% } %>

    </div>
    

    <script>
        var userIdx = <%=userIdx%>
        console.log(userIdx)

        function transferValue(e){

            location.href = "article.jsp?" + e
        }

    </script>
</body>
</html>