(defglobal
    ?*opciones_clima*        = (create$ mediterráneo continental atlántico árido subtropical-húmedo)
)

(deffunction preguntar_numero (?pregunta) "Se pasa una pregunta como parámetro y se espera que la respuesta sea un número"
    (bind ?numero -1)

    (while (< ?numero 0) do
        (format t "%s: " ?pregunta)
        (bind ?numero (read))
    )
    (return ?numero)
)

(deffunction preguntar_string (?pregunta) "Se pasa una pregunta como parámetro y se espera que la respuesta sea un string"
    (bind ?str "")

    (while (not (member$ ?str ?*opciones_clima*)) do
        (format t "%s: " ?pregunta)
        (bind ?str (sym-cat (read)))
    )
    (return ?str)
)

; funcion que espera recibir un parametro pregunta que se debe ser 's' o 'n', y devuelve el valor 1 o 0 respectivamente
(deffunction preguntar_si_no (?pregunta) "Se pasa una pregunta como parámetro y se espera que la respuesta sea 's' o 'n'"
    (bind ?str "")

    (while (not (member$ ?str (create$ s n))) do    ; si el str no se encuentra en la lista [s, n]
        (format t "%s (s/n): " ?pregunta)           ; imprime por pantalla
        (bind ?str (sym-cat (read)))                ; lee el input del usuario
    )
    (if (eq ?str s)
        then (return 1)
        else (return 0)
    )
)



