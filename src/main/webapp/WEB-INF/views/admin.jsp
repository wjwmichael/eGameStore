<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="template/header.jsp"%>



<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Administrator Page</h1>
            <p class="lead">This is the administrator page</p>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>
                Welcome to the admin page,${pageContext.request.userPrincipal.name}
                | <a href="<c:url value="/j_spring_security_logout"/> ">Logout</a>
            </h2>
        </c:if>
        <h3><a href="<c:url value="/admin/productInventory" /> ">Product Inventory</a></h3>
        <a href=" <c:url value="/admin/productInventory/addProduct" />" class="btn btn-primary" >Add Product</a>
        <%@include file="template/footer.jsp"%>
