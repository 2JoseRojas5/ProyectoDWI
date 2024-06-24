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

//Mostrar fomulario Nuevo2
const newButton2 = document.querySelector('.new2');
const crear2 = document.querySelector('.crear2');
const closeButton2 = document.querySelector('.close-btn2');

newButton2.addEventListener('click', () => {
    crear2.classList.add('active');
});

closeButton2.addEventListener('click', () => {
    crear2.classList.remove('active');
});

// Cerrar el Crear Empleado al hacer clic fuera del formulario
window.addEventListener('click', (event) => {
    if (event.target === crear2) {
        crear2.classList.remove('active');
    }
});
/* ============================ FORMULARIO AGREGAR PROGRAMACIÓN ============================ */
//Mostrar fomulario Nuevo3
const newButton3 = document.querySelector('.new3');
const crear3 = document.querySelector('.crear3');
const closeButton3 = document.querySelector('.close-btn3');

newButton3.addEventListener('click', () => {
    crear3.classList.add('active');
});

closeButton3.addEventListener('click', () => {
    crear3.classList.remove('active');
});

// Cerrar el Crear Empleado al hacer clic fuera del formulario
window.addEventListener('click', (event) => {
    if (event.target === crear3) {
        crear3.classList.remove('active');
    }
});



//Mostrar fomulario Modificar
const modificarButton = document.querySelectorAll('.modificar');
const guardar = document.querySelector('.guardar');
const closeBtnMo = document.querySelector('.close-btnMo');

modificarButton.forEach(btn => {
    btn.addEventListener('click', () => {
        guardar.classList.add('active');
    });
});

closeBtnMo.addEventListener('click', () => {
    guardar.classList.remove('active');
});
// Cerrar el Modificar Empleado al hacer clic fuera del formulario
window.addEventListener('click', (event) => {
    if (event.target === guardar) {
        guardar.classList.remove('active');
    }
});