(deftemplate exigencia "Campo que recoge los requisitos que se deben cumplir en el viaje"
    (slot presupuesto  (type NUMBER) (range 0 ?VARIABLE) (default 0))
    (slot max_dias_totales (type INTEGER) (range 1 ?VARIABLE) (default 1))
    (slot min_dias_en_ciudad (type INTEGER) (range 1 ?VARIABLE) (default 1))
    (slot max_dias_en_ciudad (type INTEGER) (range 1 ?VARIABLE) (default 1))
    (slot min_ciudades_visitadas (type INTEGER) (range 1 ?VARIABLE) (default 1))
    (slot max_ciudades_visitadas (type INTEGER) (range 1 ?VARIABLE) (default 1))
    (slot tamanno_grupo (type INTEGER) (range 1 ?VARIABLE) (default 1))
    (slot destinos_tranquilos (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot objetivo_cultural (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot objetivo_romantico (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot objetivo_descanso (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot restriccion_transporte (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot prefiere_coche (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot prefiere_tren (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot prefiere_avion (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot prefiere_barco (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot restriccion_clima (type INTEGER) (range 0 ?VARIABLE) (default 0))
    (slot clima_preferido (type STRING) (default ""))
    (slot comodidad  (type NUMBER) (range 1 5) (default 1))
)


;
; Interfaz del inicio del programa: mensaje inicial y preguntas.
;

(defrule main "Mensaje de inicio del programa"
    (main)
    =>
    (printout t crlf)
    (printout t "¡Bienvenido a nuestro buscador de viajes!" crlf)
    (printout t "Le haremos una serie de preguntas para hallar su viaje ideal." crlf)
    (printout t crlf)
    (printout t "Si alguna pregunta contiene alguna respuesta inválida, la pregunta se repite hasta que se escriba un dato correcto." crlf)
    (printout t "O también cerrar el programa de forma inesperada." crlf)
    (printout t crlf)
    (assert(preguntar))
)


(defrule preguntar "Preguntas para obtener las preferencias del usuario"
    (preguntar)
    =>

    (bind ?objetivo_romantico 0)
    (bind ?objetivo_cultural  0)
    (bind ?objetivo_descanso  0)
    (bind ?destinos_tranquilos 0)

    (bind ?presupuesto (preguntar_numero "-> Indique (en Euros) el presupuesto total"))

    (bind ?max_dias_totales (preguntar_numero "-> Indique el máximo número de días de su viaje"))

    (bind ?min_dias_en_ciudad (preguntar_numero "-> Indique el número mínimo de días en cada ciudad"))

    (bind ?max_dias_en_ciudad (preguntar_numero "-> Indique el número máximo de días en cada ciudad"))

    (bind ?min_ciudades_visitadas (preguntar_numero "-> Indique el número mínimo de ciudades que desea visitar"))

    (bind ?max_ciudades_visitadas (preguntar_numero "-> Indique el número máximo de ciudades que desea visitar"))
    
    (bind ?tamanno_grupo (preguntar_numero "-> Indique el número de integrantes de su grupo"))
    (printout t crlf)
    (printout t crlf)

    (if (= ?tamanno_grupo 2)
        then 
            (bind ?objetivo_romantico (preguntar_si_no "-> ¿Viaja con su pareja?"))
            (if (= ?objetivo_romantico 1)
                then (bind ?objetivo_descanso 1)
            )
    )
    (printout t crlf)
    (printout t crlf)


    (bind ?restriccion_transporte 0)
    (bind ?prefiere_coche 0)
    (bind ?prefiere_tren  0)
    (bind ?prefiere_avion  0)
    (bind ?prefiere_barco 0)
    (bind ?restriccion_transporte (preguntar_si_no "-> ¿Tiene alguna preferencia en particular en el medio de trasporte para viajar?"))
    (if (= ?restriccion_transporte 1)    ; si el usuario tiene la restriccion de medio de transporte
        then 
        (printout t "-> Le vamos a preguntar por el tipo de vehiculo que prefiere utilizar. Especifique sí o no con (s/n)" crlf)
        (bind ?prefiere_coche (preguntar_si_no "-> ¿Le gustaría utilizar coche para viajar entre destinos?"))
        (bind ?prefiere_tren  (preguntar_si_no "-> ¿Le gustaría utilizar el tren para viajar entre destinos?"))
        (bind ?prefiere_avion (preguntar_si_no "-> ¿Le gustaría volar en un avión para viajar entre destinos?"))
        (bind ?prefiere_barco (preguntar_si_no "-> ¿Le gustaría navegar en barco para viajar entre destinos?"))
        (printout t crlf)
        (printout t "--- Información sobre sus preferencias de transporte procesada ---" crlf)
        (printout t crlf)
    )    
    (printout t crlf)
    (printout t crlf)


    (bind ?objetivo_descanso (preguntar_si_no "-> ¿Prefiere visitar lugares tranquilos con el objetivo de desconectar?"))
    (if (= ?objetivo_descanso 1)    ; si el usuario no desea visitar destinos con alta actividad, preguntamos si prefiere
                                    ; turismo orientado a un ambiente mas relajado y enfocado al descanso
        then 
        (bind ?destinos_tranquilos (preguntar_si_no "-> ¿Desea visitar ciudades o pueblos con baja población?"))
    )
    (printout t crlf)
    (printout t crlf)


    (bind ?objetivo_cultural (preguntar_si_no "-> ¿Desea visitar lugares culturales?"))
    (printout t crlf)
    (printout t crlf)


    (bind ?restriccion_clima 0)
    (bind ?clima_preferido "")
    (bind ?restriccion_clima (preguntar_si_no "-> ¿Prefiere visitar destinos con algún clima en particular?"))
    (if (= ?restriccion_clima 1)    ; si el usuario desea especificar algun clima en particular
        then 
        (bind ?clima_preferido (preguntar_string (str-cat "-> Indique el clima preferido escribiendo exactamente, acentos incluidos, una de las siguientes opciones disponibles: " (implode$ ?*opciones_clima*)))) ; implode necesario para que str-cat concatene lista de strings
    )
    (printout t crlf)
    (printout t crlf)


    (bind ?comodidad (preguntar_numero "-> Indique la comodidad deseada del alojamiento. Opciones disponibles: 1, 2, 3, 4, 5"))
    (printout t crlf)
    (printout t crlf)


    ; comprobaciones de que los parametros son correctos
    (if (and
    (<= ?min_dias_en_ciudad ?max_dias_en_ciudad)
    (<= ?min_ciudades_visitadas ?max_ciudades_visitadas)
    )
    then
        (assert
        (exigencia
            (presupuesto ?presupuesto)
            (max_dias_totales ?max_dias_totales)
            (min_dias_en_ciudad ?min_dias_en_ciudad)
            (max_dias_en_ciudad ?max_dias_en_ciudad)
            (min_ciudades_visitadas ?min_ciudades_visitadas)
            (max_ciudades_visitadas ?max_ciudades_visitadas)
            (tamanno_grupo ?tamanno_grupo)
            (destinos_tranquilos ?destinos_tranquilos)
            (restriccion_transporte ?restriccion_transporte)
            (prefiere_coche ?prefiere_coche)
            (prefiere_tren ?prefiere_tren)
            (prefiere_avion ?prefiere_avion)
            (prefiere_barco ?prefiere_barco)
            (objetivo_cultural ?objetivo_cultural)
            (objetivo_romantico ?objetivo_romantico)
            (objetivo_descanso ?objetivo_descanso)
            (restriccion_clima ?restriccion_clima)
            (clima_preferido (str-cat ?clima_preferido))
            (comodidad ?comodidad)
        )
        )
    else
        (printout t "ERROR al rellenar los datos." crlf)
        (printout t "Tenga en cuenta que se deben cumplir estas comdiciones:" crlf)
        (printout t "    - Mínimo días total <= Máximo días total" crlf)
        (printout t "    - Mínimo días por ciudad <= Máximo días por ciudad" crlf)
        (printout t "    - Mínimo ciudades visitadas <= Máximo ciudades visitadas" crlf)    
    )
    (printout t crlf)
    (printout t crlf)
)

; filtrar_por_densidad
; dada una lista de ciudades y la variable destinos_tranquilos indicada por el usuario,
; retorna una lista con solo aquellas ciudades cuya densidad poblacional sea <= 3000
;
; parametros de entrada:
;    - lista_ciudades  - lista de ciudades a filtrar
;
; -> lista result vacia
; -> por cada ciudad c de lista_ciudades
;       -> si la densidad poblacional <= 3000, se añade c a result
; -> retorna result
;
(deffunction filtrar_ciudad_por_densidad ($?lista_ciudades)
    (bind $?result (create$))
    (loop-for-count (?i 1 (length$ $?lista_ciudades)) do
        (bind ?ciudad (nth$ ?i $?lista_ciudades))
        (if (<= 
                (send ?ciudad get-densidad_poblacional)
                3000)
            then
            (bind $?result           ; push de la ciudad que tiene densidad poblacional baja
                (insert$ $?result
                    (+ (length$ $?result) 1)
                    ?ciudad))
        )
    )
    (return $?result)
)

; filtrar_ciudad_por_transporte
; dada una lista de ciudades y las variables de transportes preferidos por el usuario ?prefiere_coche ?prefiere_tren 
; ?prefiere_avion ?prefiere_barco, filtra aquellas ciudades que no ofrezcan ninguno de los medios de transporte exigidos
; por el cliente.
;
; Por ejemplo, si Barcelona posee todos los medios de transporte, Madrid posee coche, tren y avion; y el usuario
; exige el transporte barco, solo Barcelona pasará el filtro.
;
; parametros de entrada:
;    - prefiere_coche  - entero [0, 1] que define si el usuario prefiere utilizar coche para viajar
;    - prefiere_tren   - entero [0, 1] que define si el usuario prefiere utilizar tren para viajar
;    - prefiere_avion  - entero [0, 1] que define si el usuario prefiere utilizar avion para viajar
;    - prefiere_barco  - entero [0, 1] que define si el usuario prefiere utilizar barco para viajar
;    - lista_ciudades  - lista de ciudades a filtrar
;
; -> lista result vacia
; -> dadas variables prefiere_x (?prefiere_coche ?prefiere_tren ?prefiere_avion ?prefiere_barco)
; -> por cada ciudad c de lista_ciudades
;       -> ciudad_tiene_coche = ciudad_tiene_tren = ciudad_tiene_avion = ciudad_tiene_barco = FALSE
;       -> por cada medio de transporte x de c
;           -> se pone a true que ciudad_tiene_x
;       -> si prefiere_x == ciudad_tiene_x para algun transporte x € [Coche, Tren, Avion, Barco]
;          se annade la ciudad c a result
; -> retorna result
;
(deffunction filtrar_ciudad_por_transporte (?prefiere_coche ?prefiere_tren ?prefiere_avion ?prefiere_barco $?lista_ciudades)
    (bind $?result (create$))
    ; por cada ciudad ciudad i
    (loop-for-count (?i 1 (length$ $?lista_ciudades)) do

        (bind ?ciudad (nth$ ?i $?lista_ciudades))
        (bind ?elementos (send ?ciudad get-dispone_de))
        (bind ?ciudad_tiene_coche FALSE)
        (bind ?ciudad_tiene_tren FALSE)
        (bind ?ciudad_tiene_avion FALSE)
        (bind ?ciudad_tiene_barco FALSE)

        ; por cada elem de la ciudad
        (loop-for-count (?j 1 (length$ ?elementos)) do
            (bind ?elem (nth$ ?j ?elementos))
            (if (eq (class ?elem) transporte)           ; que sea un transporte
                then
                (bind ?tipo_transporte (send ?elem get-tipo_transporte))    ; mira que tipo de transporte es

                (if (eq ?tipo_transporte "coche") then (bind ?ciudad_tiene_coche TRUE))
                (if (eq ?tipo_transporte "tren")  then (bind ?ciudad_tiene_tren  TRUE))
                (if (eq ?tipo_transporte "avion") then (bind ?ciudad_tiene_avion TRUE))
                (if (eq ?tipo_transporte "barco") then (bind ?ciudad_tiene_barco TRUE))
            )
        )

        ; la ciudad pasa el filtro si tiene al menos algunos de los medios de transportes exigidos por el usuario
        (if (or
                ; si prefiere_x es TRUE y la ciudad tiene_x
                (and (= ?prefiere_coche  1) (eq ?ciudad_tiene_coche  TRUE))
                (and (= ?prefiere_tren   1) (eq ?ciudad_tiene_tren   TRUE))
                (and (= ?prefiere_avion  1) (eq ?ciudad_tiene_avion  TRUE))
                (and (= ?prefiere_barco  1) (eq ?ciudad_tiene_barco  TRUE))
            )
            then
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?ciudad))
        )
    )
    (return $?result)
)


; filtrar_ciudad_por_objetivos
; dada una lista de ciudades y las variables de objetivos (con valor 0 o 1) ?objetivo_romantico ?objetivo_cultural 
; ?objetivo_descanso retorna una lista con solo aquellas ciudades que tengan  sitios de interes que cumplan con los objetivos
;
; por ejemplo, si el usuario tiene objetivo_cultural = objetivo_romantico = 1, y Madrid tiene sitios de interes
; unicamente culturales y de descanso, Madrid no pasaria el filtro por falta de sitios_interes con objetivo_romantico
;
; parametros de entrada:
;    - objetivo_cultural  - entero [0, 1] que define si el usuario desea visitar objetivos culturales
;    - objetivo_romantico - entero [0, 1] que define si el usuario desea visitar objetivos romanticos
;    - objetivo_descanso  - entero [0, 1] que define si el usuario desea visitar objetivos descanso
;    - lista_ciudades  - lista de ciudades a filtrar
;
; -> lista result vacia
; -> por cada ciudad c de lista_ciudades
;       -> ofrece_cultural = ofrece_descanso = ofrece_romantico = FALSE
;       -> por cada sitio de interes j de c
;           -> si j satisface algun objetivo, entonces se pone ese objetivo a TRUE
;       -> si ofrece_x == objetivo_x del usuario, se annade c a result
; -> retorna result
;
(deffunction filtrar_ciudad_por_objetivos (?objetivo_romantico ?objetivo_cultural ?objetivo_descanso $?lista_ciudades)
    (bind $?result (create$))
    ; por cada ciudad i
    (loop-for-count (?i 1 (length$ $?lista_ciudades)) do

        (bind ?ciudad (nth$ ?i $?lista_ciudades))
        (bind ?sitios (send ?ciudad get-dispone_de))

        (bind ?ciudad_ofrece_cultural FALSE)
        (bind ?ciudad_ofrece_romantico FALSE)
        (bind ?ciudad_ofrece_descanso FALSE)

        ; por cada sitio_interes j
        (loop-for-count (?j 1 (length$ ?sitios)) do

            (bind ?sitio (nth$ ?j ?sitios))
            (if (eq (class ?sitio) sitio_interes)   
                then
                ; objetivos_sitio = lista de objetivos que cumple (multislot cumple_con)
                (bind $?objetivos_sitio (send ?sitio get-cumple_con))

                ; por cada objetivo que cumple el sitio
                (loop-for-count (?m 1 (length$ $?objetivos_sitio)) do
                    (bind ?objetivo (nth$ ?m $?objetivos_sitio))
                    (bind $?tipo_obj_list (send ?objetivo get-tipo_objetivo)) 
                    (bind ?tipo_obj (nth$ 1 $?tipo_obj_list))

                    ; si cumple alguno de los objetivos, ciudad_ofrece_x = TRUE
                    (if (and (= ?objetivo_cultural 1) (eq ?tipo_obj "cultural")) then
                        (bind ?ciudad_ofrece_cultural TRUE)
                    )
                    (if (and (= ?objetivo_romantico 1) (eq ?tipo_obj "romantico")) then
                        (bind ?ciudad_ofrece_romantico TRUE)
                    )
                    (if (and (= ?objetivo_descanso 1) (eq ?tipo_obj "descanso")) then
                        (bind ?ciudad_ofrece_descanso TRUE)
                    )
                )
            )
        )
        
        (if (and
                (or (= ?objetivo_cultural 0)  (eq ?ciudad_ofrece_cultural  TRUE))
                (or (= ?objetivo_romantico 0) (eq ?ciudad_ofrece_romantico TRUE))
                (or (= ?objetivo_descanso 0)  (eq ?ciudad_ofrece_descanso  TRUE))
            )
            then
            (bind $?result
                (insert$ $?result
                    (+ (length$ $?result) 1)
                    ?ciudad))
        )
    
    )

    (return $?result)
)

; filtrar_por_clima
; dada una lista de ciudades y la variable clima_preferido indicada por el usuario,
; retorna una lista con solo aquellas ciudades cuyo clima sea igual a clima_preferido
;
; parametros de entrada:
;    - clima_preferido - string que indica el clima deseado por el usuario
;    - lista_ciudades  - lista de ciudades a filtrar
;
; -> lista result vacia
; -> por cada ciudad c de lista_ciudades
;       -> si el clima de c == clima_preferido, añade la c a result
; -> retorna result
;
(deffunction filtrar_por_clima (?clima_preferido $?lista_ciudades)
    (bind $?result (create$))
    (loop-for-count (?i 1 (length$ $?lista_ciudades)) do
        (bind ?ciudad (nth$ ?i $?lista_ciudades))
        (if (eq 
                (sym-cat (send ?ciudad get-clima))
                (sym-cat ?clima_preferido))
            then
            (bind $?result           ; push de la ciudad que tiene clima ?clima_preferido
                (insert$ $?result
                    (+ (length$ $?result) 1)
                    ?ciudad))
        )
    )
    (return $?result)
)

; filtrar_ciudad_por_comodidad
; dada una lista de ciudades y la variable comodidad indicada por el usuario,
; retorna una lista con solo aquellas ciudades que tengan al menos un hotel
; con comodidad igual o mayor a la especificada
;
; parametros de entrada:
;    - comodidad      - entero en el rango 1..5 que indica la comodidad deseada por el usuario
;    - lista_ciudades - lista de ciudades a filtrar
;
; -> lista result vacia
; -> por cada ciudad c
;       -> por cada hotel h de c
;          -> obtiene la comodidad convirtiendo la forma num* a num (por ejemplo, 5* -> 5)
;          -> si comodidad del usuario es mayor o igual a la de h, se añade c a la lista result
; -> retorna result
;
(deffunction filtrar_ciudad_por_comodidad (?comodidad $?lista_ciudades)
    (bind $?result (create$))
    (loop-for-count (?i 1 (length$ $?lista_ciudades)) do
        (bind ?ciudad (nth$ ?i $?lista_ciudades))
        (bind $?elementos (send ?ciudad get-dispone_de))          ; obtiene hoteles y sitios de interes
        (bind ?ciudad_pasa FALSE)

        (loop-for-count (?j 1 (length$ $?elementos)) do
            (if (not (eq ?ciudad_pasa TRUE))                      ; si la ciudad se ha incluido, ya no se mira ningun otro hotel
                then
                (bind ?elemento (nth$ ?j $?elementos))
                (if (eq (class ?elemento) alojamiento)            ; filtra solo los hoteles
                    then
                    (bind ?comodidad_str (send ?elemento get-comodidad_alojamiento))        ; obtiene "num*"
                    (bind ?comodidad_num (string-to-field (sub-string 1 1 ?comodidad_str))) ; extrae  "num"
                    (if (>= ?comodidad_num ?comodidad)
                        then
                        (bind ?ciudad_pasa TRUE)
                    )
                )
            )
        )

        (if (eq ?ciudad_pasa TRUE)
            then
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?ciudad))
        )
    )
    (return $?result)
)

; recomendar_viaje_ciudades
; funcion que recibe restricciones del viaje, como el presupuesto, dias maximos y minimos en una ciudad, ciudad maximas y minimas
; que se desean visitar, y la lista de ciudad (previamente filtrada) y se calcula un posible viaje con diferentes ciudades. Esta
; funcion calcula el viaje eligiendo aleatoriamente el numero de ciudades que se visitaran, respetando el rango de min/max de
; ciudades que el usuario desea visitar, y se reparte el presupuesto equitativamente (llamado presupuesto_parcial).
; Posteriormente, se itera por cada ciudad de la lista lista_ciudades, eligiendo el alojamiento mas barato (teniendo en cuenta
; que se habra filtrado previamente por comodidad deseada del usuario) siempre y cuando el coste no exceda el presupuesto_parcial.
; Si no existe ningun alojamiento que cumpla los requisitos del presupuesto_parcial, se ignora la ciudad en cuestion.
; Este algoritmo prioriza estar el maximo numero de dias posibles en una ciudad, aunque si el presupuesto no lo permite, esta
; variable se minimiza.
; Tambien se considera la comodidad indicada por el usuario anteriormente, filtrando aquellos alojamientos que no tengan la
; comodidad minima.
;
; Este enfoque ajusta el presupuesto con una seleccion de ciudades dentro del rango deseado, repartiendolo el presupuesto y dias
; de forma homogenea entre las ciudades elegidas.
;
; parametros de entrada:
;    - ?presupuesto             - presupuesto indicado por el usuario
;    - ?comodidad               - comodidad minima preferida del usuario
;    - ?tamanno_grupo           - tamanno del grupo de viaje
;    - ?max_dias_totales        - dias maximos que el usuario quiere estar de vacaciones
;    - ?min_dias_en_ciudad      - minimos dias de estancia deseados en una ciudad
;    - ?max_dias_en_ciudad      - maximos dias de estancia deseados en una ciudad
;    - ?min_ciudades_visitadas  - minimo de ciudades que se desea visitar
;    - ?max_ciudades_visitadas  - maximo de ciudades que se desea visitar
;    - $?lista_ciudades         - lista de ciudades previamente filtrada
;
; -> lista result vacia
; -> ciudades_a_visitar     = numero aleatorio entre (min_ciudades_visitadas, max_ciudades_visitadas)
; -> presupuesto_parcial    = presupuesto / ciudades_a_visitar
; -> por cada ciudad c (con un maximo de ciudades_a_visitar)
;       -> dias_intento = max_dias_en_ciudad
;       -> mientras no se encuentre alojamiento en c y dias_intento >= min_dias_en_ciudad
;          -> busca el alojamiento k mas barato, que no exceda presupuesto_parcial y que cumpla con la comodidad minima del usuario
;          -> dias_intento -= 1
;       -> annade el k junto a la ciudad c como alojamiento dentro del viaje
; -> retorna result
;
(deffunction recomendar_viaje_ciudades (?presupuesto ?comodidad ?tamanno_grupo ?max_dias_totales ?min_dias_en_ciudad ?max_dias_en_ciudad ?min_ciudades_visitadas ?max_ciudades_visitadas $?lista_ciudades)

    ; recomendaciones del viaje, lista con formato: 
    ; ciudad1 dias1 alojamiento1 ciudad2 dias2 alojamiento2 ...
    (bind $?result (create$))

    ; para simplificar se selecciona un numero aleatorio de ciudades
    (bind ?rango_ciudades (+ 1 (- ?max_ciudades_visitadas ?min_ciudades_visitadas)))
    (bind ?ciudades_a_visitar (+ ?min_ciudades_visitadas (mod (round (random)) ?rango_ciudades)))
    (bind ?ciudades_a_visitar (min ?ciudades_a_visitar (length$ $?lista_ciudades)))

    ; si no hay ciudades disponibles, return lista vacia result
    (if (= ?ciudades_a_visitar 0)
        then
        (printout t "No se encontraron ciudades que cumplan los criterios." crlf)
        (return $?result)
    )

    (bind ?presupuesto_restante ?presupuesto)

    ; presupuesto máximo por ciudad: se divide equitativamente entre todas las ciudades a visitar
    (bind ?presupuesto_parcial (/ ?presupuesto ?ciudades_a_visitar))

    (bind ?dias_totales_acumulados 0)

    ; por cada ciudad i
    (loop-for-count (?i 1 ?ciudades_a_visitar) do
        (bind ?ciudad (nth$ ?i $?lista_ciudades))
        (bind $?elementos (send ?ciudad get-dispone_de))

        
        (bind ?encontrado FALSE)                ; ?encontrado indica si se ha encontrado un hotel en esa ciudad
        (bind ?dias_seleccionados 0)            ; dias de instancia en la ciudad
        (bind ?hotel_seleccionado nil)

        ; la busqueda comienza considerando la maxima estancia posible que se nos permita, respetando las condiciones:
        ; 1. no excede los dias maximos en una ciudad
        ; 2. no excede los dias_totales que deseamos estar de vacaciones
        (bind ?dias_intento (min ?max_dias_en_ciudad (- ?max_dias_totales ?dias_totales_acumulados)))
        ; si max_dias_totales - dias_totales_acumulados < min_dias_en_ciudad entonces no nos cabe ninguna ciudad
        ; ==> saltamos la ciudad
        (if (< (- ?max_dias_totales ?dias_totales_acumulados) ?min_dias_en_ciudad)
            then (bind ?encontrado TRUE)
        )


        (while (and (not ?encontrado) (>= ?dias_intento ?min_dias_en_ciudad)) do

            ; buscamos el hotel más barato que quepa en presupuesto
            (bind ?precio_min 9999999)
            (bind ?hotel_min nil)

            ; por cada alojamiento k
            (loop-for-count (?k 1 (length$ $?elementos)) do
                (bind ?elemento (nth$ ?k $?elementos))
                (if (eq (class ?elemento) alojamiento)      ; comprobacion para saber si k es un alojamiento
                    then
                    ; la comodidad de un alojamiento tiene formato "N*", esta linea extrae el integer
                    (bind ?estrellas (string-to-field (sub-string 1 1 (send ?elemento get-comodidad_alojamiento))))
                    (bind ?precio_noche (send ?elemento get-precio_alojamiento))
                    (bind ?coste_total (* ?precio_noche (* ?dias_intento ?tamanno_grupo)))

                    ; si es el mas barato y menor al presupuesto_parcial de esta ciudad y satisface la comodidad del usuario, 
                    ; se acepta el alojamiento
                    (if (and (>= ?estrellas ?comodidad) (<= ?coste_total ?presupuesto_parcial) (< ?precio_noche ?precio_min))
                        then
                        (bind ?precio_min ?precio_noche)
                        (bind ?hotel_min ?elemento)
                    )
                )
            )

            ; si se ha encontrado un hotel
            (if (neq ?hotel_min nil)
                then
                (bind ?encontrado TRUE)
                (bind ?dias_seleccionados ?dias_intento)
                (bind ?hotel_seleccionado ?hotel_min)
                (bind ?presupuesto_restante (- ?presupuesto_restante (* ?precio_min (* ?dias_intento ?tamanno_grupo))))
            )

            (bind ?dias_intento (- ?dias_intento 1)) ; prueba con un numero menos de dias en la ciudad
        )

        ; si se ha encontrado un hotel que quepa en el presupuesto, se annade a result
        (if (and ?encontrado (neq ?hotel_seleccionado nil))
            then
            ; dias_totales_acumulados = dias_totales_acumulados + dias_seleccionados
            (bind ?dias_totales_acumulados (+ ?dias_totales_acumulados ?dias_seleccionados))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?ciudad))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?dias_seleccionados))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?hotel_seleccionado))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) (* ?precio_min (* ?dias_seleccionados ?tamanno_grupo))))
        )
    )

    ; no se han encontrado ciudades
    (if (= (length$ $?result) 0)
        then
        (printout t "No se encontraron suficientes ciudades que cumplan los criterios." crlf)
    )
    (return $?result)
)


