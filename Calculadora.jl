# Programa de Calculadora
# ITO - 22 oct 2019

using Gtk
ENV["GTK_CSD"] = 0
cal = GtkWindow()
global status = 0
set_gtk_property!(cal,:height_request,500)
set_gtk_property!(cal,:width_request,500)
set_gtk_property!(cal,:title,"Calculadora 0.0.1")
set_gtk_property!(cal,:window_position, 3)

bt0 = GtkButton("0")
bt1 = GtkButton("1")
bt2 = GtkButton("2")
bt3 = GtkButton("3")
bt4 = GtkButton("4")
bt5 = GtkButton("5")
bt6 = GtkButton("6")
bt7 = GtkButton("7")
bt8 = GtkButton("8")
bt9 = GtkButton("9")
btOFF = GtkButton("OFF")
btMinus = GtkButton("-")
btPlus = GtkButton("+")
btMul = GtkButton("*")
btDiv = GtkButton("/")
btAC = GtkButton("AC")
btDot = GtkButton(".")
btEqual = GtkButton("=")
btOFF = GtkButton("OFF")

# Función para boton OFF
signal_connect(btOFF, :clicked) do widget
    destroy(cal)
end

# Función para boton 1
signal_connect(bt1, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "1")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"1")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

signal_connect(cal, "key-press-event") do widget, event
    if event.keyval == 49 || event.keyval == 65457
        if status == 0
            set_gtk_property!(pantalla, :label, "1")
            global status = 1
        else
            msg = get_gtk_property(pantalla, :label, String)
            newMsg = string(msg,"1")
            set_gtk_property!(pantalla, :label, newMsg)
            global status = 1
        end
    end
end

# Función para boton 2
signal_connect(bt2, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "2")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"2")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 3
signal_connect(bt3, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "3")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"3")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 4
signal_connect(bt4, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "4")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"4")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 5
signal_connect(bt5, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "5")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"5")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 6
signal_connect(bt6, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "6")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"6")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 7
signal_connect(bt7, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "7")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"7")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 8
signal_connect(bt8, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "8")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"8")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 9
signal_connect(bt9, :clicked) do widget
    if status == 0
        set_gtk_property!(pantalla, :label, "9")
        global status = 1
    else
        msg = get_gtk_property(pantalla, :label, String)
        newMsg = string(msg,"9")
        set_gtk_property!(pantalla, :label, newMsg)
        global status = 1
    end
end

# Función para boton 0
signal_connect(bt0, :clicked) do widget
    msg = get_gtk_property(pantalla, :label, String)
    newMsg = string(msg,"0")
    set_gtk_property!(pantalla, :label, newMsg)
    global status = 1
end

# Función para botonAC
signal_connect(btAC, :clicked) do widget
    set_gtk_property!(pantalla, :label, 0)
    global status = 0
end

signal_connect(btPlus, :clicked) do widget
    msg = get_gtk_property(pantalla, :label, String)
    v1S = msg
    global v1N = parse(Float64, v1S)
    newMsg = string(msg,"+")
    global numVal = length(newMsg)
    set_gtk_property!(pantalla, :label, newMsg)
end

signal_connect(btEqual, :clicked) do widget
    global v1N, numVal
    msg = get_gtk_property(pantalla, :label, String)
    global v2S = msg[(numVal+1):end]
    global v2N = parse(Float64, v2S)
    SUM = v1N + v2N
    set_gtk_property!(pantalla, :label, SUM)
end
g1 = GtkGrid()
set_gtk_property!(g1,:column_homogeneous,true)
set_gtk_property!(g1,:row_homogeneous,true)
set_gtk_property!(g1, :column_spacing, 15)
set_gtk_property!(g1, :row_spacing, 15)
set_gtk_property!(g1, :margin_top, 20)
set_gtk_property!(g1, :margin_left, 20)
set_gtk_property!(g1, :margin_right, 20)
set_gtk_property!(g1, :margin_bottom, 20)

borde = GtkFrame()
pantalla = GtkLabel("0")
set_gtk_property!(pantalla, :tooltip_text, "Resultado")
set_gtk_property!(pantalla, :xalign, 1.0)

g1[1:4,1] = borde
g1[1:2,2] = btAC
g1[3:4,2] = btOFF
g1[3,3] = bt9
g1[1,3] = bt7
g1[2,3] = bt8
g1[3,3] = bt9
g1[1,4] = bt4
g1[2,4] = bt5
g1[3,4] = bt6
g1[1,5] = bt1
g1[2,5] = bt2
g1[3,5] = bt3
g1[1,6] = bt0
g1[2,6] = btDot
g1[3,6] = btEqual

g1[4,3] = btMinus
g1[4,4] = btPlus
g1[4,5] = btMul
g1[4,6] = btDiv


push!(borde, pantalla)
push!(cal, g1)
showall(cal)
