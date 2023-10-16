<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentURI" value="${pageContext.request.requestURI}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
    // Get the current URI from the request
    String currentURI = (String) request.getAttribute("currentURI");
%>


<nav class="bg-gray-800 mb-4">
    <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8 <c:out value="${contextPath}"></c:out> <c:out value="${currentURI}"></c:out>">
            <div class="relative flex h-16 items-center justify-between">
                <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                    <!-- Mobile menu button-->
                    <button type="button"
                            class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                            aria-controls="mobile-menu" aria-expanded="false">
                        <span class="absolute -inset-0.5"></span>
                        <span class="sr-only">Open main menu</span>
                        <!--
                          Icon when menu is closed.
              
                          Menu open: "hidden", Menu closed: "block"
                        -->
                        <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                        </svg>
                        <!--
                          Icon when menu is open.
              
                          Menu open: "block", Menu closed: "hidden"
                        -->
                        <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                <div class="flex flex-1 items-center md:justify-between sm:items-stretch sm:justify-start">
                    <div class="flex flex-shrink-0 items-center">
                        <img class="h-8 w-auto"
                             src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=500"
                             alt="Your Company">
                    </div>
                    <div class="hidden sm:ml-6 sm:block">
                        <div class="flex space-x-4">
                            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                            <a href="/WebStore" class="${currentURI eq '/WebStore/' ? 'bg-gray-900 border border-gray-300' : ''} text-white rounded-md px-3 py-2 text-sm font-medium"
                               >Dashboard</a>

                            <a href="categories"
                               aria-current="page"
                               class="${currentURI eq '/WebStore/categories.jsp' ? 'bg-gray-900 border border-gray-300' : ''}  <c:if test="${'ayoub' == 'ayoub'}">active</c:if> text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Categories</a>
                        <a href="produits"
                           class="${currentURI eq '/WebStore/produits.jsp' ? 'bg-gray-900 border border-gray-300' : ''}   text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Products</a>
                        <a href="commandes"
                           class="${currentURI eq '/WebStore/commandes.jsp' ? 'bg-gray-900 border border-gray-300' : ''}  text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Commands</a>
                        <a href="ligneCommandeProduit"
                           class="${currentURI eq '/WebStore/ligneCommandeProduit.jsp' ? 'bg-gray-900 border border-gray-300' : ''}  text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Command Product</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div class="sm:hidden" id="mobile-menu">
        <div class="space-y-1 px-2 pb-3 pt-2">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <a href="/" class="bg-gray-900 text-white block rounded-md px-3 py-2 text-base font-medium"
               aria-current="page">Dashboard</a>
            <a href="categories"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Categories</a>
            <a href="produits"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Products</a>
            <a href="commandes"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Commands</a>
            <a href="ligneCommandeProduit"
               class="text-gray-300 hover:bg-gray-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium">Command Product</a>
        </div>
    </div>
</nav>