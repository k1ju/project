<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import = "java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "javax.swing.JOptionPane"%>
<%@ page import = "java.util.regex.Pattern"%>
<%
request.setCharacterEncoding("utf-8");
String userId = request.getParameter("id_value");
String userPw = request.getParameter("pw_value");
String userPwCheck = request.getParameter("pw_value_check");
String userName = request.getParameter("name_value").trim();
String userBirth = request.getParameter("birth_value");

String pattern = "^[A-z0-9]+@[A-z0-9]+$"; // 이메일 정규표현식
int errorCode = 1;
userBirth.replaceAll("[^0-9]","");

//백엔드 예외처리(변수값가지고)
//각각의 값들이 널값이면 alert띄우고, sendRedirect로 다시 돌려보냄

Class.forName("com.mysql.jdbc.Driver");
Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");

String selectSql = "SELECT * FROM user WHERE email = ? ";
PreparedStatement selectQuery = connect.prepareStatement(selectSql);
selectQuery.setString(1,userId);

ResultSet rs = selectQuery.executeQuery();

boolean patternResult = Pattern.matches(pattern,userId);

//+글자수 체크
if(rs.next()){
    errorCode = 2; //아이디 중복

} else{ // 중복데이터가 없다면
    if(userId.isEmpty() ||  userPw.isEmpty() ||  userPwCheck.isEmpty()  ||  userName.isEmpty()  || userBirth.isEmpty() ){
        errorCode = 3; // 필수값 미입력
     
    }else if(!( userPw.equals( userPwCheck))){
        System.out.println("비밀번호가 일치하지않습니다");
        errorCode = 4; // 비밀번호 불일치

        response.sendRedirect("../page/login.jsp");
             
    }else if(!(patternResult)){ 
        errorCode = 5;  //이메일 형식불일치
             
    }else{ // 회원가입 성공,errorCode = 1
        String insertSql ="INSERT INTO user(email,pw,name,birth) VALUES(?,?,?,?)";
        PreparedStatement insertQuery = connect.prepareStatement(insertSql);
        insertQuery.setString(1,userId);
        insertQuery.setString(2, userPw);
        insertQuery.setString(3, userName);
        insertQuery.setString(4,userBirth); 

        int result = insertQuery.executeUpdate();
    }
}

// 버튼하나로 아이디 중복기능 구현하기
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

   <script>
        var errorCode = <%=errorCode%>
        var patternResult = <%=patternResult%>
        var  userName = "<%= userName%>"
        
        console.log(errorCode)
        console.log(patternResult)
        console.log( userName)

        if(errorCode == 1){
            alert("회원가입 성공")
            location.href="../page/login.jsp"
        }else if(errorCode == 2){
            alert("아이디 중복")
            location.href="../page/login.jsp"
        } else if(errorCode == 3){
            alert("필수값들을 입력해주세요")
            location.href="../page/login.jsp"
        }else if(errorCode == 4){
            alert("비밀번호 불일치")
            location.href="../page/login.jsp"
        }else if(errorCode == 5){
            alert("이메일 형식 불일치")
            location.href="../page/login.jsp"
        }

   </script>
    
</body>
