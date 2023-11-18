<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>

<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "java.util.ArrayList"%>


<%
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");

    String name = request.getParameter("name_value");
    String birth = request.getParameter("birth_value");

    String sql = "SELECT email FROM user WHERE name = ? AND birth = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,name);
    query.setString(2,birth);

    ResultSet result = query.executeQuery();

    ArrayList<String> idList = new ArrayList<String>();
    //ArrayList<String> pwList = new ArrayList<String>();
    
    while(result.next()){
    String result_id = result.getString(1);
    //String result_pw = result.getString(2);
    
    idList.add("\"" + result_id + "\"");
    //pwList.add("\"" + result_pw + "\"");

    }

%> 

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        
        var idList = <%=idList%>
    

        alert("사용자의 이메일은"+idList+"입니다")
        location.href="login.jsp"

        <!-- 에러발생 코드 추가-->
    </script>

    
</body>
</html>