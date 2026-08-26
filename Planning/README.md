# IA - Práctica 3

NOTA: aunque no es necesario, se recomienda cambiar la extensión del archivo a *.md* (por ejemplo, llamándolo *LEEME.md*) y abrirlo con un visor de Markdown, para una lectura más cómoda.
   
Una recomendación es el visor multiplataforma [Meva](https://usemeva.com/) o [MarkView](https://markview.io/). En editores como Visual Studio Code, también 
existen [extensiones](https://marketplace.visualstudio.com/items?itemName=nur-srijan.markdown-rich-preview) para previsualizar estos formatos.
   
Estas instrucciones se han probado en Linux (Arch Linux con shell Bash), aunque debe funcionar en cualquier otro sistema UNIX-like.


## Instalación de Metric-FF

Una mejora del planificador Fast Forward que incluye fluentes. Se puede descargar [aquí](https://fai.cs.uni-saarland.de/hoffmann/ff/Metric-FF.tgz).

- Linux

    1. Antes de compilar el código fuente, se necesitan estas dependencias: ```make```, ```gcc```, ```flex```, ```bison```. Se puede instalar fácilmente con el gestor de paquetes de la distribución que se utilice.

        - Debian, Ubuntu o derivadas

            ```sh
            sudo apt install make gcc flex bison
            ```
        
        - Arch Linux o derivadas

            ```sh
            sudo pacman -S make gcc flex bison
            ```
    
    2. Estando en la carpeta con el *.tgz* del código fuente, descomprimir la carpeta, ya sea de forma gráfica o usando la terminal.

        ```sh
        tar -xzf Metric-FF.tgz
        ```
    
    3. Entrar en la carpeta con el archivo comprimido y ejecutar este código para compilar.

        ```sh
        make CFLAGS="-fcommon -std=gnu89"
        ```

    4. Esto genera un binario llamado *ff*. Es el ejecutable necesario para compilar la práctica. Si se desea, se puede mover a */usr/local/bin* para que *ff* sea reconocido por el PATH.

        ```sh
        sudo mv ff /usr/local/bin
        ```


- Windows

    Existe una versión adaptada multiplataforma. Su código fuente e instrucciones se pueden encontrar [aquí](https://github.com/Vidminas/metric-ff-crossplatform).

    Para ello, se deben hacer estos pasos:

    1. Descarga el *.zip* del código fuente y descomprímelo en otra carpeta.

    2. Descarga el *.zip* con la versión Windows de Flex y Bison [aquí](https://sourceforge.net/projects/winflexbison/files/latest/download).

    3. De este último *.zip* Copia los archivos *win_bison.exe*, *win_flex.exe* y la carpeta *data* en la raíz de la carpeta que has descomprimido en el paso 1.

        En la misma carpeta debe estar los tres archivos mencionados y las carpetas *v1.0* y *v2.1*, entre otros.
    
    4. Descargar MSYS2 desde [su web](https://www.msys2.org/) e instalar el *.exe*. Dejar la ruta de instalación por defecto.

    5. Abrir la aplicación instalada MSYS2 UCRT64. Se abrirá un emulador de terminal. Allí, escribir este comando:

        ```sh
        pacman -S mingw-w64-ucrt-x86_64-gcc make
        ```

    6. Para que funcionen las herramientas *make* y *gcc*, se deben indicar dos carpetas en el PATH.

        Si se ha mantenido la ubicación de instalación por defecto, se deben añadir al PATH las dos carpetas siguientes:

        ```
        C:\msys64
        C:\msys64\usr\bin
        ```

        Más información sobre cómo cambiar el PATH [aquí](https://learn.microsoft.com/es-es/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)).

    7. Abrir la carpeta con el código fuente y las dependencias del paso 3. Allí, acceder a la carpeta con la versión de metric-ff que se desea obtener (v1.0 o v2.1)
    
        Allí, abrir un emulador de terminal (PowerShell, por ejemplo) y escribir el siguiente comando:

        ```
        make
        ```

        - NOTA: Si se desea compilar la versión v1.0, se debe modificar el campo *CC* del archivo *makefile* o, simplemente, compilar usando este comando (usar *clang* da problemas al compilar):

            ```
            make CC=gcc
            ```
    
    8. En la carpeta anterior se ha generado un ejecutable, llamado *ff-v2.1.exe* o *ff-v1.0.exe*, dependiendo de la versión.

    9. OPCIONAL. Si se desea, renombrar el ejecutable como *ff.exe* y moverlo a una carpeta que esté en el PATH (*C:\msys64\usr\bin*, por ejemplo).

        Así, al escribir *ff* en PowerShell, será reconocido este programa.


## Ejecución del proyecto

Dentro de la carpeta *src* están las carpetas *basic*, *ext1*, *ext2*, *ext3* y *ext4*, correspondiente a la implementación de las múltiples versiones del planificador.

Cada una de estas versiones tiene dos archivos: *domain.pddl* y *problem.pddl*. Si se ejecuta el planificador usando ambos archivos se devuelve una solución válida.

Dentro de la misma carpeta pueden haber otros archivos, llamados *problemX.pddl*, siendo ```X``` un número. Estos son archivos de tests.

Cada ejecutar una de estas versiones, abrir un emulador de terminal en la carpeta de la versión deseada, y ejecutar este comando:

```
ff -f problem.pddl -o domain.pddl # 'problem.pddl' o el nombre del archivo de test que se desee
```
