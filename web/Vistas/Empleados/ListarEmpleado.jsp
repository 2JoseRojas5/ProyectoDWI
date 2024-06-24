<%@page import="java.util.Iterator"%>
<%@page import="Modelo.DTOEmpleado"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../Imagenes/PeruBus.png">
        <link rel="stylesheet" type="text/css" href="../../CSS/CSSGeneral.css">
        <!-- =========== BoxIcons =========== -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Empleados</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Poetsen+One&display=swap');
            * {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            :root {
                /* ============= Colores ============= */
                --body-color: #E4E9F7;
                --table-color: #fff;
                --sidebar-color: #940d11;
                --primary-color: #ffffff;
                --text-color: #ffffff;

                /* =========== Transiciones =========== */
                --tran-02: all 0.2s ease;
                --tran-03: all 0.3s ease;
                --tran-04: all 0.4s ease;
                --tran-05: all 0.5s ease;
            }

            body {
                height: 100vh;
                background: var(--body-color);
                padding: 5%;
            }

            /* ============= Side bar ============= */
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 250px;
                padding: 10px 14px;
                background-color: var(--sidebar-color);
            } 

            /* =========== Reusable CSS =========== */
            .sidebar .text {
                font-size: 16px;
                font-weight: 500;
                color: var(--text-color);
            }

            .sidebar li {
                margin-top: 10px;
                list-style: none;
                overflow: hidden;
                align-items: center;
            }

            .sidebar li .icon {
                padding: 0;
                height: 50px;
                display: flex;
                align-items: center;
                justify-content: center;
                min-width: 60px;
                font-size: 20px;
            }

            .sidebar li .icon, .sidebar li .text {
                color: var(--text-color);
                transition: var(--tran-02);
            }

            .side header {
                position: relative;
            }

            .sidebar header .image-text {
                display: flex;
                align-items: center;
            }

            header .image-text .header-text {
                display: flex;
                padding-left: 20%;
                align-items: center;
                flex-direction: column;
                font-size: 28px;
            }

            .header-text .frase {
                font-weight:  600;
            }

            .header-text .empresa {
                margin-top: -2px;
            }

            /* Estilos de los a */
            .sidebar li a {
                height: 100%;
                width: 100%;
                display: flex;
                align-items: center;
                text-decoration: none;
                border-radius: 6px;
                transition: var(--tran-04);
            }

            /* Cambio del color del fondo cuando pasa el cursor por el menú */
            .sidebar li a:hover {
                background: var(--primary-color);
            }

            /* Cambio del color del icono y texto cuando pasa el cursor por el menú */
            .sidebar li a:hover .icon, .sidebar li a:hover .text {
                color: var(--sidebar-color);
            }

            /* Establecer la altura inicial de las sublistas a 0 */
            .sidebar .menu-links .nav-link ul {
                height: 0;
                overflow: hidden;
                transition: var(--tran-02);
            }

            /* Rotación del icono */
            .rotate {
                transform: rotate(90deg);
                transition: var(--tran-02);
            }


            /* ================ Main ================ */
            .main {
                position: absolute;
                width: calc(100% - 300px);
                left: 300px;
                min-height: 100vh;
                background: var(--white);
                transition: 0.5s;
            }
            .main.active {
                width: calc(100% - 80px);
                left: 80px;

            }

            .main--content{
                position: relative;
                background-color: var(--body-color);
                width: 88%;
                padding: 1rem;
                margin-left: 15%;
            }

            .option--header button{
                width: 150px;
                height: 50px;
                cursor: pointer;
                border-radius: 12px;
                background: var(--sidebar-color);
                color: var(--text-color);
                font-size: 17px;
                border-color: var(--sidebar-color);
                font-family: "Poetsen One", sans-serif;
            }

            .option--header{
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                background: var(--table-color);
                border-radius: 10px;
                padding: 20px 3rem;
                margin-bottom: 1rem;
            }

            .search--box{
                background: var(--body-color);
                border-radius: 15px;
                color: var(--sidebar-color);
                display: flex;
                align-items: center;
                gap: 5px;
                padding: 4px 20px;
            }

            .search--box input {
                background-color: transparent;
                width: 230px;
                padding: 10px;
                border: 0;
                outline: none;
            }

            .search--box i{
                font-size: 1.2rem;
                cursor: pointer;
                transition: var(--tran-05);
            }

            .search--box i:hover{
                transform: scale(1.2);
            }


            .table{
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                background: var(--table-color);
                border-radius: 10px;
                padding: 1px 10px;
                margin-bottom: 1rem;

            }

            .general-table{
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }


            .general-table .enunciado{
                font-size: 16px;
            }

            .general-table th,
            .general-table td{
                padding: 10px 0px;
                font-size: 12px;
                max-width: 200px;
            }


            .general-table tbody tr{
                border-bottom: 1px solid #DDDDDD;

            }

            .modificar,.eliminar{
                background: none;
                outline: none;
                border: none;
                font-size: 18px;
            }

            .modificar .icona:hover,
            .eliminar .icona:hover{
                color: var(--sidebar-color);
            }

            /* ====== Formulario ====== */
            .crear,
            .guardar{
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.7);
                display: flex;
                justify-content: center;
                align-items: center;
                visibility: hidden;
                opacity: 0;
                transition: opacity 0.3s ease, visibility 0.3s ease;
            }

            .crear.active,
            .guardar.active{
                visibility: visible;
                opacity: 1;
            }


            .crear .form-popup,
            .guardar .form-popup{
                background: var(--table-color);
                padding: 20px;
                border-radius: 10px;
                width: 400px;
                height: 615px;
                text-align: left;
            }

            .crear .form-popup-bus,
            .guardar .form-popup-bus{
                background: var(--table-color);
                padding: 20px;
                border-radius: 10px;
                width: 400px;
                height: 500px;
                text-align: left;
            }

            .crear .form-popup-asi,
            .guardar .form-popup-asi{
                background: var(--table-color);
                padding: 20px;
                border-radius: 10px;
                width: 400px;
                height: 430px;
                text-align: left;
            }

            .crear .form-popup h2,
            .guardar .form-popup h2,
            .crear .form-popup-bus h2,
            .guardar .form-popup-bus h2,
            .crear .form-popup-asi h2,
            .guardar .form-popup-asi h2{
                font-size: 20px;
            }
            .crear .form-popup hr,
            .guardar .form-popup hr,
            .crear .form-popup-bus hr,
            .guardar .form-popup-bus hr,
            .crear .form-popup-asi hr,
            .guardar .form-popup-asi hr{
                padding-bottom: 8px;
                border-bottom: none;
                border-left: none;
                border-right: none;
            }
            .crear .form-popup label,
            .crear .form-popup input,
            .guardar .form-popup label,
            .guardar .form-popup input,
            .crear .form-popup-bus label,
            .crear .form-popup-bus input,
            .guardar .form-popup-bus label,
            .guardar .form-popup-bus input,
            .crear .form-popup-asi label,
            .crear .form-popup-asi input,
            .guardar .form-popup-asi label,
            .guardar .form-popup-asi input{
                display: block;
                width: 100%;
                font-size: 12px;
            }

            .crear .form-popup input[type="text"],
            .crear .form-popup input[type="password"],
            .crear .form-popup input[type="date"],
            .crear .form-popup select,
            .guardar .form-popup input[type="text"],
            .guardar .form-popup input[type="password"],
            .guardar .form-popup input[type="date"],
            .guardar .form-popup select,
            .crear .form-popup-bus input[type="text"],
            .crear .form-popup-bus input[type="password"],
            .crear .form-popup-bus input[type="date"],
            .crear .form-popup-bus select,
            .guardar .form-popup-bus input[type="text"],
            .guardar .form-popup-bus input[type="password"],
            .guardar .form-popup-bus input[type="date"],
            .guardar .form-popup-bus select,
            .crear .form-popup-asi input[type="text"],
            .crear .form-popup-asi input[type="password"],
            .crear .form-popup-asi input[type="date"],
            .crear .form-popup-asi select,
            .guardar .form-popup-asi input[type="text"],
            .guardar .form-popup-asi input[type="password"],
            .guardar .form-popup-asi input[type="date"],
            .guardar .form-popup-asi select{
                padding: 8px 10px 8px 10px;
                border-radius: 5px;
                width: 100%;
                font-size: 10px;
            }

            .crear .form-popup button,
            .guardar .form-popup button,
            .crear .form-popup-bus button,
            .guardar .form-popup-bus button,
            .crear .form-popup-asi button,
            .guardar .form-popup-asi button{
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                background: var(--sidebar-color);
                color: var(--text-color);
                cursor: pointer;
            }
            .crear .form-popup .close-btn,
            .guardar .form-popup .close-btnMo,
            .crear .form-popup-bus .close-btn,
            .guardar .form-popup-bus .close-btnMo,
            .crear .form-popup-asi .close-btn,
            .guardar .form-popup-asi .close-btnMo{
                background: #888;
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <!-- ================ Barra Lateral ================ -->
        <nav class="sidebar">
            <header>
                <div class="image-text">
                    <div class="text header-text">
                        <span class="frase">Somos</span>
                        <span class="empresa">PerúBus</span>
                    </div>
                </div>
            </header>

            <div class="menu-bar">
                <div class="menu">
                    <ul class="menu-links">
                        <!-- ============ Opción de Inicio ============ -->
                        <li class="nav-link">
                            <a href="../../Index.jsp">
                                <i class='bx bx-home icon'></i>
                                <span class="text nav-text">Inicio</span>
                            </a>
                        </li>

                        <!-- ============ Opción de Gestión ============ -->
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
                                    <a href="../Cuentas/ListarCuenta.jsp" class="nav_link nav_link--inside">
                                        <i class='bx bxs-universal-access icon'></i>
                                        <span class="text nav-text">Cuentas</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- ============== Opción de Buses ============== -->
                        <li class="nav-link">
                            <a href="../Buses/ListarBus.jsp">
                                <i class='bx bx-bus icon'></i>
                                <span class="text nav-text">Buses</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Programación ============== -->
                        <li class="nav-link">
                            <a href="../Programacion/ListarProgramacion.jsp">
                                <i class='bx bx-compass icon'></i>
                                <span class="text nav-text">Programación</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Asientos ============== -->
                        <li class="nav-link">
                            <a href="../Asientos/ListarAsientos.jsp">
                                <i class='bx bx-home icon'></i>
                                <span class="text nav-text">Asientos</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Clientes ============== -->
                        <li class="nav-link">   
                            <a href="../Clientes/ListarCliente.jsp">
                                <i class='bx bx-male-female icon'></i>
                                <span class="text nav-text">Clientes</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Pasajes ============== -->
                        <li class="nav-link">
                            <a href="../Pasajes/ListarPasaje.jsp">
                                <i class='bx bx-receipt icon'></i>
                                <span class="text nav-text">Pasajes</span>
                            </a>
                        </li>

                        <!-- ============== Opción de Cerrar sesión ============== -->
                        <li class="nav-link">
                            <a href="../../Login.jsp">
                                <i class='bx bx-x icon'></i>
                                <span class="text nav-text">Cerrar sesión</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ================================== TABLA Y FORMULARIO DE NUEVO REGISTRO ================================== -->
        <!-- ================================================== TABLA LISTAR ================================================= -->
        <div class="main--content">
            <div class="option--header">
                <div class="search--box">
                    <i class='bx bx-search-alt-2'></i>
                    <input type="text" placeholder="Búsqueda por idEmpleado"/>
                </div>
                <button class="new">Nuevo</button>
            </div>

            <div class="table">
                <table class="general-table">
                    <thead>
                        <tr>
                            <th class="enunciado">IdEmpleado</th>
                            <th class="enunciado">IdCargo</th>
                            <th class="enunciado">Nombre</th>
                            <th class="enunciado">Apellido</th>
                            <th class="enunciado">FechaIngreso</th>
                            <th class="enunciado">Email</th>
                            <th class="enunciado">Teléfono</th>
                            <th class="enunciado">Sexo</th>
                            <th class="enunciado">Sueldo</th>
                            <th class="enunciado">Acciones</th>
                        </tr>
                    </thead>
                    <%
                        EmpleadoDAO dao = new EmpleadoDAO();
                        List<DTOEmpleado>list=dao.listar();
                        Iterator<DTOEmpleado>iter=list.iterator();
                        DTOEmpleado emp=null;
                        while(iter.hasNext()){
                            emp=iter.next();
                    %>
                    <tbody>
                        <tr>
                            <th><%= emp.getIdEmpleado() %></th><!-- ====== IdEmpleado ====== -->
                            <th><%= emp.getIdCargo() %></th><!-- ====== IdCargo ====== -->
                            <th><%= emp.getNombre() %></th><!-- ====== Nombre ====== -->
                            <th><%= emp.getApellido() %></th><!-- ====== Apellido ====== -->
                            <th><%= emp.getFechaIngreso() %></th><!-- ====== Fecha de Ingreso ====== -->
                            <th><%= emp.getEmail() %></th><!-- ====== Email ====== -->
                            <th><%= emp.getTelefono() %></th><!-- ====== Teléfono ====== -->
                            <th><%= emp.getSexo() %></th><!-- ====== Sexo ====== -->
                            <th><%= emp.getSueldo() %></th><!-- ====== Sueldo ====== -->
                            <th><!-- ====== Acciones ====== -->
                                <a class="modificar" href="ControladorEmpleados?accion=editar&idEmpleado=<%= emp.getIdEmpleado()%>"><i class='bx bx-edit-alt icona'></i></a>
                                <a class="eliminar" href="ControladorEmpleados?accion=eliminar&idEmpleado=<%= emp.getIdEmpleado()%>"><i class='bx bx-trash icona' ></i></a>
                            </th>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>


            <!-- ================================================== TABLA CREAR ================================================= -->        
            <div class="crear">
                <form class="form-popup" method="post" action="../ControladorEmpleados">
                    <h2>Nuevo Empleado</h2><hr>
                    <label for="first-name">Nombres:</label>
                    <input type="text" id="first-name" name="first-name" required>

                    <label for="last-name">Apellidos:</label>
                    <input type="text" id="last-name" name="last-name" required>

                    <label for="position">Cargo:</label>
                    <select id="position" name="position" required>
                        <option value="admin">Administrador</option>
                        <option value="chofer">Chofer</option>
                    </select>

                    <label for="entry-date">Fecha de Ingreso:</label>
                    <input type="date" id="entry-date" name="entry-date" required>

                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required>

                    <label for="phone">Teléfono:</label>
                    <input type="text" id="phone" name="phone" required>

                    <label for="gender">Sexo:</label>
                    <select id="gender" name="gender" required>
                        <option value="male">Masculino</option>
                        <option value="female">Femenino</option>
                    </select>

                    <label for="salary">Sueldo:</label>
                    <input type="text" id="salary" name="salary" required>

                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>

                    <button type="submit">Agregar</button>
                    <button type="button" class="close-btn">Cerrar</button>
                </form>
            </div>
        </div>
    </body>
    <script>
        let listElements = document.querySelectorAll('.nav-button--click');

        listElements.forEach(listElement => {
            listElement.addEventListener('click', () => {
                listElement.classList.toggle('arrow');

                // Selecciona el icono dentro del botón y aplica la rotación
                let icon = listElement.querySelector('.bx-chevron-down');
                icon.classList.toggle('rotate');

                let height = 0;
                let menu = listElement.nextElementSibling;
                if (menu.clientHeight === 0) {
                    height = menu.scrollHeight;
                }

                menu.style.height = height+"px";
            });
        });

        //Mostrar fomulario Nuevo
        const newButton = document.querySelector('.new');
        const crear = document.querySelector('.crear');
        const closeButton = document.querySelector('.close-btn');

        newButton.addEventListener('click', () => {
            crear.classList.add('active');
        });

        closeButton.addEventListener('click', () => {
            crear.classList.remove('active');
        });

        // Cerrar el Crear Empleado al hacer clic fuera del formulario
        window.addEventListener('click', (event) => {
            if (event.target === crear) {
                crear.classList.remove('active');
            }
        });
    </script>
        
</html>