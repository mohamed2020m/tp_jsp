<%-- 
    Document   : ligneCommandeProduit
    Created on : Oct 7, 2023, 4:47:10 PM
    Author     : Leeuw
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ligne Commande Produit</title>
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
                        <h2 class="mt-4 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Create Ligne Commande Produit</h2>
                    </div>

                    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                        <form class="space-y-6" action="ligneCommandeProduit" method="POST">
                            <input name="op" value="add" type="hidden"/>
<!--                            <div>
                                <label for="reference" class="block text-sm font-medium leading-6 text-gray-900">Reference</label>
                                <div class="mt-2">
                                    <input id="reference" name="reference" type="text" required
                                           class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                </div>
                            </div>-->
 
                            <div>
                                <label for="commande_id"
                                       class="block text-sm font-medium leading-6 text-gray-900">Commandes</label>
                                <div class="mt-2">
                                    <select class="select ghost" style="background: white" id="commande_id" name="commande_id">
                                        <c:forEach var="commande" items="${commandes}">
                                            <option value="${commande.getId()}">${commande.getId()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            <div>
                                <label for="produits_id"
                                       class="block text-sm font-medium leading-6 text-gray-900">Produits</label>
                                <div class="mt-2">
                                    <select class="select ghost" style="background: white"  id="produits_id" name="produits_id">
                                        <c:forEach var="produit" items="${produits}">
                                            <option value="${produit.getId()}">${produit.getReference()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            <div>
                                <label for="quantity"
                                       class="block text-sm font-medium leading-6 text-gray-900">Quantity</label>
                                <div class="mt-2">
                                    <input id="quantity" name="quantity" type="number" required min="0"
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
                    <c:if test="${empty ligneCommandeProduits}">
                        <h1 class="text-2xl p-3 text-center">
                            List is empty
                        </h1>
                    </c:if>
                    <c:if test="${not empty ligneCommandeProduits}">

                        <h1 class="text-2xl p-3 text-center">
                            List of ligne Commande Produits
                        </h1>
                        <div class="overflow-scroll">
                            <table class="table bordered bg-white">
                                <thead>
                                    <tr>
                                        <th>Produit</th>
                                        <th>Date de Commande</th>
                                        <th>Quantité</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ligneCommandeProduit" items="${ligneCommandeProduits}">
                                        <tr>
                                            <td>${ligneCommandeProduit.getProduit().getReference()}</td>
                                            <td>${ligneCommandeProduit.getCommande().getDateCommande()}</td>  
                                            <td>${ligneCommandeProduit.getQuantity()}</td>
                                            <td >
                                                <div class="flex flex-wrap gap-2">
                                                    <button 
                                                        data-modal-target="ligneCommandeProduit-modal" data-modal-toggle="ligneCommandeProduit-modal"
                                                        onclick="showModal(${ligneCommandeProduit.getProduit().getId()}, ${ligneCommandeProduit.getCommande().getId()}, ${ligneCommandeProduit.getQuantity()})"
                                                        class="btn solid info">Edit</button>
                                                    <form action="ligneCommandeProduit" method="post">
                                                        <input type="hidden" name="op" value="delete" />
                                                        <input type="hidden" name="produit_id" value="${ligneCommandeProduit.getProduit().getId()}" />
                                                        <input type="hidden" name="commande_id" value="${ligneCommandeProduit.getCommande().getId()}" />
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



                <div id="ligneCommandeProduit-modal" tabindex="-1" aria-hidden="true"
                     class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
                    <div class="relative w-full max-w-md max-h-full">
                        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                            <button type="button"
                                    class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                    data-modal-hide="ligneCommandeProduit-modal">
                                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                     viewBox="0 0 14 14">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                </svg>
                                <span class="sr-only">Close modal</span>
                            </button>
                            <div class="px-6 py-6 lg:px-8">
                                <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Update Ligne Commande Produit</h3>
                                <form class="space-y-6" action="ligneCommandeProduit" method="post">
                                    <input type="hidden" name="op" value="update" />
                                    <input type="hidden" name="pre_produit_id" id="pre_produit_id" />
                                    <input type="hidden" name="pre_commande_id" id="pre_commande_id" />
                                    
                                    <div>
                                        <label for="up_commande_id"
                                               class="block text-sm font-medium leading-6 text-white">Commandes</label>
                                        <div class="mt-2">
                                            <select class="select ghost" style="background: white" id="up_commande_id" name="up_commande_id">
                                                <c:forEach var="commande" items="${commandes}">
                                                    <option value="${commande.getId()}">${commande.getId()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div>
                                        <label for="up_produits_id"
                                               class="block text-sm font-medium leading-6 text-white">Produits</label>
                                        <div class="mt-2">
                                            <select class="select ghost" style="background: white" id="up_produits_id" name="up_produits_id">
                                                <c:forEach var="produit" items="${produits}">
                                                    <option value="${produit.getId()}">${produit.getReference()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div>
                                        <label for="up_quantity"
                                               class="block text-sm font-medium leading-6 text-white">Quantity</label>
                                        <div class="mt-2">
                                            <input id="up_quantity" name="up_quantity" type="number" required min="0"
                                                   class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                        </div>
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
            function showModal(produit_id, commande_id, quantity) {
                const m = document.getElementById('ligneCommandeProduit-modal');

                document.querySelector("#up_quantity").value = quantity;
                document.querySelector("#pre_produit_id").value = produit_id;
                document.querySelector("#pre_commande_id").value = commande_id;
                
                const up_commande = document.querySelector("#up_commande_id").options;
                const up_produits = document.querySelector("#up_produits_id").options;
                
               
                for (var i = 0; i < up_commande.length; i++) {
                    if (up_commande[i].value == commande_id) {
                        up_commande[i].selected = true;
                        break;
                    }
                }
               
                for (var i = 0; i < up_produits.length; i++) {
                    if (up_produits[i].value == produit_id) {
                        up_produits[i].selected = true;
                        break;
                    }
                }
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
