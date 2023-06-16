<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container my-3">
	<div class="d-flex flex-row justify-content-between align-items-center my-4">
		<h1>Expense Details</h1>
		<a href="/">Go back</a>
	</div>
	<div style="" class="">
		<div class="d-flex flex-row justify-content-start">
			<p style="width: 50%">Expense Name:</p>
			<p style="width: 50%">${ expense.name }</p>
		</div>
		<div class="d-flex flex-row justify-content-start">
			<p style="width: 50%">Expense Description:</p>
			<p style="width: 50%">${ expense.description }</p>
		</div>
		<div class="d-flex flex-row justify-content-start">
			<p style="width: 50%">Vendor:</p>
			<p style="width: 50%">${ expense.vendor }</p>
		</div>
		<div class="d-flex flex-row justify-content-start">
			<p style="width: 50%">Amount Spent:</p>
			<p style="width: 50%">$${ String.format('%.2f', expense.amount) }</p>
		</div>
	</div>
</div>
</body>
</html>