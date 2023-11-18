<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
String titleValue = request.getParameter("title_value");
String contentValue = request.getParameter("content_value");
String userIdx = (String)session.getAttribute("userIdx"); // session에서 값을 불러올때는 문자형타입으로 전환, getAttribute메소드 이용
int errorCode = 1;

if(titleValue.isEmpty()){
    errorCode = 2; // 타이틀이 널값인경우
    //response.sendRedirect("../page/articleWrite.jsp");
} else if(contentValue.isEmpty()) {
    errorCode = 3; // 내용이 널값인경우
}

Class.forName("com.mysql.jdbc.Driver");
String dbURL = "jdbc:mysql://localhost/project";
String dbID = "stageus";
String dbPassword = "1234";

Connection connect = DriverManager.getConnection(dbURL,dbID,dbPassword);

String sql = "INSERT INTO article(title,content,user_idx) VALUES(?,?,?)";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,titleValue);
query.setString(2,contentValue);
query.setString(3,userIdx);

query.executeUpdate();

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <script>
        var errorCode = <%=errorCode%>
        var userIdx = <%=userIdx%>

        console.log(errorCode)
        console.log(userIdx)

        if(errorCode==1){
            alert("게시글 작성완료")
            location.href="../page/main.jsp"
        } else if(errorCode==2){
            alert("제목을 입력해주세요")
            location.href="../page/articleWrite.jsp"
        } else if(errorCode==3){
            alert("내용을 입력해주세요")
            location.href="../page/articleWrite.jsp"
        }

    </script>
</body>
</html>