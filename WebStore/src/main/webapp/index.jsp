<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Sotre</title>
        <link rel="icon" href="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=500" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sira-ui/tailwind/dist/css/styles.css" />
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    </head>
    <body>
        <div class="flex flex-col w-full h-screen bg-gray-200">
            <%@include file="includes/navbar.jsp" %>
            <c:set var="contextPath" value="${pageContext.request.contextPath}" />
            <%--<c:out value="${contextPath}"></c:out>--%>
            <div class="flex justify-center">
                <img width='150' height="150" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=500"  alt="Your Company">
            </div>
            
            <section class="grid grid-cols-12 gap-5 container w-[80%] m-auto">
                <a href="${contextPath}/categories"
                    class="bg-white border border-blue-500 overflow-hidden rounded-lg has-shadow w-80 h-[120px] p-4 flex flex-col gap-2 col-span-4 hover:cursor-pointer transform transition-transform duration-300 has-shadow hover:scale-105">
                    <div class="flex justify-center  w-full h-full items-center">
                        <img width="80" height="80" src="<c:url value='/resources/images/category.png' />" alt="category" />
                        <h3 class="text-xl ms-2 font-semibold">Categories</h3>
                    </div>
                </a>
                <a href="${contextPath}/produits"
                    class="bg-white border border-green-500 overflow-hidden rounded-lg has-shadow w-80 h-[120px] p-4 flex flex-col gap-2 col-span-4 hover:cursor-pointer transform transition-transform duration-300 has-shadow hover:scale-105">
                    <div class="flex justify-center  w-full h-full items-center">
                        <img width="80" height="80" src="<c:url value='/resources/images/commande.png' />" alt="commande" />
                        <h3 class="text-xl ms-2 font-semibold">Products</h3>
                    </div>
                </a>
                <a href="${contextPath}/commandes"
                    class="bg-white border border-red-500 overflow-hidden rounded-lg has-shadow w-80 h-[120px] p-4 flex flex-col gap-2 col-span-4 hover:cursor-pointer transform transition-transform duration-300 has-shadow hover:scale-105">
                    <div class="flex justify-center  w-full h-full items-center">
                        <img width="80" height="80" src="<c:url value='/resources/images/products.png' />" alt="products" />
                        <h3 class="text-xl ms-2 font-semibold">Commands</h3>
                    </div>
                </a>
                <div class="col-span-4"></div>
                <a href="${contextPath}/ligneCommandeProduit"
                    class="bg-white border border-yellow-500 overflow-hidden rounded-lg has-shadow w-80 h-[120px] p-4 flex flex-col gap-2 col-span-4 hover:cursor-pointer transform transition-transform duration-300 has-shadow hover:scale-105">
                    <div class="flex justify-center  w-full h-full items-center">
                        <img width="80" height="80" src="<c:url value='/resources/images/product_commande.png' />" alt="product_commande.png" />
                        <h3 class="text-xl ms-2 font-semibold">Command Product</h3>
                    </div>
                </a>
            </section>
        </div>

    </body>
</html>