; recomendar_viaje_ciudades_inversa
; recomendar_viaje_ciudades_inversa es idemtica a recomendar_viaje_ciudades, pero la lista de ciudades se invierte para obtener
; una mayor variedad en las recomendaciones de viaje. Para ello simplemente se recorre la lista al reves.
;
; parametros de entrada:
;    - ?presupuesto             - presupuesto indicado por el usuario
;    - ?comodidad               - comodidad minima preferida del usuario
;    - ?tamanno_grupo           - tamanno del grupo de viaje
;    - ?max_dias_totales        - dias maximos que el usuario quiere estar de vacaciones
;    - ?min_dias_en_ciudad      - minimos dias de estancia deseados en una ciudad
;    - ?max_dias_en_ciudad      - maximos dias de estancia deseados en una ciudad
;    - ?min_ciudades_visitadas  - minimo de ciudades que se desea visitar
;    - ?max_ciudades_visitadas  - maximo de ciudades que se desea visitar
;    - $?lista_ciudades         - lista de ciudades previamente filtrada
;
; -> lista result vacia
; -> ciudades_a_visitar     = numero aleatorio entre (min_ciudades_visitadas, max_ciudades_visitadas)
; -> presupuesto_parcial    = presupuesto / ciudades_a_visitar
; -> por cada ciudad c (con un maximo de ciudades_a_visitar)
;       -> dias_intento = max_dias_en_ciudad
;       -> mientras no se encuentre alojamiento en c y dias_intento >= min_dias_en_ciudad
;          -> busca el alojamiento k mas barato, que no exceda presupuesto_parcial y que cumpla con la comodidad minima del usuario
;       -> annade el k junto a la ciudad c como destino dentro del viaje
;               
; -> retorna result
;
(deffunction recomendar_viaje_ciudades_inversa (?presupuesto ?comodidad ?tamanno_grupo ?max_dias_totales ?min_dias_en_ciudad ?max_dias_en_ciudad ?min_ciudades_visitadas ?max_ciudades_visitadas $?lista_ciudades)

    ; recomendaciones del viaje, lista con formato: 
    ; ciudad1 dias1 alojamiento1 ciudad2 dias2 alojamiento2 ...
    (bind $?result (create$))

    ; para simplificar se selecciona un numero aleatorio de ciudades
    (bind ?rango_ciudades (+ 1 (- ?max_ciudades_visitadas ?min_ciudades_visitadas)))
    (bind ?ciudades_a_visitar (+ ?min_ciudades_visitadas (mod (round (random)) ?rango_ciudades)))
    (bind ?ciudades_a_visitar (min ?ciudades_a_visitar (length$ $?lista_ciudades)))

    ; si no hay ciudades disponibles, return lista vacia result
    (if (= ?ciudades_a_visitar 0)
        then
        (printout t "No se encontraron ciudades que cumplan los criterios." crlf)
        (return $?result)
    )

    (bind ?presupuesto_restante ?presupuesto)

    ; presupuesto máximo por ciudad: se divide equitativamente entre todas las ciudades a visitar
    (bind ?presupuesto_parcial (/ ?presupuesto ?ciudades_a_visitar))

    (bind ?dias_totales_acumulados 0)
    ; por cada ciudad i
    (loop-for-count (?i 1 ?ciudades_a_visitar) do
        (bind ?idx (- (length$ $?lista_ciudades) (- ?i 1)))
        (bind ?ciudad (nth$ ?idx $?lista_ciudades))
        (bind $?elementos (send ?ciudad get-dispone_de))

        
        (bind ?encontrado FALSE)                ; ?encontrado indica si se ha encontrado un hotel en esa ciudad
        (bind ?dias_seleccionados 0)            ; dias de instancia en la ciudad
        (bind ?hotel_seleccionado nil)

        
        ; la busqueda comienza considerando la maxima estancia posible que se nos permita, respetando las condiciones:
        ; 1. no excede los dias maximos en una ciudad
        ; 2. no excede los dias_totales que deseamos estar de vacaciones
        (bind ?dias_intento (min ?max_dias_en_ciudad (- ?max_dias_totales ?dias_totales_acumulados)))
        ; si max_dias_totales - dias_totales_acumulados < min_dias_en_ciudad entonces no nos cabe ninguna ciudad
        ; ==> saltamos la (todas) ciudad
        (if (< (- ?max_dias_totales ?dias_totales_acumulados) ?min_dias_en_ciudad)
            then (bind ?encontrado TRUE)
        )

        
        (while (and (not ?encontrado) (>= ?dias_intento ?min_dias_en_ciudad)) do

            ; buscamos el hotel más barato que quepa en presupuesto
            (bind ?precio_min 9999999)
            (bind ?hotel_min nil)

            ; por cada alojamiento k
            (loop-for-count (?k 1 (length$ $?elementos)) do
                (bind ?elemento (nth$ ?k $?elementos))
                (if (eq (class ?elemento) alojamiento)      ; comprobacion para saber si k es un alojamiento
                    then
                    ; la comodidad de un alojamiento tiene formato "N*", esta linea extrae el integer
                    (bind ?estrellas (string-to-field (sub-string 1 1 (send ?elemento get-comodidad_alojamiento))))
                    (bind ?precio_noche (send ?elemento get-precio_alojamiento))
                    (bind ?coste_total (* ?precio_noche (* ?dias_intento ?tamanno_grupo)))

                    ; si es el mas barato y menor al presupuesto_parcial de esta ciudad y satisface la comodidad del usuario, 
                    ; se acepta el alojamiento
                    (if (and (>= ?estrellas ?comodidad) (<= ?coste_total ?presupuesto_parcial) (< ?precio_noche ?precio_min))
                        then
                        (bind ?precio_min ?precio_noche)
                        (bind ?hotel_min ?elemento)
                    )
                )
            )

            ; si se ha encontrado un hotel
            (if (neq ?hotel_min nil)
                then
                (bind ?encontrado TRUE)
                (bind ?dias_seleccionados ?dias_intento)
                (bind ?hotel_seleccionado ?hotel_min)
                (bind ?presupuesto_restante (- ?presupuesto_restante (* ?precio_min (* ?dias_intento ?tamanno_grupo))))
            )

            (bind ?dias_intento (- ?dias_intento 1)) ; probamos con un numero menos de dias en la ciudad
        )

        ; si se ha encontrado un hotel que quepa en el presupuesto, se annade a result
        (if (and ?encontrado (neq ?hotel_seleccionado nil))
            then
            ; dias_totales_acumulados = dias_totales_acumulados + dias_seleccionados
            (bind ?dias_totales_acumulados (+ ?dias_totales_acumulados ?dias_seleccionados))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?ciudad))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?dias_seleccionados))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?hotel_seleccionado))
            (bind $?result (insert$ $?result (+ (length$ $?result) 1) (* ?precio_min (* ?dias_seleccionados ?tamanno_grupo))))
        )
    )

    ; no se han encontrado ciudades
    (if (= (length$ $?result) 0)
        then
        (printout t "No se encontraron suficientes ciudades que cumplan los criterios." crlf)
    )
    (return $?result)
)


