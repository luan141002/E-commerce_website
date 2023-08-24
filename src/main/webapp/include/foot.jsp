<script src="admin_dashboard/vendor/jquery/jquery.min.js"></script>
<script src="admin_dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- Core plugin JavaScript-->
<script src="admin_dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="admin_dashboard/js/sb-admin-2.min.js"></script>

<script>
    $(document).ready(function () {

        $("#txtInputTable").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#pro div").filter(function () {
                $(this).toggle($(this).text()
                    .toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>
<script>
    // Lấy phần tử menu được lưu trữ trong localStorage
    var activeMenu = localStorage.getItem('activeMenu');

    // Thêm lớp "active" cho menu được lưu trữ trong localStorage (nếu có)
    if (activeMenu) {
        var menu = document.querySelector('.' + activeMenu);
        if (menu) {
            menu.classList.add('active');
        }
    }

    var menus = document.querySelectorAll('.menu-item');

    menus.forEach(function(menu) {
        menu.addEventListener('click', function() {
            this.classList.add('active');
            localStorage.setItem('activeMenu', this.classList[0]);
        });
    });
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="admin_dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="scrip.js"></script>

<%--
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
