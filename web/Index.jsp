<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/CSSGeneral.css">
        <link rel="icon" href="Imagenes/PeruBus.png">

        <!-- =========== BoxIcons =========== -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Inicio</title>
    </head>
    <body>    
        <div class="container">
            <!-- ================ Barra Lateral ================ -->
            <nav class="sidebar">
                <header>
                    <div class="image-text">
                        <div class="text header-text">
                            <span class="name">Somos</span>
                            <span class="profession">PerúBus</span>
                        </div>
                    </div>
                </header>

                <div class="menu-bar">
                    <div class="menu">
                        <ul class="menu-links">
                            <!-- ============ Opción de Inicio ============ -->
                            <li class="nav-link">
                                <a href="Index.jsp">
                                    <i class='bx bx-home icon'></i>
                                    <span class="text nav-text">Inicio</span>
                                </a>
                            </li>

                            <!-- ============ Opción de Empleados ============ -->
                            <li class="nav-link nav-link--click">
                                <div class="nav-button nav-button--click">
                                    <a href="#">
                                        <i class='bx bx-group icon'></i>
                                        <span class="text nav-text">Gestión</span>
                                        <i class='bx bx-chevron-down icon'></i>
                                    </a>
                                </div>

                                <ul>
                                    <!-- ============ Opción de Empleados ============ -->
                                    <li class="nav-link">
                                        <a href="ControladorEmpleado?accion=listar" class="nav_link nav_link--inside">
                                            <i class='bx bxs-universal-access icon'></i>
                                            <span class="text nav-text">Empleados</span>
                                        </a>
                                    </li>

                                    <!-- ============ Opción de Cuentas ============ -->
                                    <li class="nav-link">
                                        <a href="Vistas/Cuentas/ListarCuenta.jsp" class="nav_link nav_link--inside">
                                            <i class='bx bxs-universal-access icon'></i>
                                            <span class="text nav-text">Cuentas</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <!-- ============== Opción de Buses ============== -->
                            <li class="nav-link">
                                <a href="Vistas/Buses/ListarBus.jsp">
                                    <i class='bx bx-bus icon'></i>
                                    <span class="text nav-text">Buses</span>
                                </a>
                            </li>

                            <!-- ============== Opción de Programación ============== -->
                            <li class="nav-link">
                                <a href="Vistas/Programacion/ListarProgramacion.jsp">
                                    <i class='bx bx-compass icon'></i>
                                    <span class="text nav-text">Programación</span>
                                </a>
                            </li>

                            <!-- ============== Opción de Asientos ============== -->
                            <li class="nav-link">
                                <a href="Vistas/Asientos/ListarAsientos.jsp">
                                    <i class='bx bx-home icon'></i>
                                    <span class="text nav-text">Asientos</span>
                                </a>
                            </li>

                            <!-- ============== Opción de Clientes ============== -->
                            <li class="nav-link">   
                                <a href="Vistas/Clientes/ListarCliente.jsp">
                                    <i class='bx bx-male-female icon'></i>
                                    <span class="text nav-text">Clientes</span>
                                </a>
                            </li>

                            <!-- ============== Opción de Pasajes ============== -->
                            <li class="nav-link">
                                <a href="Vistas/Pasajes/ListarPasaje.jsp">
                                    <i class='bx bx-receipt icon'></i>
                                    <span class="text nav-text">Pasajes</span>
                                </a>
                            </li>

                            <!-- ============== Opción de Cerrar sesión ============== -->
                            <li class="nav-link">
                                <a href="Login.jsp">
                                    <i class='bx bx-x icon'></i>
                                    <span class="text nav-text">Cerrar sesión</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="main">
                <div>
                    <h1 class="titulo">Bienvenidos a PeruBus</h1>
                    <p class="vision">No olvides nuestra visión: Ser líder en el servicio de transporte de pasajeros, carga y encomienda a nivel interregional y regional, con crecimiento sostenido basado en nuestro modelo de servicio con excelencia operacional, ofreciendo servicios de clase mundial con clientes satisfechos y fidelizados, con una cultura empresarial de éxito.</p>

                    <div class="Tareas">
                        <h4 class="Tarea">Tareas de hoy:</h4>
                        <label><input type="checkbox" class="cbTarea"> Actualizar datos del chofer C00203 </input></label><br>
                        <label><input type="checkbox" class="cbTarea"> Eliminar bus AXY-7G8 </input></label><br>
                        <label><input type="checkbox" class="cbTarea"> Cambiar destino de la ruta Nro R00542 </input></label><br>
                        <label><input type="checkbox" class="cbTarea"> Cambiar la fecha del pasaje con el Id 175001 </input></label><br>
                        <label><input type="checkbox" class="cbTarea"> Revisar el pasaje del cliente 49671563 </input></label><br>
                    </div>

                    <img class="ImgBusInicio" src="Imagenes/BusInicio.png">

                </div>
            </div>
        </div>

        <script src="JavaScript/JSGeneral.js"></script>
    </body>
</html>
