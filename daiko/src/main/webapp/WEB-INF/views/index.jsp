<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DaikoIWS System - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
     <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon">
                 <img style="width: 200px" src="data:image/png;base64,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">
                </div>
                
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="notice">
                    <i class="fas fa-fw fa-table"></i>
                    <span>お知らせ</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="resources/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
           <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="resources/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="resources/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="resources/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${name }</span>
                                <img class="img-profile rounded-circle"
                                    src="resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
          
           <jsp:include page="${contentPage}"></jsp:include>

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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">ログアウトしますか?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">ログアウトをし、ログイン画面に戻りますか？</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logOut">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/chart-area-demo.js"></script>
    <script src="resources/js/demo/chart-pie-demo.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/datatables-demo.js"></script>


</body>

</html>