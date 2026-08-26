# IA - Práctica 1
   
Instructions in english in README_en.md.

Estas instrucciones se han probado en Windows (CMD y PowerShell) y Linux (Arch Linux con shell Bash), aunque debe funcionar en cualquier otro sistema UNIX-like. También se incluyen instrucciones para MacOS.

# Instrucciones para compilar el proyecto

1. Instalar las dependencias: *make* y Java.

    - Windows

        - Java se puede descargar desde [la web de Oracle](https://www.oracle.com/es/java/technologies/downloads/).

            Para los usuarios de Windows, la aplicación ```jar``` no es reconocida por el terminal, ya que hay que añadir la carpeta de ubicación al PATH.

            La carpeta de instalación por defecto de Java 26 en Windows es...

            ```
            C:\Program Files\Java\jdk-26\bin
            ```

            Más información sobre cómo cambiar el PATH [aquí](https://learn.microsoft.com/es-es/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)).

        - La forma más fácil de instalar ```make``` es usando Scoop. Simplemente, copia el script presente [en su web](https://scoop.sh/).

            Una vez instalado Scoop, abrir un terminal y escribir...

            ```
            scoop install make
            ```

    - Linux

        La web de Oracle proporciona un ```.deb```, un ```.rpm``` y un ```tar.gz``` 
        para instalar Java. Sin embargo, en cualquier distribución también se puede 
        instalar mediante el paquete ```openjdk```. Y ```make``` se encuentra en cualquier gestor de paquetes.

        - Debian, Ubuntu 24.04 y derivadas

            Para descargar Java, se puede descargar el ```.deb``` en la web de Oracle, o instalar la versión abierta desde los repositorios.

            ```sh
            sudo apt install openjdk-25-jdk make
            ```
        
        - Fedora y derivadas

            Para descargar Java, se puede descargar el ```.rpm``` en la web de Oracle, o instalar la versión abierta desde los repositorios.

            ```sh
            sudo dnf install java-25-openjdk make
            ```
        
        - OpenSuse (Tumbleweed, Leap 16.0) y derivadas

            Para descargar Java, se puede descargar el ```.rpm``` en la web de Oracle, o instalar la versión abierta desde los repositorios.

            ```sh
            sudo zypper install java-25-openjdk make
            ```

        - Arch Linux y derivadas

            ```sh
            sudo pacman -S jdk-openjdk make
            ```

        El comando es fácilmente adaptable para el gestor de paquetes de Linux que se use. Simplemente, busque el nombre exacto del paquete en el buscador de paquetes de su distribución, y de cómo instalar paquetes con el gestor de su sistema.
    
    - MacOS

        Java se puede descargar para x86_64 y ARM64 desde la web de Oracle.

        Para instalar *make* se recomienda instalar y usar Homebrew. Su script de instalación está [en la misma web](https://brew.sh/).

        Una vez instalado, utilizar el comando...

        ```sh
        brew install make
        ```


2. Descargar el *.zip* con el código fuente. Después, abrir desde un terminal la carpeta que contiene el archivo Makefile.

El resto de pasos cambian en función de lo que se desee.

## Generar el JAR

Simplemente, escribir...

```sh
make
```

## Compilar

Se generará un directorio llamado ```build```, que contendrá todos los archivos ```.class``` necesarios para su ejecución.

Esta orden también es invocada por la instrucción anterior.

```sh
make compile
```

## Limpiar los archivos de compilación

```sh
make clean
```

## Limpiar los archivos de compilación y el JAR

```sh
make distclean
```

# Instrucciones de ejecución

El archivo se ejecuta desde un emulador de terminal pasando 10 parámetros o 14 parámetros, dependiendo del algoritmo que se ejecute.
   
- Se necesitan 10 para ejecutar el Hill Climbing (si se pasan 14, se ignoran los siguientes).
- Se necesitan 14 parámetros para el Simulated Annealing.

Estructura del comando de ejecución (los corchetes sólo sirven para indicar la opcionalidad de estos parámetros al ejecutar Hill Climbing. 
No deben escribirse).

```sh
java -jar iaPract1.jar par0 par1 par2 par3 par4 par5 par6 par7 par8 par9 [par10 par11 par12 par13]
```

Cada parámetro debe tener este significado:

- Par0: Número de repeticiones en la ejecución. Pensado sólo para pruebas. En casos habituales, el valor es 1.
- Par1: Número de centros (C).
- Par2: Número de helicopteros por centro (H).
- Par3: Número de grupos a rescatar (G).
- Par4: Operador empleado. Sus valores pueden ser...
    - cambia_orden
    - intercambio
- Par5: Selector del generador de estado inicial:
    - 0: Aleatorio con prioridad
    - 1: Distancias
    - 2: Distancias con prioridad
    - 3: Aleatorio sin prioridad
- Par6: identificador del algoritmo utilizado:
    - HC: Hill Climbing.
    - SA: Simulated Annealing.
- Par7: Heurística utilizada:
    - tiempo_total: se prioriza el menor tiempo empleado.
    - prioridades: se prioriza a los grupos prioritarios.
- Par8: semilla para la generacion aleatoria (del inglés, *random seed*).
- Par9: Salida por pantalla de la ejecución experimental (verbose)
    - 0: off. Salida deseada habitualmente. Por cada helicóptero, se muestran los grupos rescatados por cada viaje.
    - 1: on.
- Par10: parametro de Simulated Annealing: steps.
- Par11: parametro de Simulated Annealing: stiter.
- Par12: parametro de Simulated Annealing: k.
- Par13: parametro de Simulated Annealing: lamb.

## Ejemplo de entrada

```sh
java -jar iaPract1.jar 1 4 8 160 cambia_orden 3 HC prioridades 12345 0 2500 100 5 0.001
```
