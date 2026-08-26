# IA - Practice 2
   
These instructions have been tested on Windows (PowerShell) and Linux (Arch Linux with Bash shell), although it should work on any other UNIX-like system. Instructions for MacOS are also included.

## Installing CLIPS

The only dependency needed to run this code is installing CLIPS [from its website](https://www.clipsrules.net/).
   
The *Download* tab will redirect you to a SourceForge page.

- Windows

    A *.msi* is available for Windows. Install the program with administrator permissions.
    
    On Windows, the application is named ```clipsdos```, instead of ```clips```.
        
    For Windows users, the ```clipsdos``` application is not recognized by the terminal, since you need to add the installation folder to the PATH.

    The default installation folder for the current version is...

    ```
    C:\Program Files\SSS\CLIPS 6.4.2\
    ```

    More information on how to change the PATH [here](https://learn.microsoft.com/es-es/previous-versions/office/developer/sharepoint-2010/ee537574(v=office.14)).

- Linux
  
    You need to download a *.zip* or *.tar.gz* (user's choice) with its source code. The name begins with *clips_core_source* (its ending may vary depending on the version).
        
    To compile it, you need to have the *make* program installed, which can easily be found via your distribution's package manager.
    
    Once the file is unzipped, open the generated folder. Inside the *core* directory, open the terminal emulator of your choice and type the command:
    
    ```sh
    make
    ```
    
    When it finishes, it will generate an executable called *clips*. Finally, you'll need to move it to a location present in the PATH.
    
    ```sh
    sudo mv clips /usr/local/bin
    ```


- MacOS

    - A *.dmg* is available for installation.

    - It can also be obtained by compiling the source code. For this, you need *make*.

        To install *make*, it is recommended to install and use Homebrew. Its installation script is [on the same website](https://brew.sh/).

        Once installed, use the command...

        ```sh
        brew install make
        ```

        The rest of the instructions are similar to Linux.


## Solution to encoding-related issues

The program's output contains words with accents, which can cause formatting errors on some systems. For example, the letter ```ñ``` appearing as ```âœ…```.

- Linux

    On most Linux distributions (except advanced or expert ones with a manual installation process, such as Arch Linux, Void Linux, or Gentoo), text is already encoded in UTF-8. Therefore, there shouldn't be any problem.

    To change the encoding, see [this link](https://www.tecmint.com/set-system-locales-in-linux/).
    
    If you have this problem and your system supports UTF-8, simply use a modern terminal emulator that's compatible with UTF-8, such as [Konsole](https://apps.kde.org/es/konsole/) (from KDE), [Alacritty](https://alacritty.org/), or [Ghostty](https://ghostty.org/).

- MacOS

    None of this project's code creators own a Mac, but there shouldn't be any problem.

- Windows

    This project can only be run without errors in PowerShell. The Command Prompt (CMD) still exists for backward-compatibility reasons, but it is not recommended for development nowadays.

    On many Spanish-language systems, PowerShell encodes characters using code page 850, equivalent to OEM Multilingual Latin 1 (also known as DOS Latin 1), for backward-compatibility reasons. Therefore, you need to switch to code page 65001 (UTF-8).

    - If you want the change to be temporary, open PowerShell and type this code:

        ```powershell
        [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
        chcp 65001 | Out-Null
        ```

        These settings only take effect until the current PowerShell session is closed.

    - If you want the encoding change to be permanent, open PowerShell and type this snippet:

        ```powershell
        if (!(Test-Path $PROFILE)) {
            New-Item -ItemType File -Path $PROFILE -Force
        }
        notepad $PROFILE
        ```

        This will open the *Microsoft.PowerShell_Profile.ps1* file in Notepad.
        There, write the code specified for the temporary session.


## Running the project

Inside the project's *src* folder, open a terminal and type the following command:

- If using Linux, MacOS, or another UNIX-like system:
   
    ```sh
    clips -f2 main.clp
    ```

- If using Windows:

    ```sh
    clipsdos -f2 main.clp
    ```

## Source code structure

Contains three folders:

- *docs*: ontology developed with Protégé.

This ontology was transformed into CLIPS code using the command (*owl2clips*)[https://pypi.org/project/owl2else/].
The generated CLIPS file is at *src/ontologia.clp*.

- *src*: the project's source code. You need to have the terminal emulator open in this folder to run the project.

    Contains four files:

    - *main.clp*: main program. Loads the rest of the files for execution. Also exits the CLIPS interpreter once it finishes.
    - *ontologia.clp*: ontology generated with Protégé.
    - *conocimiento.clp*: knowledge base.
    - *reglas.clp*: production rules.

- *test*: contains *.txt* files. Each one is a run (both data printed to screen and information written by the user).
