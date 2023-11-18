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

Class.forName("com.mysql.jdbc.Driver"); //db연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");
String sql = "SELECT a.*,name FROM article as a ";
sql += "JOIN user as u ON a.user_idx = u.idx order by write_date DESC"; // 모든게시글 불러오기
PreparedStatement query = connect.prepareStatement(sql);

ResultSet result = query.executeQuery();

ArrayList<ArrayList<String>> articleList = new ArrayList<ArrayList<String>>();

while(result.next()){
    ArrayList<String> articleItem = new ArrayList<String>();

    String articleIdx = result.getString(1);
    String title = result.getString(2);
    String content = result.getString(3);
    String writeDate = result.getString(4);
    String writerIdx = result.getString(5);
    String name = result.getString(6);

    articleItem.add(articleIdx);
    articleItem.add(title);
    articleItem.add(content);
    articleItem.add(writeDate);
    articleItem.add(writerIdx);
    articleItem.add(name);

    articleList.add(articleItem);
}


%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/CSS" href="../css/main.css?after">

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

        <div id="header_right">
            <div class="Btn_box">
                <a href="articleWrite.jsp">
                    <button class="Btn">글쓰기</button>
                </a>
            </div>
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

        <table id="article_list">
            <thead>
                <tr>
                    <th class="article_header">번호</th>
                    <th class="article_header">제목</th>
                    <th class="article_header">작성일</th>
                    <th class="article_header">작성자</th>
                </tr>
            </thead>

        <%for(int i=0; i< articleList.size(); i++){ %>
        <!-- 제목의 개수만큼 반복 -->
            <tbody>
                <tr>
                    <td><%=articleList.get(i).get(0)%></td>
                    <td>
                        <a id ="article_atag" onclick="transferValue(<%=articleList.get(i).get(0)%>)">
                            <!-- article.jsp?idxValue=6 -->
                            <%=articleList.get(i).get(1)%>
                        </a>
                    </td>
                    <td><%=articleList.get(i).get(3).substring(0,13) + "시" +articleList.get(i).get(3).substring(14,16) + "분"   %></td>
                    <td><%=articleList.get(i).get(5)%></td>
                </tr>
            </tbody>
        <%} %>
        </table>

<script>

    function transferValue(e){
        console.log(e)
        location.href = "article.jsp?articleIdx=" + e

    }

</script>
    
</body>
</html>