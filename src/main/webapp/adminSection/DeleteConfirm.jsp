<!-- Modal -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure to delete this item ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <c:choose>
                    <c:when test="${userID!=null}">
                        <button type="button" class="btn normal"
                                style="background: #088178;color: white; margin-left: 5px; text-align: center;"
                                onclick="window.location.href='/Admin/deleteUser?userNo=${userID}';">Confirm
                        </button>
                    </c:when>
                    <c:when test="${proID!=null}">
                        <button type="button" class="btn normal"
                                style="background: #088178;color: white; margin-left: 5px; text-align: center;"
                                onclick="window.location.href='/Admin/deleteProduct?proNo=${proID}';">Confirm
                        </button>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>