; recomendar_viaje_ciudades_premium
; funcion que recibe restricciones del viaje, como el presupuesto, dias maximos y minimos en una ciudad, ciudad maximas y minimas
; que se desean visitar, y la lista de ciudad (previamente filtrada) y se calcula un posible viaje con diferentes ciudades.
; A diferencia de la anterior funcion, recomendar_viaje_ciudades_premium busca ciudades priorizando la calidad; es decir,
; ajustando el presupuesto al maximo para obtener alojamientos de mejor calidad. No se utiliza el presupuesto parcial
; como en la anterior recomendar_viaje_ciudades, sino que se añaden ciudades mientras no se exceda ni el presupuesto
; ni las condiciones indicadas. 
; Se itera por cada ciudad de la lista lista_ciudades, eligiendo el alojamiento mas caro (teniendo en cuenta
; que se habra filtrado previamente por comodidad deseada del usuario) siempre y cuando el coste no exceda el presupuesto.
; Si no existe ningun alojamiento que cumpla los requisitos, se ignora la ciudad en cuestion.
; Este algoritmo prioriza estar el maximo numero de dias posibles en una ciudad, aunque si el presupuesto no lo permite, esta
; variable se minimiza.
; Tambien se considera la comodidad indicada por el usuario anteriormente, filtrando aquellos alojamientos que no tengan la
; comodidad minima.
;
; Este enfoque ajusta el presupuesto para una mayor calidad, priorizando alojamientos con un alto coste e igual que la funcion
; recomendar_viaje_ciudades, maximizando los dias de estancia en una ciudad.
;
; parametros de entrada:
;    - ?presupuesto             - presupuesto indicado por el usuario
;    - ?comodidad               - comodidad minima preferida del usuario
;    - ?tamanno_grupo           - tamanno del grupo de viaje
;    - ?max_dias_totales        - dias maximos que el usuario quiere estar de vacaciones
;    - ?min_dias_en_ciudad      - minimos dias de estancia deseados en una ciudad
;    - ?max_dias_en_ciudad      - maximos dias de estancia deseados en una ciudad
;    - ?min_ciudades_visitadas  - minimo de ciudades que se desea visitar
;    - ?max_ciudades_visitadas  - maximo de ciudades que se desea visitar
;    - $?lista_ciudades         - lista de ciudades previamente filtrada
;
; -> lista result vacia
; -> por cada ciudad c (con un maximo de ciudades_a_visitar)
;       -> dias_intento = max_dias_en_ciudad
;       -> mientras no se encuentre alojamiento en c y dias_intento >= min_dias_en_ciudad
;          -> busca el alojamiento k mas caro, que no exceda presupuesto y que cumpla con la comodidad minima del usuario
;       -> annade el k junto a la ciudad c como destino dentro del viaje
; -> retorna result
;
(deffunction recomendar_viaje_ciudades_premium (?presupuesto ?comodidad ?tamanno_grupo ?max_dias_totales ?min_dias_en_ciudad ?max_dias_en_ciudad ?min_ciudades_visitadas ?max_ciudades_visitadas $?lista_ciudades)

    ; recomendaciones del viaje, lista con formato: 
    ; ciudad1 dias1 alojamiento1 ciudad2 dias2 alojamiento2 ...
    (bind $?result (create$))

    (bind ?presupuesto_restante ?presupuesto)
    (bind ?ciudades_añadidas 0)


    (bind ?dias_totales_acumulados 0)
    (loop-for-count (?i 1 (length$ $?lista_ciudades)) do
        (bind ?ciudad (nth$ ?i $?lista_ciudades))

        ; se annaden ciudades siempre que se puede y no se supera el maximo
        (if (< ?ciudades_añadidas ?max_ciudades_visitadas)
            then
            (bind $?elementos (send ?ciudad get-dispone_de))

            (bind ?encontrado FALSE)
            (bind ?dias_seleccionados 0)
            (bind ?hotel_seleccionado nil)

            ; la busqueda comienza considerando la maxima estancia posible que se nos permita, respetando las condiciones:
            ; 1. no excede los dias maximos en una ciudad
            ; 2. no excede los dias_totales que deseamos estar de vacaciones
            (bind ?dias_intento (min ?max_dias_en_ciudad (- ?max_dias_totales ?dias_totales_acumulados)))
            ; si max_dias_totales - dias_totales_acumulados < min_dias_en_ciudad entonces no nos cabe ninguna ciudad
            ; ==> saltamos la (todas) ciudad
            (if (< (- ?max_dias_totales ?dias_totales_acumulados) ?min_dias_en_ciudad)
                then (bind ?encontrado TRUE)
            )


            (while (and (not ?encontrado) (>= ?dias_intento ?min_dias_en_ciudad) ) do

                ; buscamos el hotel más caro que quepa en presupuesto
                (bind ?precio_max 0)
                (bind ?hotel_min nil)

                (loop-for-count (?k 1 (length$ $?elementos)) do
                    (bind ?elemento (nth$ ?k $?elementos))
                    (if (eq (class ?elemento) alojamiento)      ; comprobacion para saber si k es un alojamiento
                        then
                        ; la comodidad de un alojamiento tiene formato "N*", esta linea extrae el integer
                        (bind ?estrellas (string-to-field (sub-string 1 1 (send ?elemento get-comodidad_alojamiento))))
                        (bind ?precio_noche (send ?elemento get-precio_alojamiento))
                        (bind ?coste_total (* ?precio_noche (* ?dias_intento ?tamanno_grupo)))

                        ; si es el mas caro, satisface la comodidad del usuario y cabe en el presupuesto
                        (if (and (>= ?estrellas ?comodidad) (<= ?coste_total ?presupuesto_restante) (> ?precio_noche ?precio_max))
                            then
                            (bind ?precio_max ?precio_noche)
                            (bind ?hotel_min ?elemento)
                        )
                    )
                )

                (if (neq ?hotel_min nil)
                    then
                    (bind ?encontrado TRUE)
                    (bind ?dias_seleccionados ?dias_intento)
                    (bind ?hotel_seleccionado ?hotel_min)
                    (bind ?presupuesto_restante (- ?presupuesto_restante (* ?precio_max (* ?dias_intento ?tamanno_grupo))))
                )

                (bind ?dias_intento (- ?dias_intento 1))
            )

            (if (and ?encontrado (neq ?hotel_seleccionado nil))
                then
                ; dias_totales_acumulados = dias_totales_acumulados + dias_seleccionados
                (bind ?dias_totales_acumulados (+ ?dias_totales_acumulados ?dias_seleccionados))
                (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?ciudad))
                (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?dias_seleccionados))
                (bind $?result (insert$ $?result (+ (length$ $?result) 1) ?hotel_seleccionado))
                (bind $?result (insert$ $?result (+ (length$ $?result) 1) (* ?precio_max (* ?dias_seleccionados ?tamanno_grupo))))
                
                (bind ?ciudades_añadidas (+ ?ciudades_añadidas 1))
            )
        )
    )

    ; no se han encontrado ciudades
    (if (< ?ciudades_añadidas ?min_ciudades_visitadas)
        then
        (printout t "No se encontraron suficientes ciudades que cumplan los criterios." crlf)
        (return (create$))
    )

    (return $?result)
)


