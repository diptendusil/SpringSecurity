<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
	.list {
		padding-left:20px;
		padding-right:20px;
	}
	
	.list + .list {
		border-left:1px solid black;
	}
	
	th.list {
		border-bottom:2px solid black;
	}
</style>

<script>
	function check() {
		if(document.getElementById("firstName").value == "") {
			alert("First Name is required");
			return false;
		}
		else if(document.getElementById("lastName").value == "") {
			alert("Last Name is required");
			return false;
		}
		else if(document.getElementById("email").value == "") {
			alert("Email is required");
			return false;
		}
		else if(document.getElementById("telephone").value == "") {
			alert("Telephone is required");
			return false;
		}
		else {
			return true;
		}
	}
</script>

</head>
<body>
	<h2>Employee Management Information</h2>
	<h3><a href="<c:url value='j_spring_security_logout'/>">Logout</a></h3>
	<form:form method="POST" onsubmit="return check()" action="add" commandName="employee">
		
		<table>
			
			<tr>
				<td>
					<%-- <form:label path="firstName">
						<spring:message code="label.firstname"/>
					</form:label> --%>
					Id
				</td>
				
				<td>
					<form:input path="id" readonly="true" disabled="true"/>
				</td>
			</tr>
		
			<tr>
				<td>
					<form:label path="firstName">
						<spring:message code="label.firstname"/>
					</form:label>
				</td>
				
				<td>
					<form:input path="firstName"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<form:label path="lastName">
						<spring:message code="label.lastname"/>
					</form:label>
				</td>
				
				<td>
					<form:input path="lastName"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<form:label path="email">
						<spring:message code="label.email"/>
					</form:label>
				</td>
				
				<td>
					<form:input path="email"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<form:label path="telephone">
						<spring:message code="label.telephone"/>
					</form:label>
				</td>
				
				<td>
					<form:input path="telephone"/>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="<spring:message code="label.add"/>"/>
				</td>
				
			</tr>
			
		</table>
		
	</form:form>
	
	<h3>Employee Information</h3>
	
	<c:if test="${!empty employeeList }">
		<table>
			<tr>
				<th class="list">ID</th>
				<th class="list">Name</th>
				<th class="list">Email</th>
				<th class="list">Telephone</th>
				<th class="list">Action</th>
			</tr>
			
			<c:forEach items="${employeeList }" var="emp">
				<tr>
					<td class="list">${emp.id }</td>
					<td class="list">${emp.firstName }&nbsp;${emp.lastName }</td>
					<td class="list">${emp.email }</td>
					<td class="list">${emp.telephone }</td>
					<td class="list"><a href="delete/${emp.id }">Delete</a></td>
					
				</tr>
			</c:forEach>
			
		</table>
	</c:if>
	
	
</body>
</html>