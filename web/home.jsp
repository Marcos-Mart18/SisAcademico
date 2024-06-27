<%-- 
    Document   : index
    Created on : 6 jun 2024, 7:18:27
    Author     : Docente
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "must-revalidate");
    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    String user = "";
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("username") == null) {
%>
<jsp:forward page="index.jsp">
    <jsp:param name="error" value="Ud. debe autenticarse...!"/>
</jsp:forward>
<%
} else {
    user = (String) sesion.getAttribute("username");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" href="assets/images/pagina.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/style.css"/>

    </head>
    <body>
        <!-- start: Sidebar -->
        <div class="sidebar position-fixed top-0 bottom-0 bg-white border-end">
            <div class="d-flex align-items-center p-3">
                <a href="#" class="sidebar-logo text-uppercase fw-bold text-decoration-none text-indigo fs-4">Academic</a>
                <i class="sidebar-toggle ri-arrow-left-circle-line ms-auto fs-5 d-none d-md-block"></i>
            </div>
            <ul class="sidebar-menu p-3 m-0 mb-0">
                <li class="sidebar-menu-item active">
                    <a href="#">
                        <i class="ri-dashboard-line sidebar-menu-item-icon"></i>
                        Dashboard
                    </a>
                </li>
                <li class="sidebar-menu-divider mt-3 mb-1 text-uppercase">Custom</li>
                <li class="sidebar-menu-item has-dropdown">
                    <a href="#">
                        <i class="ri-pages-line sidebar-menu-item-icon"></i>
                        Matriculas
                        <i class="ri-arrow-down-s-line sidebar-menu-item-accordion ms-auto"></i>
                    </a>
                    <ul class="sidebar-dropdown-menu">
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                User Profile
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item has-dropdown">
                            <a href="#">
                                Blog
                                <i class="ri-arrow-down-s-line sidebar-menu-item-accordion ms-auto"></i>
                            </a>
                            <ul class="sidebar-dropdown-menu">
                                <li class="sidebar-dropdown-menu-item">
                                    <a href="#">
                                        Home
                                    </a>
                                </li>
                                <li class="sidebar-dropdown-menu-item">
                                    <a href="#">
                                        Post
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-dropdown-menu-item has-dropdown">
                            <a href="#">
                                Email Template
                                <i class="ri-arrow-down-s-line sidebar-menu-item-accordion ms-auto"></i>
                            </a>
                            <ul class="sidebar-dropdown-menu">
                                <li class="sidebar-dropdown-menu-item">
                                    <a href="#">
                                        Reset Password
                                    </a>
                                </li>
                                <li class="sidebar-dropdown-menu-item">
                                    <a href="#">
                                        Changed Password
                                    </a>
                                </li>
                                <li class="sidebar-dropdown-menu-item">
                                    <a href="#">
                                        Verify Email
                                    </a>
                                </li>
                                <li class="sidebar-dropdown-menu-item">
                                    <a href="#">
                                        Invitation
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Pricing
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                About Us
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Contact Us
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Our Team
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item has-dropdown">
                    <a href="#">
                        <i class="ri-user-line sidebar-menu-item-icon"></i>
                        Cursos
                        <i class="ri-arrow-down-s-line sidebar-menu-item-accordion ms-auto"></i>
                    </a>
                    <ul class="sidebar-dropdown-menu">
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Login
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Registration
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Reset Password
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Change Password
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Confirm Password
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Deactivate Account
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item has-dropdown">
                    <a href="#">
                        <i class="ri-window-line sidebar-menu-item-icon"></i>
                        Pagos
                        <i class="ri-arrow-down-s-line sidebar-menu-item-accordion ms-auto"></i>
                    </a>
                    <ul class="sidebar-dropdown-menu">
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Charts
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Tables
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-divider mt-3 mb-1 text-uppercase">Apps</li>
                <li class="sidebar-menu-item has-dropdown">
                    <a href="#">
                        <i class="ri-shopping-cart-2-line sidebar-menu-item-icon"></i>
                        eCommerce
                        <i class="ri-arrow-down-s-line sidebar-menu-item-accordion ms-auto"></i>
                    </a>
                    <ul class="sidebar-dropdown-menu">
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Shop
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Checkout
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Details
                            </a>
                        </li>
                        <li class="sidebar-dropdown-menu-item">
                            <a href="#">
                                Wishlist
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-menu-item">
                    <a href="#">
                        <i class="ri-mail-line sidebar-menu-item-icon"></i>
                        Email
                    </a>
                </li>
                <li class="sidebar-menu-item">
                    <a href="#">
                        <i class="ri-calendar-line sidebar-menu-item-icon"></i>
                        Calendar
                    </a>
                </li>
            </ul>
        </div>
        <div class="sidebar-overlay"></div>
        <!-- end: Sidebar -->

        <!-- start: Main -->
        <main class="bg-light">
            <div class="p-2">
                <!-- start: Navbar -->
                <nav class="px-3 py-2 bg-white rounded shadow-sm">
                    <i class="ri-menu-line sidebar-toggle me-3 d-block d-md-none"></i>
                    <h5 class="fw-bold mb-0 me-auto">Dashboard</h5>
                    <div class="dropdown me-3 d-none d-sm-block">
                        <div class="cursor-pointer dropdown-toggle navbar-link" data-bs-toggle="dropdown"
                             aria-expanded="false">
                            <i class="ri-notification-line"></i>
                        </div>
                        <div class="dropdown-menu fx-dropdown-menu">
                            <h5 class="p-3 bg-indigo text-light">Notification</h5>
                            <div class="list-group list-group-flush">
                                <a href="#"
                                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
                                    <div class="me-auto">
                                        <div class="fw-semibold">Subheading</div>
                                        <span class="fs-7">Content for list item</span>
                                    </div>
                                    <span class="badge bg-primary rounded-pill">14</span>
                                </a>
                                <a href="#"
                                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
                                    <div class="me-auto">
                                        <div class="fw-semibold">Subheading</div>
                                        <span class="fs-7">Content for list item</span>
                                    </div>
                                    <span class="badge bg-primary rounded-pill">14</span>
                                </a>
                                <a href="#"
                                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
                                    <div class="me-auto">
                                        <div class="fw-semibold">Subheading</div>
                                        <span class="fs-7">Content for list item</span>
                                    </div>
                                    <span class="badge bg-primary rounded-pill">14</span>
                                </a>
                                <a href="#"
                                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
                                    <div class="me-auto">
                                        <div class="fw-semibold">Subheading</div>
                                        <span class="fs-7">Content for list item</span>
                                    </div>
                                    <span class="badge bg-primary rounded-pill">14</span>
                                </a>
                                <a href="#"
                                   class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
                                    <div class="me-auto">
                                        <div class="fw-semibold">Subheading</div>
                                        <span class="fs-7">Content for list item</span>
                                    </div>
                                    <span class="badge bg-primary rounded-pill">14</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown">
                        <div class="d-flex align-items-center cursor-pointer dropdown-toggle" data-bs-toggle="dropdown"
                             aria-expanded="false">

                            <span class="me-2 d-none d-sm-block fw-bold">
                                <%=user%>                              
                            </span>
                            <c:if test="${sexo.trim() == 'Masculino'}">
                                <img class="navbar-profile-image" src="assets/images/user_varon.png" alt="Image">
                            </c:if>
                            <c:if test="${sexo.trim() == 'Femenino'}">
                                <img class="navbar-profile-image" src="assets/images/user_dama.png" alt="Image">
                            </c:if>
                        </div>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item fw-bold" href="#">${rol}</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- end: Navbar -->

                <!-- start: Content -->
                <div class="container w-75 d-flex flex-column align-items-center justify-content-center gap-3 fw-semibold mt-5">
                    <h1>Lista Alumnos</h1>
                    <div id="formulario" class="formulario w-10 d-flex justify-content-between align-items-end">
                        <div class="d-flex flex-column">
                            <label>Nombres:</label>
                            <input type="text" name="nombre" id="nombre" class="border border-dark-subtle rounded p-1" style="width: 450px;">
                        </div>
                        <div class="d-flex flex-column">
                            <label>Apellidos</label>
                            <input type="text" min="1" name="precio" id="precio" class="border border-dark-subtle rounded p-1" style="width: 150px;">
                        </div>
                        <div class="d-flex flex-column">
                            <label>Correo:</label>
                            <input type="email" min="1" name="stock" id="stock" class="border border-dark-subtle rounded p-1"
                                   style="width: 90px;">
                        </div>
                        <div class="d-flex flex-column">
                            <label>Telefono:</label>
                            <input type="number" min="1" name="stock" id="stock" class="border border-dark-subtle rounded p-1"
                                   style="width: 90px;">
                        </div>
                        <div class="d-flex flex-column">
                            <label>Escuela:</label>
                            <select class="border border-dark-subtle rounded p-1" name="categoria" id="categoria" style="width: 250px;">
                            </select>
                        </div>
                        <c:if test="${rol eq 'ADMIN'}">
                            <input type="button" id="agregar" value="AGREGAR" class="fw-semibold btn btn-success h-75">
                        </c:if>

                    </div>
                    <table class="table w-100 mt-3 data_table" id="tabla">
                        <thead>
                            <tr>
                                <th class="fw-semibold" scope="col">#</th>
                                <th class="fw-semibold" scope="col">NOMBRE</th>
                                <th class="fw-semibold" scope="col">Apellidos</th>
                                <th class="fw-semibold" scope="col">Correo</th>
                                <th class="fw-semibold" scope="col">Teléfono</th>
                                <th class="fw-semibold" scope="col">Escuela</th>
                                <c:if test="${rol eq 'ADMIN'}">
                                <th class="fw-semibold" scope="col">ACCIONES</th>
                                </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <!-- end: Content -->
            </div>
        </main>
        <!-- end: Main -->

        <!-- start: JS -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
<%}%>