<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String articleIdx = request.getParameter("articleIdx");
String userIdx = (String)session.getAttribute("userIdx");
int userIdx2 = Integer.parseInt(userIdx);

int errorCode = 1;
String writerIdx = null;

Class.forName("com.mysql.jdbc.Driver"); //db연결
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");

String sql = "SELECT user_idx FROM article WHERE idx = ?";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,articleIdx);
ResultSet result = query.executeQuery();

result.next();
writerIdx = result.getString(1); // 여기서 가져온값은 int. 데이터베이스에서 INT타입이기때문

if( !writerIdx.equals(userIdx)){ // 두변수의 참조의 비교가아닌, 값을 비교해야한다
    errorCode = 2;  //  삭제권한x
} else{ 
    errorCode = 1; // 삭제권한o
    String sql2 = "DELETE FROM article WHERE idx = ?";  // sql 생성
    PreparedStatement query2 = connect.prepareStatement(sql2);
    query2.setString(1,articleIdx);
    query2.executeUpdate();
}




//+수정삭제버튼은 작성자에게만 보여야한다
%>



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    

    <script>
        var errorCode = <%=errorCode%>
        var writerIdx = <%=writerIdx%>
        var userIdx = <%=userIdx%>

        console.log(errorCode)
        console.log(writerIdx)
        console.log(userIdx)

        if(errorCode == 1){
            alert("삭제되었습니다")
            location.href="../page/main.jsp"
        }
        else if(errorCode == 2){
            alert("삭제권한이 없습니다")
            location.href="../page/main.jsp"
        }
    </script>
</body>
</html>