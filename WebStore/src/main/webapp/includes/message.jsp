<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty status}">
    <div class="prompt ${status} w-[60%] m-auto mt-3">
        <div class="content">
            <p>
                ${message}
            </p>
        </div>
    </div>
</c:if>

<c:remove var="message" scope="session"/>
<c:remove var="status" scope="session"/>