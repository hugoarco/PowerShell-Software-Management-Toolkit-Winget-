# Copyright (c) 2026 Hugo Arco
function Indentificacionusuarios {

    $usuarios = @(
        "Hugo"


    )

    $eleccionusuario = Read-Host ("Introduzca un usuario ")

        if  ($usuarios -contains $eleccionusuario) {
            Write-Host ("El usuario esta en el sistema y tiene acceso al script")


        }
        
        else {
            write-Host ("EL usuario no tiene acceso al sistema ni al script")
        }


}

$opcionmenu = 0
function menu {
    
    while ($opcionmenu -ne 6 ) {              
Write-Host "1. Inicio" -ForegroundColor DarkGreen             
Write-Host "2. Descargar programas"  -ForegroundColor DarkGreen   
Write-Host "3. Borrar programas"  -ForegroundColor DarkGreen   
Write-Host "4. Comprobar programas" -ForegroundColor DarkGreen   
Write-Host "5. Instalar programas adicionales" -ForegroundColor DarkGreen   
Write-Host "6. Salir" -ForegroundColor DarkGreen   

         $opcionmenu   = [int] ( read-Host "Introduzca un numero")
Write-Host "1. Inicio"
Write-Host "2. Descargar programas"
Write-Host "3. Borrar programas"
Write-Host "4. Comprobar programas"
Write-Host "5. Instalar programas adicionales"
Write-Host "6. Salir"

switch ($opcionmenu) {
    1 { Inicio }                   
    2 { DescargarProgramas }       
    3 { BorrarProgramas }          
    4 { ComprobarProgramas }        
    5 { InstalarProgramasAdicionales }  
    6 { Salir }                    
    default { Write-Host "Opcion no correcta" }
}

    }
}

    function Inicio {

        write-Host ("Bienvenido a Inicio")
        Write-Host ("Explicaremos por encima el funcionamiento del script")
        write-Host ("1 Explicacion del Script ")
        write-Host ("2 EL usuario decide que programas instalar en su pc")
        write-Host ("3 El usuario decicde que programas borrar en su ordenador")
        write-HOst ("4 Por si el usuario desea salir del script")

        $sino = read-Host ("El usuario desea salir del script si o no ")

        if ($sino -eq "Si") {
            write-Host ("El usuario desea salir del script")
            return
        }

        else {
            write-Host ("El usuario desea permanecer en inicio ")
        }
    }

    function  DescargarProgramas {

            write-Host ("A continuacion el script te preguntara sobre la descarga de unos programas seleccione si o no en función de sus necesidades")
        
        $programas =@(

        "vscode"
        "Microsoft.VisualStudio.2022.Community"
        "firefox"
        "Google.Chrome"
        "brave.brave"
        "Oracle.VirtualBox"
        )

        foreach ($programa in $programas ) {

          $sino = Read-Host ("Desea instalar dicho programa $programa (Si /No )")

                if ($sino -eq "Si") {
                    winget install $programa
                }

                else {

                    write-Host ("No se procede con la instalacion del programa")
                }


        }

    }


    function  BorrarProgramas {

        $Programaborrado = Read-Host ("Introduzca el programa que quiera borrar ")

        winget uninstall $Programaborrado

        write-Host "Programa borrado correctamente"


    }

function  ComprobarProgramas {
try {
    $programausuario = read-Host ("Introduzca el programa que desea comprobar")
    
    winget list $programausuario

    write-Host ("Resultado mostrado por pantalla")
}

catch {
    write-Host ("Error")
}


}

function InstalarProgramasAdicionales  {
    try {
    $Programaadicional = read-Host ("Introduzca el nombre del programa que quiere instalar")
    winget list  $Programaadicional
    $Programaadicional2 = read-Host (" A partir de la lista 2 selecione el nombre del programa correspondiente a la lista")
    winget install $Programaadicional2
    }
    
    catch {
    write-Host ("Error")
    }

}

function Salir {

    $Salir = read-Host ("Desea salir del programa si o no ")

        if ($Salir -eq "Si") {
            write-Host ("El usuario quiere salir")

        }

        else {

            write-Host ("El usuario no se quiere salir")
        }

}

Indentificacionusuarios
menu