(defrule obtener_ruta "Recorre por todas las ciudades de la base de datos para obtener la ruta ideal"
    ?e <- (exigencia 
                    (presupuesto ?presupuesto) 
                    (max_dias_totales ?max_dias_totales)
                    (min_dias_en_ciudad ?min_dias_en_ciudad)
                    (max_dias_en_ciudad ?max_dias_en_ciudad)
                    (min_ciudades_visitadas ?min_ciudades_visitadas)
                    (max_ciudades_visitadas ?max_ciudades_visitadas)
                    (tamanno_grupo ?tamanno_grupo) 
                    (restriccion_transporte ?restriccion_transporte)
                    (prefiere_coche ?prefiere_coche)
                    (prefiere_tren ?prefiere_tren)
                    (prefiere_avion ?prefiere_avion)
                    (prefiere_barco ?prefiere_barco)
                    (objetivo_romantico ?objetivo_romantico)
                    (objetivo_cultural ?objetivo_cultural)
                    (objetivo_descanso ?objetivo_descanso)
                    (destinos_tranquilos ?destinos_tranquilos)
                    (restriccion_clima ?restriccion_clima)
                    (clima_preferido ?clima_preferido) 
                    (comodidad ?comodidad))
    =>

    ; se parte de la totalidad de las ciudades y se pasa la lista por una serie de filtros que
    ; eliminaran las ciudades que no cumplan los requisitos del cliente
    (bind $?ciudades (find-all-instances ((?instancia ciudad)) TRUE))

    ; si el cliente ha especificado que desea transportes particulares, se filtra segun estos
    (if (= ?restriccion_transporte 1)
        then
        (bind $?ciudades (filtrar_ciudad_por_transporte ?prefiere_coche ?prefiere_tren ?prefiere_avion ?prefiere_barco $?ciudades))
    )

    ; si el cliente ha especificado que desea viajar a ciudades con un clima particular,
    ; se filtras las ciudades segun este
    (if (= ?restriccion_clima 1)
        then
        (bind $?ciudades (filtrar_por_clima ?clima_preferido $?ciudades))
    )

    ; se filtran las ciudades cuyos hoteles no posean una comodidad minima deseada por el usuario
    (bind $?ciudades (filtrar_ciudad_por_comodidad ?comodidad $?ciudades))

    ; se filtran las ciudades segun los objetivos deseados del usuario
    (bind $?ciudades (filtrar_ciudad_por_objetivos ?objetivo_romantico ?objetivo_cultural ?objetivo_descanso $?ciudades))

    ; si el cliente ha especificado que desea destinos tranquilos, se filtran las ciudades
    ; que tengan una densidad poblacional >= 3000
    (if (= ?destinos_tranquilos 1) 
        then 
        (bind $?ciudades (filtrar_ciudad_por_densidad $?ciudades))
    )

    (printout t crlf)
    (printout t crlf)
    
    ; recomendacion del primer viaje
    (printout t "=========================================" crlf)
    (printout t "============ Viaje  estándar ============" crlf)
    (bind $?viaje (recomendar_viaje_ciudades ?presupuesto ?comodidad ?tamanno_grupo ?max_dias_totales ?min_dias_en_ciudad ?max_dias_en_ciudad ?min_ciudades_visitadas ?max_ciudades_visitadas $?ciudades))

    (loop-for-count (?i 1 (div (length$ $?viaje) 4)) do
        (bind ?ciudad (nth$ (- (* ?i 4) 3) $?viaje))
        (bind ?dias   (nth$ (- (* ?i 4) 2) $?viaje))
        (bind ?hotel  (nth$ (- (* ?i 4) 1) $?viaje))
        (bind ?coste  (nth$ (* ?i 4)       $?viaje))
        (printout t (send ?ciudad get-nombre_ciudad) crlf)
        (printout t "Número de días de visita     : " ?dias crlf)
        (printout t "Alojamiento durante el viaje : " (send ?hotel get-nombre_alojamiento) crlf)
        (printout t "Coste                        : " ?coste crlf)
        (printout t crlf)
        (printout t "Tipo de ciudad               : " (send ?ciudad get-tipo_ciudad) crlf)
        (printout t "Coste de vida                : " (send ?ciudad get-coste_de_vida) crlf)
        (printout t "Densidad poblacional         : " (send ?ciudad get-densidad_poblacional) " habitantes por kilómetro cuadrado" crlf)
        (printout t "Clima                        : " (send ?ciudad get-clima) crlf)
        (printout t "Gastronomía                  : " (send ?ciudad get-gastronomia) crlf)
        ; lista los sitios de interes de la forma nombre_sitio_interes [Objetivo1, Objetivo2, Objetivo3]
        ; itera por los sitios de interes de la ciudad, despues por los objetivos y los escribe en forma
        ; de string
        (printout t "Sitios de interés:" crlf)
        (bind $?elementos (send ?ciudad get-dispone_de))
        (loop-for-count (?j 1 (length$ $?elementos)) do
            (bind ?elemento (nth$ ?j $?elementos))
            (if (eq (class ?elemento) sitio_interes)        ; por cada j sitio de interes
                then
                (bind $?objetivos (send ?elemento get-cumple_con))  ; recibe todos los objetivos
                (bind ?objetivos_str "")
                (loop-for-count (?m 1 (length$ $?objetivos)) do     ; por cada objetivo m que cumple j
                    (bind ?objetivo (nth$ ?m $?objetivos))
                    (bind ?tipo (nth$ 1 (send ?objetivo get-tipo_objetivo)))    ; recibe atributo tipo_objetivo
                    (if (= ?m 1)    ; si es la primera iteracion del bucle
                        then (bind ?objetivos_str ?tipo)                                ; escribe sin coma
                        else (bind ?objetivos_str (str-cat ?objetivos_str ", " ?tipo))  ; annade coma
                    )
                )
                (printout t "  -> " (send ?elemento get-nombre_sitio_interes) " [" ?objetivos_str "]" crlf)
            )
        )
        (printout t "------------------------------" crlf)
        (printout t crlf)
    )
    (printout t "===============================" crlf)
    (printout t  crlf)
    (printout t  crlf)

    ; recomendacion del segundo viaje, recorriendo la lista del reves
    (printout t "=========================================" crlf)
    (printout t "=========== Viaje estándar #2 ===========" crlf)
    (bind $?viaje2 (recomendar_viaje_ciudades_inversa ?presupuesto ?comodidad ?tamanno_grupo ?max_dias_totales ?min_dias_en_ciudad ?max_dias_en_ciudad ?min_ciudades_visitadas ?max_ciudades_visitadas $?ciudades))
    (loop-for-count (?i 1 (div (length$ $?viaje2) 4)) do
        (bind ?ciudad (nth$ (- (* ?i 4) 3) $?viaje2))
        (bind ?dias   (nth$ (- (* ?i 4) 2) $?viaje2))
        (bind ?hotel  (nth$ (- (* ?i 4) 1) $?viaje2))
        (bind ?coste  (nth$ (* ?i 4)       $?viaje2))
        (printout t (send ?ciudad get-nombre_ciudad) crlf)
        (printout t "Número de días de visita     : " ?dias crlf)
        (printout t "Alojamiento durante el viaje : " (send ?hotel get-nombre_alojamiento) crlf)
        (printout t "Coste                        : " ?coste crlf)
        (printout t "Tipo de ciudad               : " (send ?ciudad get-tipo_ciudad) crlf)
        (printout t "Coste de vida                : " (send ?ciudad get-coste_de_vida) crlf)
        (printout t "Densidad poblacional         : " (send ?ciudad get-densidad_poblacional) " habitantes por kilómetro cuadrado" crlf)
        (printout t "Clima                        : " (send ?ciudad get-clima) crlf)        
        (printout t "Gastronomía                  : " (send ?ciudad get-gastronomia) crlf)
        ; lista los sitios de interes de la forma nombre_sitio_interes [Objetivo1, Objetivo2, Objetivo3]
        ; itera por los sitios de interes de la ciudad, despues por los objetivos y los escribe en forma
        ; de string
        (printout t "Sitios de interés:" crlf)
        (bind $?elementos (send ?ciudad get-dispone_de))
        (loop-for-count (?j 1 (length$ $?elementos)) do
            (bind ?elemento (nth$ ?j $?elementos))
            (if (eq (class ?elemento) sitio_interes)        ; por cada j sitio de interes
                then
                (bind $?objetivos (send ?elemento get-cumple_con))  ; recibe todos los objetivos
                (bind ?objetivos_str "")
                (loop-for-count (?m 1 (length$ $?objetivos)) do     ; por cada objetivo m que cumple j
                    (bind ?objetivo (nth$ ?m $?objetivos))
                    (bind ?tipo (nth$ 1 (send ?objetivo get-tipo_objetivo)))    ; recibe atributo tipo_objetivo
                    (if (= ?m 1)    ; si es la primera iteracion del bucle
                        then (bind ?objetivos_str ?tipo)                                ; escribe sin coma
                        else (bind ?objetivos_str (str-cat ?objetivos_str ", " ?tipo))  ; annade coma
                    )
                )
                (printout t "  -> " (send ?elemento get-nombre_sitio_interes) " [" ?objetivos_str "]" crlf)
            )
        )
        (printout t "------------------------------" crlf)
        (printout t crlf)
    )
    (printout t "===============================" crlf)
    (printout t  crlf)
    (printout t  crlf)

    ; recomendacion del tercer viaje, priorizando la calidad del alojamiento
    (printout t "=========================================" crlf)
    (printout t "========== $$ Viaje Premium $$ ==========" crlf)
    (bind $?viaje2 (recomendar_viaje_ciudades_premium ?presupuesto ?comodidad ?tamanno_grupo ?max_dias_totales ?min_dias_en_ciudad ?max_dias_en_ciudad ?min_ciudades_visitadas ?max_ciudades_visitadas $?ciudades))
    (loop-for-count (?i 1 (div (length$ $?viaje2) 4)) do
        (bind ?ciudad (nth$ (- (* ?i 4) 3) $?viaje2))
        (bind ?dias   (nth$ (- (* ?i 4) 2) $?viaje2))
        (bind ?hotel  (nth$ (- (* ?i 4) 1) $?viaje2))
        (bind ?coste  (nth$ (* ?i 4)       $?viaje2))
        (printout t (send ?ciudad get-nombre_ciudad) crlf)
        (printout t "Número de días de visita     : " ?dias crlf)
        (printout t "Alojamiento durante el viaje : " (send ?hotel get-nombre_alojamiento) crlf)
        (printout t "Coste                        : " ?coste crlf)
        (printout t crlf)
        (printout t "Tipo de ciudad               : " (send ?ciudad get-tipo_ciudad) crlf)
        (printout t "Coste de vida                : " (send ?ciudad get-coste_de_vida) crlf)
        (printout t "Densidad poblacional         : " (send ?ciudad get-densidad_poblacional) " habitantes por kilómetro cuadrado" crlf)
        (printout t "Clima                        : " (send ?ciudad get-clima) crlf)        
        (printout t "Gastronomía                  : " (send ?ciudad get-gastronomia) crlf)
        ; lista los sitios de interes de la forma nombre_sitio_interes [Objetivo1, Objetivo2, Objetivo3]
        ; itera por los sitios de interes de la ciudad, despues por los objetivos y los escribe en forma
        ; de string
        (printout t "Sitios de interés:" crlf)
        (bind $?elementos (send ?ciudad get-dispone_de))
        (loop-for-count (?j 1 (length$ $?elementos)) do
            (bind ?elemento (nth$ ?j $?elementos))
            (if (eq (class ?elemento) sitio_interes)        ; por cada j sitio de interes
                then
                (bind $?objetivos (send ?elemento get-cumple_con))  ; recibe todos los objetivos
                (bind ?objetivos_str "")
                (loop-for-count (?m 1 (length$ $?objetivos)) do     ; por cada objetivo m que cumple j
                    (bind ?objetivo (nth$ ?m $?objetivos))
                    (bind ?tipo (nth$ 1 (send ?objetivo get-tipo_objetivo)))    ; recibe atributo tipo_objetivo
                    (if (= ?m 1)    ; si es la primera iteracion del bucle
                        then (bind ?objetivos_str ?tipo)                                ; escribe sin coma
                        else (bind ?objetivos_str (str-cat ?objetivos_str ", " ?tipo))  ; annade coma
                    )
                )
                (printout t "  -> " (send ?elemento get-nombre_sitio_interes) " [" ?objetivos_str "]" crlf)
            )
        )
        (printout t "------------------------------" crlf)
        (printout t crlf)
    )
)