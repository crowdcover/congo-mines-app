//--------------INFO----------------//
// Desarrollador: Iván Barcia
// Sitio Web: http://ivanbarcia.eu
// Hecho en: Galicia, España

// Nombre: Slidx
// Versión: 3.0
// Sitio Web: https://github.com/ivarcia/codelab-slidx
//----------------------------------//


$(document).ready(function () {

  
    var button = '.sidebar_button'; 
    var menu = '.sidebar_menu'; 
    var mode = 'click' 
    var side = 'left' 
    var buttonMove = 'yes' 
    var shadow = 'yes' 
    var opacity = 0.6; 
    var size = 250;
    var speed = 0.5;
    var normalTime = 0; 
    var menuTime = 300; 
    var menuTop = 0;
    var menuBottom = 0; 
    var zIndexMenu = 98; 


    var slidxOpen = "slidx_open";
    var slidxShadow = "slidx_shadow";
    var slidxShadowID = '#' + slidxShadow;
    var zIndexButton = zIndexMenu - 1;
    var zIndexShadow = zIndexMenu - 2;
    var speedM = speed * 1000;


    if (buttonMove == 'yes') {
        $(button).css({
            'position': 'absolute',
            'top': '130px',
            'transition': speed + 's',
            'z-index': zIndexButton,
        });

        if (side == 'right') {
            $(button).css({
                'right': '0px',
            })
        }

        if (side !== 'right') {
            $(button).css({
                'left': '0px',
            })
        }
    }


    $(menu).css({
        'position': 'fixed',
        'top': menuTop + 'px',
        'bottom': menuBottom + 'px',
        'width': size + 'px',
        'max-width': '100%',
        'overflow-y': 'auto',
        'transition': speed + 's',
        'z-index': zIndexMenu,
    });

    //Si es derecho
    if (side == 'right') {
        $(menu).css({
            'right': '-' + size + 'px',
        })
    }

    //Si es izquierdo
    if (side !== 'right') {
        $(menu).css({
            'left': '-' + size + 'px',
        })
    }

    function open() {

        if (side == 'right') {

            $(menu).animate({
                right: '0',
            }, normalTime);

            if (buttonMove == 'yes') {
                $(button).animate({
                    right: size,
                }, normalTime);
            }

        }

        if (side !== 'right') {

            $(menu).animate({
                left: '0',
            }, normalTime);

            if (buttonMove == 'yes') {
                $(button).animate({
                    left: size,
                }, normalTime);
            }
        }

        $(menu).addClass(slidxOpen);

        if (shadow == 'yes') {
            $("<div>", {
                id: slidxShadow, //atributo directo, igual que si fuéramos con attr(“id”)
                css: //propiedad de jQuery
                {
                    'position': 'fixed',
                    'top': '0px',
                    'width': '100%',
                    'height': '100%',
                    'background-color': '#000000',
                    'opacity': '0',
                    'z-index': zIndexShadow,
                },
            }).appendTo('html');

            $(slidxShadowID).fadeTo(speedM, opacity);
        }
    };

    //Ésta es la función que cierra el menú. (Hay dos versiones en función del tiempo de cierre)
    function close(delayTime) {
        if (side == 'right') {
            $(menu).animate({
                right: '-' + size,
            }, delayTime)

            if (buttonMove == 'yes') {
                $(button).animate({
                    right: 0,
                }, delayTime);
            }
        }

        if (side !== 'right') {
            $(menu).animate({
                left: '-' + size,
            }, delayTime)

            if (buttonMove == 'yes') {
                $(button).animate({
                    left: 0,
                }, delayTime);
            }
        }

        $(menu).removeClass(slidxOpen);
        $(slidxShadowID).fadeOut(speedM);

        setTimeout(function () {
            $(slidxShadowID).remove();
        }, speedM);
    };

    //------------------------------  ACTIVADORES  -------------------------------//
    //--------------- Modo CLICK ---------------//
    if (mode == 'click') {
        // Al pulsar el button abrimos el menú si está cerrado, o lo cerramos si está abierto.
        $(button).click(function () {
            //No realiza la acción por defecto del botón
            event.preventDefault();
            if (!$(menu).hasClass(slidxOpen)) {
                open();
            } else {
                close(normalTime);
            }
        });

        //Al pulsar en un elemento del menú, también se cierra el menu.
        //Fíjate que el tiempo de cierre que introduzco es mayor que cuando lo cierro con el boton directamente, simplemente porque queda mejor visualmente
        $(menu).click(function () {
            close(menuTime);
        });
    }

    $(document).on('click', slidxShadowID, function () {
        close(normalTime);
    });


    //--------------- Modo HOVER ---------------//
    if (mode == 'hover') {
        // Al pasar el ratón por encima del botón abrimos el menú si está cerrado, o lo cerramos si está abierto.
        $(button).mouseover(function () {
            if (!$(menu).hasClass(slidxOpen)) {
                open();
            } else {
                close(normalTime);
            }
        });

        //Al sacar el ratón del menú, se cierra en menú.
        $(menu).mouseleave(function () {
            close(normalTime);
        });

        $(menu).click(function () {
            close(menuTime);
        });
    };
});
