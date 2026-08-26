; Pata ejecutar este programa, se debe tener el intérprete de CLIPS instalado.
; Para ejecutar este programa, abrir un emulador de terminal en la misma
; carpeta que este proyecto y ejecutar este comando:
;
; - clipsdos -f2 main.clp (si se utiliza Windows)
; - clips -f2 main.clp (si se utiliza Linux, MacOS u otro sistema UNIX-like).

(reset)
(clear)
(load ontologia.clp)
(load-instances conocimiento.clp)
(load reglas.clp)
(assert(main))
(run)
(exit)
