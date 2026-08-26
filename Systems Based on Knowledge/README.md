# IA - Práctica 2
   
Estas instrucciones se han probado en Windows (PowerShell) y Linux (Arch Linux con shell Bash), aunque debe funcionar en cualquier otro sistema UNIX-like. También se incluyen instrucciones para MacOS.

## Instalación de CLIPS

La única dependencia necesaria para ejecutar este código es instalar CLIPS [desde su web](https://www.clipsrules.net/).
   
La pestaña *Download* redirigirá a una web de SourceForge.

- Windows

    Hay disponible un *.msi* para Windows. Instala el programa con permisos de administrador.
    
    En Windows, la aplicación tiene el nombre de ```clipsdos```, en lugar de ```clips```.
        
    Para los usuarios de Windows, la aplicación ```clipsdos``` no es reconocida por el terminal, ya que hay que añadir la carpeta de ubicación al PATH.

    La carpeta de instalación por defecto de la versión actual es...

    ```
    C:\Program Files\SSS\CLIPS 6.4.2\
    ```

    Más información sobre cómo cambiar el PATH [aquí](https://learn.microsoft.com/es-es/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)).

- Linux
  
    Hay que descargar un *.zip* o *.tar.gz* (a elección del usuario) con su código fuente. El nombre empieza con el nombre *clips_core_source* (puede cambiar su terminación en función de su versión).
        
    Para compilar se necesita tener instalado el programa *make*, que se puede encontrar fácilmente con el gestor de paquetes de la distribución que se utilice.
    
    Una vez descomprimido el archivo, abrir la carpeta generada. Dentro del directorio *core*, se abre el emulador de terminal que se desee y se escribe el comando:
    
    ```sh
    make
    ```
    
    Cuando termine, generará un ejecutable llamado *clips*. Finalmente, tocará moverlo a una ubicación presente en el PATH.
    
    ```sh
    sudo mv clips /usr/local/bin
    ```


- MacOS

    - Hay disponible un *.dmg* para ser instalado.

    - También se puede obtener compilando el código fuente. Para ello se necesita *make*.

        Para instalar *make* se recomienda instalar y usar Homebrew. Su script de instalación está [en la misma web](https://brew.sh/).

        Una vez instalado, utilizar el comando...

        ```sh
        brew install make
        ```

        El resto de instrucciones es similar que si se usa Linux.


## Solución a problemas relacionados con el *encoding*

El programa contiene en su salida palabras con tildes, lo que puede ocasionar errores de formato en algunos sistemas. Por ejemplo, viéndose la letra ```ñ``` como ```âœ…```.

- Linux

    La mayoría de distribuciones Linux (a excepción de las avanzadas o expertas que tienen un proceso de instalación manual, como Arch Linux, Void Linux o Gentoo) el texto ya es codificado con UTF-8. Por tanto, no debe haber ningún problema.

    Para cambiar el encoding, consultar [este enlace](https://www.tecmint.com/set-system-locales-in-linux/).
    
    Si se tiene este problema y el sistema soporta UTF-8, simplemente usa un emulador de terminal moderno y compatible con UTF-8, como [Konsole](https://apps.kde.org/es/konsole/) (de KDE), [Alacritty](https://alacritty.org/) o [Ghosty](https://ghostty.org/).

- MacOS

    Ninguno de los creadores del código de este proyecto tiene MacOS, pero no debería haber ningún problema.

- Windows

    Este proyecto sólo se puede ejecutar sin errores en PowerShell. El Símbolo del Sistema (CMD) sigue existiendo por cuestiones de retrocompatibilidad, pero no se recomienda utilizarse para desarrollo actualmente.

    En muchos sistemas en español, PowerShell codifica los carácteres usando la página de códigos 850, equivalente a OEM Multilingual Latin 1 (también conocido como DOS Latin 1), por cuestiones de retrocompatibilidad. Por tanto, hay que cambiar a la página de carácteres 65001 (UFT-8).

    - Si se quiere que el cambio sea provisional, abrir PowerShell y escribir este código:

        ```powershell
        [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
        chcp 65001 | Out-Null
        ```

        Estos ajustes tienen efectos hasta que se cierre la sesión actual de PowerShell.

    - Si se desea que el cambio del encoding sea permanente, abrir PowerShell y escribir este trozo:

        ```powershell
        if (!(Test-Path $PROFILE)) {
            New-Item -ItemType File -Path $PROFILE -Force
        }
        notepad $PROFILE
        ```

        Con esto, se abrirá el archivo *Microsoft.PowerShell_Profile.ps1* en el Bloc de Notas (*Notepad*).
        Allí, escribe el código especificado para la sesión temporal.


## Ejecución del proyecto

Dentro de la carpeta *src* del proyecto, abrir un terminal y escribir el siguiente comando:

- Si se usa Linux, MacOS u otro sistema UNIX-like:
   
    ```sh
    clips -f2 main.clp
    ```

- Si se usa Windows:

    ```sh
    clipsdos -f2 main.clp
    ```

## Estructura del código fuente

Contiene tres carpetas:

- *docs*: ontología elaborada con Protégé.

Dicha ontología se transformó a código CLIPS usando el comando (*owl2clips*)[https://pypi.org/project/owl2else/].
El archivo CLIPS generado está en *src/ontologia.clp*.

- *src*: código fuente del proyecto. Hay que tener el emulador de terminal abierto en esa carpeta para ejecutar el proyecto.

    Contiene cuatro archivos:

    - *main.clp*: programa principal. Carga el resto de los archivos para su ejecución. También sale del intérprete de CLIPS tras su finalización.
    - *ontologia.clp*: ontología generada con Protégé.
    - *conocimiento.clp*: base del conocimiento.
    - *reglas.clp*: reglas de producción.

- *test*: contienen archivos *.txt*. Cada uno de estos es una ejecución (tanto datos imprimidos por pantalla como información escrita por el usuario).
