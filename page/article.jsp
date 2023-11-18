<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet" %>

<%
request.setCharacterEncoding("utf-8");

String articleIdx = request.getParameter("articleIdx"); //get파라미터로 pagenum받아오기

String userIdx = null; // 세션 검사, 문자형
if(session.getAttribute("userIdx") != null){
    userIdx = (String)session.getAttribute("userIdx");
}else{
    response.sendRedirect("logoutAction.jsp");
}

Class.forName("com.mysql.jdbc.Driver"); //db연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");
String contentSQL = "SELECT a.title, a.content, a.write_date, u.name FROM article a ";
contentSQL += "JOIN user u ON a.user_idx = u.idx WHERE a.idx = ? ";
PreparedStatement contentQuery = connect.prepareStatement(contentSQL);
contentQuery.setString(1,articleIdx);

ResultSet contentResult = contentQuery.executeQuery();

String title = null;
String content = null;
String write_date = null;
String name = null;

while(contentResult.next()){
    title = contentResult.getString(1);
    content = contentResult.getString(2);
    write_date = contentResult.getString(3);
    name = contentResult.getString(4);
}

//댓글 불러오기 쿼리 - articleIdx가 현재인것들 댓글 불러오기
// 조회수기능 추가 - db에 컬럼추가, 조회수 +1해서 update 쿼리

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/article.css">

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

    <div id="bbs">
        <div id="bbs_title">
            게시판
        </div>

        <div id="bbsArticle">
            <table id="article_info">
                <tr>
                    <th class="article_header">제목</th>
                    <td><%=title%></td>
                </tr>
                <tr>
                    <th class="article_header">작성자</th>
                    <td> <%=name%> </td>
                    <th class="article_header">작성일</th>
                    <td> <%=write_date.substring(0,13) + "시" + write_date.substring(14,16)+"분" %> </td>
                </tr>
                <tr>
                    <th class="article_header">글번호</th>
                    <td> <%=articleIdx%> </td>
                    <th class="article_header">조회수</th>
                    <td>추가예정</td>
                </tr>
                <tr>
                    <td>
                        <button class = "article_header" onclick="moveTo('articleUpdateAction.jsp')">수정</button>
                    </td>
                    <td>
                        <button class = "article_header" onclick="moveTo('articleDeleteAction.jsp')">삭제</button>
                    </td>
                </tr>
                
            </table>

            <p>
                <%=content%>
            </p>
        </div>
    </div>

    <div id="comment_container">
        

    </div>

    <script>
        var articleIdx = <%=articleIdx%>
            console.log(articleIdx)
            
        function moveTo(e){
            var articleIdx = <%=articleIdx%>
            console.log(articleIdx)

            console.log(e)
            location.href =  "../action/" + e + "?articleIdx=" + articleIdx
        }
    </script>

</body>
</html>