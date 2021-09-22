
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title><c:out value="${page}"></c:out> todo</title>
  </head>
  <body style="background-color: #F5DEB3">
  	<div class="container mt-5">
  		<h1 class="text-center" style="background-color: #FFFACD; height: 100px;">My Daily Todos</h1>
  		
  		
  		<c:if test="${not empty msg}">
  			<div class="alert alert-success">
  				<b><c:out value="${msg}"></c:out></b>
  			</div>
  		</c:if>
  		
  		
  		
  		
  		<div class="row mt-3">
  			<div class="col-md-3">
  				
  				<ul class="list-group">
				  <li class="list-group-item active">Menu List</li>
				  
				  <a href="<c:url value='/add'></c:url>" class="list-group-item">Add Todo</a>
				  
				  <a href="<c:url value='/home'></c:url>" class="list-group-item">View Todo</a>
				</ul>


  			</div>
  			<div class="col-md-9">
  				<c:if test="${page=='HOME'}">
  					<h1 class="text-center">All Todos</h1>
  					
  					<c:forEach items="${todoList}" var="t">
  						<div class="card">
  							<div class="card-body">
  								<h3>
  									<c:out value="${t.todoTitle}"></c:out>
  								</h3>
  								<p>
  									<c:out value="${t.todoContent}"></c:out>
  								</p>
  							</div>
  						</div>
  					
  					</c:forEach>
  					
  				</c:if>
  				
  				
  				
  				
  				
  				
  				<c:if test="${page=='add'}">
  					<h1 class="text-center">Add Todo</h1>
  					
  					<form:form action="saveTodo" method="post" modelAttribute="todo">
  						<div class="form-group">
  							<form:input path="todoTitle" cssClass="form-control" placeholder="" />
  						</div>
  						
  						<div class="form-group">
  							<form:textarea path="todoContent" cssClass="form-control" placeholder="" 
  								cssStyle="height:300px;"/>
  						</div>
  						
  						<div class="container text-center">
  							<button class="btn btn-outline-success">Add todo</button>
  						</div>
  						
  					</form:form>
  					
  				</c:if>
  				
  			</div>
  		</div>
  	</div>  
    
  </body>
</html>