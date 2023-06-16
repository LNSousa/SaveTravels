<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Travels</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container my-3">
		<h1>Safe Travels</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">Expense Name</th>
					<th scope="col">Vendor</th>
					<th scope="col">Amount</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expense" items="${ listOfExpenses }">
					<tr class="align-middle">
						<td scope="row"><a href="/expenses/${ expense.id }"><c:out value="${expense.name}"></c:out></a></td>
						<td><c:out value="${ expense.vendor }"></c:out></td>
						<td>$<c:out value="${ String.format('%.2f', expense.amount) }"></c:out></td>
						<td class="d-flex flex-row justify-content-center">
							<a href="/expenses/<c:out value="${ expense.id }"/>/edit" class="btn btn-success me-2">Edit</a>
							<form action="/expenses/${expense.id}" method="post">
							    <input type="hidden" name="_method" value="delete">
							    <input type="submit" value="Delete" class="btn btn-danger">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="width:60%;" class="mx-auto">
			<h2>Add an expense:</h2>
			<form:form action="/expenses" method="post" modelAttribute="expense">
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