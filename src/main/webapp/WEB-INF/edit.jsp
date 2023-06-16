<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
	<div class="d-flex flex-row justify-content-between align-items-center my-4">
		<h1>Edit Expense</h1>
		<a href="/">Go back</a>
	</div>
	<form action="/expenses/<c:out value='${ expense.id }'/>"></form>
	<div style="width:60%;" class="mx-auto">
			<h2>Add an expense:</h2>
			<form:form action="/expenses/${expense.id}" method="post" modelAttribute="expense">
    			<input type="hidden" name="_method" value="put">
				<div class="my-3">
					<form:label path="name" class="form-label">Expense name:</form:label><br/>
					<form:errors path="name" style="color:red"/>
					<form:input type="text" class="form-control" path="name"/>
				</div>
				<div class="my-3">
					<form:label path="vendor" class="form-label">Vendor name:</form:label><br/>
					<form:errors path="vendor" style="color:red"/>
					<form:input type="text" class="form-control" path="vendor"/>
				</div>
				<div class="my-3">
					<form:label path="amount" class="form-label">Amount:</form:label><br/>
					<form:errors path="amount" style="color:red"/>
					<form:input type="text" class="form-control" path="amount"/>
				</div>
				<div class="my-3">
					<form:label path="description" class="form-label">Description:</form:label><br/>
					<form:errors path="description" style="color:red"/>
					<form:textarea path="description" class="form-control" cols="30" rows="10"></form:textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
		</div>
</div>
</body>
</html>