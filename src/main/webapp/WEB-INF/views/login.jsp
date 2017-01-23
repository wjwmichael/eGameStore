<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper" >
    <div class="container login-container">
        <div class="login-box">

            <h2>Login with Username and Password</h2>

            <c:if test="${not empty msg}">
                <div class="msg">
                    ${msg}
                </div>
            </c:if>
            <form action="<c:url value="/j_spring_security_check"/> " name="loginForm" method="post">
                <div class="form-group">
                    <c:if test="${not empty error}">
                        <div class="error" style="color: #ff0000;">
                                ${error}
                        </div>
                    </c:if>
                    <label for="username">User:</label>
                    <input type="text "id="username" name="username" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control">
                </div>
                <input type="hidden" value="${_csrf.value}" name="${_csrf.parameterName}"/>
                <input type="submit" value="Submit" class="btn btn-primary">
            </form>
        </div>
    </div>
