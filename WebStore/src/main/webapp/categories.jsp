<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <link rel="icon" href="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=500" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sira-ui/tailwind/dist/css/styles.css" />
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="flex flex-col w-full bg-gray-200">
            <%@include file="includes/navbar.jsp" %>
            <section class="flex flex-col ">
                <div class="flex mb-10 flex-col justify-center w-full">
                    <%@include file="includes/message.jsp" %>
                    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                        <h2 class="mt-4 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Create
                            Categorie</h2>
                    </div>

                    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form class="space-y-6" action="categories" method="POST">
                            <input name="op" value="add" type="hidden"/>
                            <div>
                                <label for="code" class="block text-sm font-medium leading-6 text-gray-900">Code</label>
                                <div class="mt-2">
                                    <input id="code" name="code" type="text" required
                                           class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>

                            <div>
                                <label for="libelle"
                                       class="block text-sm font-medium leading-6 text-gray-900">Libelle</label>
                                <div class="mt-2">
                                    <input id="libelle" name="libelle" type="text" required
                                           class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>


                            <div>
                                <button type="submit"
                                        class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Create</button>
                            </div>
                        </form>

                    </div>
                </div>

                <div class="w-[60%] m-auto mb-10">
                    <c:if test="${empty categories}">
                        <h1 class="text-2xl p-3 text-center">
                            List is empty
                        </h1>
                    </c:if>
                    <c:if test="${not empty categories}">

                        <h1 class="text-2xl p-3 text-center">
                            List of categories
                        </h1>
                        <div class="overflow-scroll">
                            <table class="table bordered bg-white">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Code</th>
                                        <th>Libelle</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="categorie" items="${categories}">
                                        <tr>
                                            <th>${categorie.getId()}</th>
                                            <td>
                                                ${categorie.getCode()}
                                            </td>
                                            <td>${categorie.getLibelle()}</td>
                                            <td >
                                                <div class="flex flex-wrap gap-2">
                                                    <button 
                                                        data-modal-target="categorie-modal" data-modal-toggle="categorie-modal"
                                                        onclick="showModal(${categorie.getId()}, '${categorie.getCode()}', '${categorie.getLibelle()}')"
                                                        class="btn solid info">Edit</button>
                                                    <form action="categories" method="post">
                                                        <input type="hidden" name="op" value="delete" />
                                                        <input type="hidden" name="id" value="${categorie.getId()}" />
                                                        <button  type="submit" class="btn solid danger">Delete</button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                </div>

                <div id="categorie-modal" tabindex="-1" aria-hidden="true"
                     class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
                    <div class="relative w-full max-w-md max-h-full">
                        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                            <button type="button"
                                    class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                    data-modal-hide="categorie-modal">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                     viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                            <div class="px-6 py-6 lg:px-8">
                                <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Update Categorie</h3>
                                <form class="space-y-6" action="categories" method="post">
                                    <input type="hidden" name="op" value="update" />
                                    <input type="hidden" name="id" id="catId" />
                                    <div>
                                        <label for="updateCode"
                                               class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Code</label>
                                        <input type="text" name="code" id="updateCode"
                                               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                                               required>
                                    </div>
                                    <div>
                                        <label for="updateLibelle"
                                               class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Libelle</label>
                                        <input type="text" name="libelle" id="updateLibelle"
                                               class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white"
                                               required>
                                    </div>
                                    <button type="submit"
                                            class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


            </section>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
        <script>
            function showModal(id, code, libelle) {
                console.log("Category ID: " + id);
                console.log("Category Code: " + code);
                console.log("Category Libelle: " + libelle);
                const m = document.getElementById('categorie-modal');
                document.querySelector("#catId").value = id;
                document.querySelector("#updateLibelle").value = libelle;
                document.querySelector("#updateCode").value = code;
                const options = {
                    placement: 'bottom-right',
                    backdrop: 'dynamic',
                    backdropClasses: 'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
                    closable: true,
                    onHide: () => {
                        console.log('modal is hidden');
                    },
                    onShow: () => {
                        console.log('modal is shown');
                    },
                    onToggle: () => {
                        console.log('modal has been toggled');
                    }
                };
                const modal = Modal(m, options);
                modal.show();
            }
        </script>
    </body>
</html>
