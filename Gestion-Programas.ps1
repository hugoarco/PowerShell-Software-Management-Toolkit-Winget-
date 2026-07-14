# Copyright (c) 2026 Hugo Arco
function Indentificacionusuarios {

    $usuarios = @(
        "Hugo"
        "Invitado"
    )

    $eleccionusuario = Read-Host ("Introduzca un usuario ")

    if ($usuarios -contains $eleccionusuario) {
        Write-Host ("El usuario esta en el sistema y tiene acceso al script")
    }
    else {
        write-Host ("EL usuario no tiene acceso al sistema ni al script")
    }
}

$opcionmenu = 0
function menu {
    
    while ($opcionmenu -ne 7) {              
        Write-Host "1. Inicio" -ForegroundColor DarkGreen             
        Write-Host "2. Descargar programas (por lista)" -ForegroundColor DarkGreen   
        Write-Host "3. Descargar programa (por nombre)" -ForegroundColor DarkGreen   
        Write-Host "4. Borrar programas" -ForegroundColor DarkGreen   
        Write-Host "5. Comprobar programas" -ForegroundColor DarkGreen   
        Write-Host "6. Instalar programas adicionales" -ForegroundColor DarkGreen   
        Write-Host "7. Salir" -ForegroundColor DarkGreen   

        $opcionmenu = [int] (read-Host "Introduzca un numero")
        Write-Host "1. Inicio"
        Write-Host "2. Descargar programas (por lista)"
        Write-Host "3. Descargar programa (por nombre)"
        Write-Host "4. Borrar programas"
        Write-Host "5. Comprobar programas"
        Write-Host "6. Instalar programas adicionales"
        Write-Host "7. Salir"

        switch ($opcionmenu) {
            1 { Inicio }                   
            2 { DescargarProgramasLista }
            3 { DescargarProgramasNombre }        
            4 { BorrarProgramas }          
            5 { ComprobarProgramas }        
            6 { InstalarProgramasAdicionales }  
            7 { Salir }                    
            default { Write-Host "Opcion no correcta" -ForegroundColor Red }
        }
    }
}

function Inicio {

    Write-Host ("Bienvenido a Inicio")
    Write-Host ("Explicaremos por encima el funcionamiento del script")
    Write-Host ("1. Explicacion del Script ")
    Write-Host ("2. El usuario decide que programas instalar en su pc")
    Write-Host ("3. El usuario decide que programas borrar en su ordenador")
    Write-Host ("4. Por si el usuario desea salir del script")

    $sino = read-Host ("El usuario desea salir del script si o no ")

    if ($sino -eq "Si") {
        Write-Host ("El usuario desea salir del script")
        return
    }
    else {
        Write-Host ("El usuario desea permanecer en inicio ")
    }

    type nul > inicio_log.txt
}

