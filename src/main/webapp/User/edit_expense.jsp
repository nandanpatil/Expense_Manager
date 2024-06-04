<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Expense"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/components/navbar.jsp" %>
<%@include file="/components/all_css.jsp" %>
<c:if test="${empty loginuser}">
	<c:redirect url="../login.jsp"> </c:redirect>
</c:if>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
	Expense ex= dao.getExpenseById(id);

%>

<div class="container p-3">
<div class="row">
<div class="col-md-4 offset-md-4">

<div class="card p-3">
<div class="card-header text-center">
<p class="fs-3">Edit Expense</p>
<c:if test="${not empty msg}">
<p class="text-center text-success fs-4">${msg} 	</p>
</c:if>
</div>
<div class="card-body">


	 <form action="../updateExpense" method="post">
			 <div class="mb-3">
			 <label>Title</label>
			 <input type="text" name="title" class="form-control" value="<%=ex.getTitle()%>">
			 </div>
			 
			  <div class="mb-3">
			 <label>Date</label>
			 <input type="date" name="date" value="<%=ex.getDate()%>" class="form-control">
			 </div>
			 
			 <div class="mb-3">
			 <label>Time</label>
			 <input type="time" name="time" value="<%=ex.getTime()%>" class="form-control">
			 </div>
			 
			 <div class="mb-3">
			 <label>Description</label>
			 <input type="text" name="description" value="<%= ex.getDescription()%>" class="form-control">
			 </div>
			 
			 <div class="mb-3">
			 <label>Price</label>
			 <input type="text" name="price" value="<%=ex.getPrice()%>" class="form-control">
			 </div>
			 
			 <input type="hidden" name="id" value="<%=ex.getId()%>">
			 
			 <button class="btn btn-success col-md-12">Update</button>
	 </form>



</div>


</div>

</div>
</div>

</div>


</body>
</html>