<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- sidebar menu area start -->
<div class="sidebar-menu">
    <div class="sidebar-header">
        <div class="logo">
            <a href="${base }/admin" style="color: white; font-size: 35px;">Doseco</a>
        </div>
    </div>
    <div class="main-menu">
        <div class="menu-inner">
            <nav>
                <ul class="metismenu" id="menu">

                    <li>
                        <a href="javascript:void(0)" aria-expanded="true"> <span>
								Hệ thống </span>
                        </a>
                        <ul class="collapse">
                            <li>
                                <a href="${base }/admin/user">
                                    <span>Tài khoản quản trị </span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:void(0)" aria-expanded="true">
                            <span>Liên hệ / Đơn hàng</span>
                        </a>
                        <ul class="collapse">
                            <li>
                                <a href="${base }/admin/order">
                                    <span>Đơn hàng</span>
                                </a>
                            </li>

<%--                            <li>--%>
<%--                                <a href="${base }/admin/order-product">--%>
<%--                                    <span>Chi tiết Đơn hàng</span>--%>
<%--                                </a>--%>
<%--                            </li>--%>

                            <li>
                                <a href="${base }/admin/contact">
                                    <span>Liên hệ</span>
                                </a>
                            </li>

                            <li>
                                <a href="${base }/admin/subscribe">
                                    <span>Đăng ký</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:void(0)" aria-expanded="true">
                            <span>Sản phẩm / Danh mục </span>
                        </a>
                        <ul class="collapse">
                            <li>
                                <a href="${base }/admin/product">
                                    <i class="fas fa-box"></i>
                                    <span>Sản phẩm</span>
                                </a>
                            </li>

                            <li>
                                <a href="${base }/admin/category-product">
                                    <i class="fas fa-book"></i>
                                    <span>Danh mục Sản phẩm</span>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:void(0)" aria-expanded="true">
                            <span>Nội dung</span>
                        </a>

                        <ul class="collapse">
                            <li>
                                <a href="${base }/admin/report">
                                    <i class="fa fa-chart-bar"></i>
                                    <span>Thống kê </span>
                                </a>
                            </li>

                        </ul>
                    </li>



                </ul>
            </nav>
        </div>
    </div>
</div>