function DescargarProgramasNombre {

    Write-Host "Bienvenido al gestor de instalación de software para Windows." -ForegroundColor Cyan
    Write-Host "Este módulo permite instalar una aplicación específica mediante Winget." -ForegroundColor Cyan
    Write-Host "A continuación se muestra el catálogo de programas disponibles. Introduzca el nombre exacto que aparece en la lista." -ForegroundColor Cyan
    Write-Host ""

    Write-Host "Edición y programación:" -ForegroundColor Yellow
    Write-Host "- vscode"
    Write-Host "- Microsoft.VisualStudio.2022.Community"
    Write-Host "- Microsoft.VisualStudioCode"
    Write-Host "- Git.Git"
    Write-Host "- Neovim.Neovim"
    Write-Host "- SublimeText.SublimeText4"
    Write-Host "- Notepad++.Notepad++"
    Write-Host "- JetBrains.IntelliJIDEA.Community"

    Write-Host ""
    Write-Host "Navegadores:" -ForegroundColor Yellow
    Write-Host "- Google.Chrome"
    Write-Host "- Mozilla.Firefox"
    Write-Host "- Brave.Brave"
    Write-Host "- Opera.Opera"
    Write-Host "- Vivaldi.Vivaldi"
    Write-Host "- Microsoft.Edge"

    Write-Host ""
    Write-Host "Virtualización:" -ForegroundColor Yellow
    Write-Host "- Oracle.VirtualBox"
    Write-Host "- VMware.WorkstationPlayer"

    Write-Host ""
    Write-Host "Comunicación:" -ForegroundColor Yellow
    Write-Host "- Discord.Discord"
    Write-Host "- Slack.Slack"
    Write-Host "- Zoom.Zoom"
    Write-Host "- Microsoft.Teams"

    Write-Host ""
    Write-Host "Utilidades:" -ForegroundColor Yellow
    Write-Host "- 7zip.7zip"
    Write-Host "- WinRAR.WinRAR"
    Write-Host "- PDF24.PDF24"
    Write-Host "- Greenshot.Greenshot"
    Write-Host "- OBSProject.OBSStudio"
    Write-Host "- Audacity.Audacity"
    Write-Host "- GIMP.GIMP"
    Write-Host "- Inkscape.Inkscape"
    Write-Host "- Blender.Blender"

    Write-Host ""
    Write-Host "Seguridad:" -ForegroundColor Yellow
    Write-Host "- Bitdefender.Bitdefender"
    Write-Host "- Malwarebytes.Malwarebytes"

    Write-Host ""
    Write-Host "Herramientas de red:" -ForegroundColor Yellow
    Write-Host "- WiresharkFoundation.Wireshark"
    Write-Host "- Putty.Putty"
    Write-Host "- FileZilla.FileZilla"

    Write-Host ""
    Write-Host "Bases de datos:" -ForegroundColor Yellow
    Write-Host "- Microsoft.SQLServerManagementStudio"
    Write-Host "- MySQL.MySQL"
    Write-Host "- MongoDB.MongoDB"
    Write-Host "- DBeaver.DBeaver"

    Write-Host ""
    $NombrePrograma = Read-Host ("Introduzca el Nombre exacto del programa a instalar (ej: Google.Chrome)")

    try {
        $instalado = winget list $NombrePrograma 2>$null

        if ($instalado) {
            Write-Host "El programa '$NombrePrograma' ya está instalado en el sistema." -ForegroundColor Yellow
        }
        else {
            Write-Host "El programa '$NombrePrograma' no está instalado. Procediendo a la instalación..." -ForegroundColor Cyan
            winget install $NombrePrograma
            Write-Host "Instalación de '$NombrePrograma' completada." -ForegroundColor Green
        }
    }
    catch {
        Write-Host "Error al intentar instalar el programa. Verifique el nombre e inténtelo de nuevo." -ForegroundColor Red
    }

    type nul > instalar_por_nombre_log.txt
}

