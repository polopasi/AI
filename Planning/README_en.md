# IA - Practice 3

NOTE: although it is not necessary, it is recommended to change the file extension to *.md* (for example, naming it *LEEME.md*) and open it with a Markdown viewer, for a more comfortable read.
   
One recommendation is the cross-platform viewer [Meva](https://usemeva.com/) or [MarkView](https://markview.io/). In editors like Visual Studio Code, there are also 
[extensions](https://marketplace.visualstudio.com/items?itemName=nur-srijan.markdown-rich-preview) to preview these formats.
   
These instructions have been tested on Linux (Arch Linux with Bash shell), although it should work on any other UNIX-like system.


## Installing Metric-FF

An improvement of the Fast Forward planner that includes fluents. It can be downloaded [here](https://fai.cs.uni-saarland.de/hoffmann/ff/Metric-FF.tgz).

- Linux

    1. Before compiling the source code, you need these dependencies: ```make```, ```gcc```, ```flex```, ```bison```. They can be easily installed via your distribution's package manager.

        - Debian, Ubuntu, or derivatives

            ```sh
            sudo apt install make gcc flex bison
            ```
        
        - Arch Linux or derivatives

            ```sh
            sudo pacman -S make gcc flex bison
            ```
    
    2. While in the folder with the source code's *.tgz*, extract the folder, either graphically or using the terminal.

        ```sh
        tar -xzf Metric-FF.tgz
        ```
    
    3. Enter the folder with the extracted files and run this code to compile.

        ```sh
        make CFLAGS="-fcommon -std=gnu89"
        ```

    4. This generates a binary called *ff*. It is the executable needed to compile the practice. If desired, it can be moved to */usr/local/bin* so that *ff* is recognized by the PATH.

        ```sh
        sudo mv ff /usr/local/bin
        ```


- Windows

    A cross-platform adapted version exists. Its source code and instructions can be found [here](https://github.com/Vidminas/metric-ff-crossplatform).

    For this, you must follow these steps:

    1. Download the *.zip* of the source code and extract it into another folder.

    2. Download the *.zip* with the Windows version of Flex and Bison [here](https://sourceforge.net/projects/winflexbison/files/latest/download).

    3. From this last *.zip*, copy the files *win_bison.exe*, *win_flex.exe*, and the *data* folder into the root of the folder you extracted in step 1.

        The same folder must contain the three mentioned files as well as the *v1.0* and *v2.1* folders, among others.
    
    4. Download MSYS2 from [its website](https://www.msys2.org/) and install the *.exe*. Keep the default installation path.

    5. Open the installed MSYS2 UCRT64 application. A terminal emulator will open. There, type this command:

        ```sh
        pacman -S mingw-w64-ucrt-x86_64-gcc make
        ```

    6. For the *make* and *gcc* tools to work, two folders must be added to the PATH.

        If you kept the default installation location, you must add the following two folders to the PATH:

        ```
        C:\msys64
        C:\msys64\usr\bin
        ```

        More information on how to change the PATH [here](https://learn.microsoft.com/es-es/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)).

    7. Open the folder with the source code and the dependencies from step 3. There, go into the folder with the metric-ff version you want to obtain (v1.0 or v2.1)
    
        There, open a terminal emulator (PowerShell, for example) and type the following command:

        ```
        make
        ```

        - NOTE: If you wish to compile version v1.0, you must modify the *CC* field of the *makefile* file, or simply compile using this command (using *clang* causes problems when compiling):

            ```
            make CC=gcc
            ```
    
    8. In the previous folder, an executable has been generated, called *ff-v2.1.exe* or *ff-v1.0.exe*, depending on the version.

    9. OPTIONAL. If desired, rename the executable to *ff.exe* and move it to a folder that is on the PATH (*C:\msys64\usr\bin*, for example).

        This way, when typing *ff* in PowerShell, this program will be recognized.


## Running the project

Inside the *src* folder are the folders *basic*, *ext1*, *ext2*, *ext3*, and *ext4*, corresponding to the implementation of the planner's multiple versions.

Each of these versions has two files: *domain.pddl* and *problem.pddl*. If the planner is run using both files, it returns a valid solution.

Inside the same folder there may be other files, called *problemX.pddl*, where ```X``` is a number. These are test files.

To run one of these versions, open a terminal emulator in the folder of the desired version, and run this command:

```
ff -f problem.pddl -o domain.pddl # 'problem.pddl' or the name of the desired test file
```
