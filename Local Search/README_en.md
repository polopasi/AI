# IA - Practice 1

These instructions have been tested on Windows (CMD and PowerShell) and Linux (Arch Linux with Bash shell), although it should work on any other UNIX-like system. Instructions for MacOS are also included.

# Instructions for building the project

1. Install the dependencies: *make* and Java.

    - Windows

        - Java can be downloaded from [Oracle's website](https://www.oracle.com/es/java/technologies/downloads/).

            For Windows users, the ```jar``` application is not recognized by the terminal, since you need to add the installation folder to the PATH.

            The default installation folder for Java 26 on Windows is...

            ```
            C:\Program Files\Java\jdk-26\bin
            ```

            More information on how to change the PATH [here](https://learn.microsoft.com/es-es/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)).

        - The easiest way to install ```make``` is by using Scoop. Simply copy the script found [on their website](https://scoop.sh/).

            Once Scoop is installed, open a terminal and type...

            ```
            scoop install make
            ```

    - Linux

        Oracle's website provides a ```.deb```, a ```.rpm```, and a ```tar.gz``` 
        to install Java. However, on any distribution it can also be 
        installed via the ```openjdk``` package. And ```make``` can be found in any package manager.

        - Debian, Ubuntu 24.04 and derivatives

            To download Java, you can download the ```.deb``` from Oracle's website, or install the open version from the repositories.

            ```sh
            sudo apt install openjdk-25-jdk make
            ```
        
        - Fedora and derivatives

            To download Java, you can download the ```.rpm``` from Oracle's website, or install the open version from the repositories.

            ```sh
            sudo dnf install java-25-openjdk make
            ```
        
        - OpenSuse (Tumbleweed, Leap 16.0) and derivatives

            To download Java, you can download the ```.rpm``` from Oracle's website, or install the open version from the repositories.

            ```sh
            sudo zypper install java-25-openjdk make
            ```

        - Arch Linux and derivatives

            ```sh
            sudo pacman -S jdk-openjdk make
            ```

        The command can be easily adapted for whichever Linux package manager you use. Simply look up the exact package name in your distribution's package search, and how to install packages with your system's manager.
    
    - MacOS

        Java can be downloaded for x86_64 and ARM64 from Oracle's website.

        To install *make*, it is recommended to install and use Homebrew. Its installation script is [on the same website](https://brew.sh/).

        Once installed, use the command...

        ```sh
        brew install make
        ```


2. Download the *.zip* with the source code. Then, open the folder containing the Makefile from a terminal.

The remaining steps vary depending on what you want to do.

## Generate the JAR

Simply type...

```sh
make
```

## Compile

A directory called ```build``` will be generated, containing all the ```.class``` files necessary for execution.

This command is also invoked by the previous instruction.

```sh
make compile
```

## Clean the build files

```sh
make clean
```

## Clean the build files and the JAR

```sh
make distclean
```

# Execution instructions

The file is run from a terminal emulator by passing either 10 parameters or 14 parameters, depending on which algorithm is run.
   
- 10 are needed to run Hill Climbing (if 14 are passed, the extra ones are ignored).
- 14 parameters are needed for Simulated Annealing.

Structure of the execution command (the brackets are only used to indicate the optionality of these parameters when running Hill Climbing. 
They should not be typed).

```sh
java -jar iaPract1.jar par0 par1 par2 par3 par4 par5 par6 par7 par8 par9 [par10 par11 par12 par13]
```

Each parameter must have this meaning:

- Par0: Number of repetitions in the run. Intended only for testing. In normal cases, the value is 1.
- Par1: Number of centers (C).
- Par2: Number of helicopters per center (H).
- Par3: Number of groups to rescue (G).
- Par4: Operator used. Its values can be...
    - cambia_orden (change order)
    - intercambio (swap)
- Par5: Initial state generator selector:
    - 0: Random with priority
    - 1: Distances
    - 2: Distances with priority
    - 3: Random without priority
- Par6: Identifier of the algorithm used:
    - HC: Hill Climbing.
    - SA: Simulated Annealing.
- Par7: Heuristic used:
    - tiempo_total (total time): the shortest time taken is prioritized.
    - prioridades (priorities): priority groups are prioritized.
- Par8: Seed for random generation (*random seed*).
- Par9: Screen output for the experimental run (verbose)
    - 0: off. Usually the desired output. For each helicopter, the groups rescued on each trip are shown.
    - 1: on.
- Par10: Simulated Annealing parameter: steps.
- Par11: Simulated Annealing parameter: stiter.
- Par12: Simulated Annealing parameter: k.
- Par13: Simulated Annealing parameter: lamb.

## Example input

```sh
java -jar iaPract1.jar 1 4 8 160 cambia_orden 3 HC prioridades 12345 0 2500 100 5 0.001
```
