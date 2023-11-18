<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String userId = (String)session.getAttribute("userId");

Class.forName("com.mysql.jdbc.Driver");
Connection connect =  DriverManager.getConnection("jdbc:mysql://localhost/project","stageus","1234");

String sql = "DELETE FROM user WHERE email = ?";
PreparedStatement query = connect.prepareStatement(sql);
query.setString(1,userId);

int result = query.executeUpdate();

if(result ==1){
    session.invalidate();
    response.sendRedirect("login.jsp");
} else {}
%>