function DescargarProgramasLista {

    Write-Host "Bienvenido al gestor de instalación de software para Windows." -ForegroundColor Cyan
    Write-Host "Este módulo permite instalar aplicaciones mediante Winget de forma interactiva." -ForegroundColor Cyan
    Write-Host "A continuación se muestra el catálogo de programas disponibles. Para cada uno podrá elegir si desea instalarlo o no."
    Write-Host ""

    Write-Host "Edición y programación:" -ForegroundColor Yellow
    Write-Host "- Visual Studio Code"
    Write-Host "- Visual Studio 2022 Community"
    Write-Host "- Git"
    Write-Host "- Neovim"
    Write-Host "- Sublime Text 4"
    Write-Host "- Notepad++"
    Write-Host "- IntelliJ IDEA Community"

    Write-Host ""
    Write-Host "Navegadores:" -ForegroundColor Yellow
    Write-Host "- Google Chrome"
    Write-Host "- Mozilla Firefox"
    Write-Host "- Brave"
    Write-Host "- Opera"
    Write-Host "- Vivaldi"
    Write-Host "- Microsoft Edge"

    Write-Host ""
    Write-Host "Virtualización:" -ForegroundColor Yellow
    Write-Host "- Oracle VirtualBox"
    Write-Host "- VMware Workstation Player"

    Write-Host ""
    Write-Host "Comunicación:" -ForegroundColor Yellow
    Write-Host "- Discord"
    Write-Host "- Slack"
    Write-Host "- Zoom"
    Write-Host "- Microsoft Teams"

    Write-Host ""
    Write-Host "Utilidades:" -ForegroundColor Yellow
    Write-Host "- 7-Zip"
    Write-Host "- WinRAR"
    Write-Host "- PDF24"
    Write-Host "- Greenshot"
    Write-Host "- OBS Studio"
    Write-Host "- Audacity"
    Write-Host "- GIMP"
    Write-Host "- Inkscape"
    Write-Host "- Blender"

    Write-Host ""
    Write-Host "Seguridad:" -ForegroundColor Yellow
    Write-Host "- Bitdefender"
    Write-Host "- Malwarebytes"

    Write-Host ""
    Write-Host "Herramientas de red:" -ForegroundColor Yellow
    Write-Host "- Wireshark"
    Write-Host "- PuTTY"
    Write-Host "- FileZilla"

    Write-Host ""
    Write-Host "Bases de datos:" -ForegroundColor Yellow
    Write-Host "- SQL Server Management Studio"
    Write-Host "- MySQL"
    Write-Host "- MongoDB"
    Write-Host "- DBeaver"

    Write-Host ""
    Write-Host "El script le preguntará por cada programa y usted decidirá si desea instalarlo." -ForegroundColor Green

    $programas = @(
        "vscode"
        "Microsoft.VisualStudio.2022.Community"
        "Microsoft.VisualStudioCode"
        "Git.Git"
        "Neovim.Neovim"
        "SublimeText.SublimeText4"
        "Notepad++.Notepad++"
        "JetBrains.IntelliJIDEA.Community"
        "Google.Chrome"
        "Mozilla.Firefox"
        "Brave.Brave"
        "Opera.Opera"
        "Vivaldi.Vivaldi"
        "Microsoft.Edge"
        "Oracle.VirtualBox"
        "VMware.WorkstationPlayer"
        "Discord.Discord"
        "Slack.Slack"
        "Zoom.Zoom"
        "Microsoft.Teams"
        "7zip.7zip"
        "WinRAR.WinRAR"
        "PDF24.PDF24"
        "Greenshot.Greenshot"
        "OBSProject.OBSStudio"
        "Audacity.Audacity"
        "GIMP.GIMP"
        "Inkscape.Inkscape"
        "Blender.Blender"
        "Bitdefender.Bitdefender"
        "Malwarebytes.Malwarebytes"
        "WiresharkFoundation.Wireshark"
        "Putty.Putty"
        "FileZilla.FileZilla"
        "Microsoft.SQLServerManagementStudio"
        "MySQL.MySQL"
        "MongoDB.MongoDB"
        "DBeaver.DBeaver"
    )

    foreach ($programa in $programas) {
        $sino = Read-Host ("Desea instalar dicho programa $programa (Si /No)")

        if ($sino -eq "Si") {
            Write-Host "El usuario desea instalar el programa" -ForegroundColor Green
            $instalado = winget list $programa 2>$null

            if ($instalado) {
                Write-Host "El programa '$programa' ya está instalado. No se procederá a su instalación." -ForegroundColor Yellow
            }
            else {
                Write-Host "El programa '$programa' no está instalado. Se procederá a su instalación." -ForegroundColor Cyan
                winget install $programa
                Write-Host "Instalación de '$programa' completada." -ForegroundColor Green
            }
        }
        else {
            Write-Host "El usuario no desea instalar el programa '$programa'." -ForegroundColor Red
        }
    }

    type nul > instalar_por_lista_log.txt
}

function BorrarProgramas {

    $Programaborrado = Read-Host ("Introduzca el programa que quiera borrar ")
    try {
        winget uninstall $Programaborrado
        Write-Host "Programa borrado correctamente" -ForegroundColor Green
    }
    catch {
        Write-Host "Error al intentar borrar el programa." -ForegroundColor Red
    }

    type nul > borrar_programas_log.txt
}

function ComprobarProgramas {
    try {
        $programausuario = Read-Host ("Introduzca el programa que desea comprobar")
        winget list $programausuario
        Write-Host ("Resultado mostrado por pantalla")
    }
    catch {
        Write-Host ("Error al comprobar el programa") -ForegroundColor Red
    }

    type nul > comprobar_programas_log.txt
}

function InstalarProgramasAdicionales {
    try {
        $Programaadicional = Read-Host ("Introduzca el nombre del programa que quiere instalar")
        winget list $Programaadicional
        $Programaadicional2 = Read-Host ("A partir de la lista, seleccione el nombre del programa correspondiente a la lista")
        winget install $Programaadicional2
        Write-Host "Programa instalado correctamente." -ForegroundColor Green
    }
    catch {
        Write-Host ("Error al instalar el programa adicional") -ForegroundColor Red
    }

    type nul > instalar_adicional_log.txt
}

function Salir {

    $Salir = Read-Host ("Desea salir del programa si o no ")

    if ($Salir -eq "Si") {
        Write-Host ("El usuario quiere salir") -ForegroundColor Green
        exit
    }
    else {
        Write-Host ("El usuario no se quiere salir") -ForegroundColor Yellow
    }
}

Indentificacionusuarios
menu
