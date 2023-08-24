<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <%--<<div class="modal-content" >--%>
                    <div class=" tm-mt-big tm-mb-big " >
                        <div class="row">
                            <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                                <div class="modal-content tm-bg-primary-dark tm-block tm-block-h-auto" >
                                    <div class="row">
                                        <div class="col-12">
                                            <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                                        </div>
                                    </div>
                                    <div class="row tm-edit-product-row">
                                        <div class="col-xl-6 col-lg-6 col-md-12">
                                            <form action="<c:url value='/Admin/operateProduct'/>" class="tm-edit-product-form" method="post">
                                                <div class="form-group mb-3">
                                                    <label
                                                            for="name"
                                                    >Product Name
                                                    </label>
                                                    <input
                                                            class="form-control validate"
                                                            id="name"
                                                            name="name"
                                                            type="text"
                                                            placeholder="Product Name"

                                                    />
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label
                                                            for="description"
                                                    >Description</label
                                                    >
                                                    <textarea
                                                            class="form-control validate tm-small"
                                                            id="description"
                                                            name="description"
                                                            placeholder="Description"
                                                            required
                                                            rows="5"
                                                    ></textarea>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label
                                                            for="category"
                                                    >Category</label
                                                    >
                                                    <select
                                                            class="custom-select tm-select-accounts"
                                                            name="category"
                                                            id="category"
                                                    >
                                                        <option>Select Category</option>
                                                        <option value="TOP">TOP</option>
                                                        <option value="BOTTOM">BOTTOM</option>
                                                        <option value="BAG">BAG</option>
                                                        <option value="SNEAKER">SNEAKER</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label
                                                            for="size"
                                                    >Size</label
                                                    >
                                                    <select
                                                            class="custom-select tm-select-accounts"
                                                            name="size"
                                                            id="size"
                                                    >
                                                        <option>Select size</option>
                                                        <option value="M">M</option>
                                                        <option value="L">L</option>
                                                        <option value="XL">XL</option>
                                                        <option value="XXL">XXL</option>
                                                    </select>
                                                </div>
                                                <div class="row">
                                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                        <label
                                                                for="expire_date"
                                                        >Price
                                                        </label>
                                                        <input
                                                                class="form-control validate"
                                                                data-large-mode="true"
                                                                id="expire_date"
                                                                name="price"
                                                                type="text"
                                                                placeholder="Price"
                                                        />
                                                    </div>

                                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                        <label for="stock">Units In Stock
                                                        </label>
                                                        <input
                                                                class="form-control validate"
                                                                id="stock"
                                                                name="stock"
                                                                type="text"
                                                                placeholder="Product in Stock "
                                                        />
                                                    </div>

                                                </div>
                                        </div>


                                        <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                            <div class="tm-product-img-edit mx-auto">
                                                <img alt="Product image" class="img-fluid d-block mx-auto"
                                                     src="img/product-image.jpg">
                                                <i
                                                        class="fas fa-cloud-upload-alt tm-upload-icon"
                                                        onclick="document.getElementById('fileInput').click();"
                                                ></i>
                                            </div>
                                            <div class="custom-file mt-3 mb-3">
                                                <input id="fileInput" style="display:none;" type="file"/>
                                                <input
                                                        class="btn btn-primary btn-block mx-auto"
                                                        onclick="document.getElementById('fileInput').click();"
                                                        type="button"
                                                        value="IMPORT IMAGE NOW"
                                                />
                                            </div>
                                        </div>

                                        <input type="hidden" name="inSec" value="addPro"/>
                                        <div class="col-12">
                                            <button class="btn btn-primary btn-block text-uppercase"
                                                    type="submit">Add Product Now
                                            </button>
                                        </div>
                                        </form>
                                    </div>
                                    <button class="btn btn-default normal mt-3" style="color: white;background:#088178; " data-dismiss="modal" type="button">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

            <%--</div>--%>

        </div>
    </div>

</div>
