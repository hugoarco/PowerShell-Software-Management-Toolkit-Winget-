<h1 align = "center" >📦 PowerShell Software Management Toolkit (Winget)</h1>

<p align="center">
  <img src="https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell&logoColor=white">
  <img src="https://img.shields.io/badge/Windows-10%20%7C%2011-0078D6?logo=windows&logoColor=white">
  <img src="https://img.shields.io/badge/License-MIT-green">
  <img src="https://img.shields.io/badge/Status-Finished-brightgreen">
</p>

Una herramienta en PowerShell diseñada para la instalación, desinstalación y gestión básica de software en Windows utilizando Winget.

El objetivo del toolkit es facilitar la administración de programas desde consola mediante un menú interactivo, sin necesidad de navegar manualmente por instaladores o paneles del sistema.
<br><br>
⚙️ ¿Qué es esta herramienta?

Este script funciona como un gestor de software interactivo, permitiendo al usuario decidir qué programas instalar, eliminar o comprobar en su sistema.

Incluye un sistema de acceso básico antes de entrar al menú principal.
<br><br>
🔐 Control de acceso

El acceso al toolkit está restringido a usuarios autorizados.

Usuario permitido por defecto:

Hugo

Si el usuario no está en la lista, el script finaliza automáticamente.
<br><br>
🧰 Funcionalidades principales
<br><br>
🏁 Inicio
Introducción al funcionamiento del script
Explicación general de opciones disponibles
<br><br>
📥 Descargar programas

Permite instalar software mediante Winget seleccionando entre:

Visual Studio Code
Microsoft Visual Studio Community 2022
Mozilla Firefox
Google Chrome
Brave Browser
Oracle VirtualBox

El usuario decide uno a uno qué instalar.
<br><br>
❌ Borrar programas
Desinstala programas del sistema usando winget uninstall
<br><br>
🔎 Comprobar programas
Lista información de un programa instalado con winget list
<br><br>
➕ Instalación adicional
Permite buscar un programa
Seleccionar uno de la lista
Instalarlo directamente con Winget
<br><br>
🚪 Salir
Cierre controlado del script
<br><br>
🚀 Ejecución
Guardar el archivo como:
software-toolkit.ps1
Abrir PowerShell como administrador
Ejecutar:
.\software-toolkit.ps1
<br><br>
⚠️ Requisitos
Windows 10 / Windows 11
PowerShell 5.0 o superior
Winget instalado (App Installer actualizado)
Permisos de administrador recomendados
<br><br>
🧠 Arquitectura del toolkit

El script está organizado en módulos:

🔐 Control de acceso (validación de usuario)
<br><br>
📋 Menú principal en bucle
<br><br>
📥 Módulo de instalación de software
<br><br>
❌ Módulo de desinstalación
<br><br>
🔎 Módulo de consulta de programas
<br><br>
➕ Instalación guiada adicional
<br><br>
🚪 Control de salida
<br><br>

<br><br>
🛡️ Consideraciones
Utiliza Winget como gestor de paquetes
Realiza instalaciones y desinstalaciones en el sistema
Se recomienda usar con privilegios de administrador
Puede afectar al sistema si se usa sin conocimiento

<br><br>
🎯 Objetivo del proyecto

Este toolkit está diseñado para:

Automatizar instalación de software
Centralizar gestión de programas en consola
Aprender uso de Winget con PowerShell
Practicar scripting interactivo en Windows
<br><br>
👨‍💻 Autor
Hugo Arcones
