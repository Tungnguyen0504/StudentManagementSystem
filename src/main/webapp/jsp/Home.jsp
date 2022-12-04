<%--
    Document   : Home
    Created on : May 20, 2022, 12:55:19 PM
    Author     : asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Group 1 - Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<c:url value="/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="<c:url value="/css/sb-admin-2.min.css"/>" rel="stylesheet">
    <link rel="icon" href="<c:url value="/img/cai nay hoi la.png"/>" type="image/gif" sizes="16x16">
    <link href="<c:url value="/css/SenCss.css"/>" rel="stylesheet">
</head>

    <body id="page-top">


        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <jsp:include page="Sidebar.jsp"></jsp:include>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                    <jsp:include page="Header.jsp"></jsp:include>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->

                    <c:if test="${Loged.role_id == 4}">
                        <div class="container-fluid">
                            <jsp:include page="HomeForAd.jsp"></jsp:include>
                            </div>
                    </c:if>

                    <c:if test="${Loged.role_id == 1}">

                        <div class="container-fluid">
                            <jsp:include page="HomeForStu.jsp"></jsp:include>
                                <div class="row">

                                <c:forEach var="o" items="${vectC}">
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <a href="ClassTrainer?go=detailClass&cid=${o.id}">
                                            <div class="card border-left-primary shadow h-100 py-2">

                                                <div class="card-body">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">

                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">(${o.classCode}) - ${o.subjectId}</div>
                                                            <div class="h6 mb-0 font-weight-bold text-gray-800">Trainer: ${o.trainerId}

                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </div>
                                </c:forEach> 

                            </div>
                        </div>
                    </c:if>

                    <c:if test="${Loged.role_id == 2}">
                        <div class="container-fluid">
                            <jsp:include page="HomeForTrai.jsp"></jsp:include>
                            </div>
                    </c:if>

                    <c:if test="${Loged.role_id == 3}">
                        <div class="container-fluid">
                            <jsp:include page="HomeForAuthor.jsp"></jsp:include>
                            </div>
                    </c:if>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <jsp:include page="LogOut.jsp"></jsp:include>

        <script src="<c:url value="/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
        <script src="<c:url value="/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
        <script src="<c:url value="/js/sb-admin-2.min.js"/>"></script>
        <script src="<c:url value="/vendor/chart.js/Chart.min.js"/>"></script>
        <script src="<c:url value="/js/demo/chart-area-demo.js"/>"></script>
        <script src="<c:url value="/js/demo/chart-pie-demo.js"/>"></script>

    </body>

</html>
