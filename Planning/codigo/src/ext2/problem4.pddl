(define (problem viaje-europa)

  (:domain ext2)

  (:objects

    origen madrid paris roma - ciudad

    h_madrid_1 h_madrid_2
    h_paris_1  h_paris_2
    h_roma_1   h_roma_2
    - hotel
  )

  (:init

    ; Iniciamos el recorrido en una ciudad fantasma, llamada "origen".
    (en origen)
    (inicio)

    ; Contadores
    (= (numero-ciudades-visitadas) 0)
    (= (tiempo-total) 0)
    (= (interes-total) 0)

    (= (dias-en madrid) 0)
    (= (dias-en paris) 0)
    (= (dias-en roma) 0)

    ; Restricciones del problema
    (= (min-dias-ciudad) 1)
    (= (max-dias-ciudad) 3)
    (= (min-dias-total) 5)

    ; Interés de las ciudades
    ; 1 = máximo interés | 2 = interés medio | 3 = interés bajo
    (= (interes madrid) 2)
    (= (interes paris) 3)
    (= (interes roma) 1)

    ;; Hoteles
    (hotel-en h_madrid_1 madrid)
    (hotel-en h_madrid_2 madrid)

    (hotel-en h_paris_1 paris)
    (hotel-en h_paris_2 paris)

    (hotel-en h_roma_1 roma)
    (hotel-en h_roma_2 roma)

    ; Conectamos la ciudad origen con todas las ciudades del sistema.
    (vuelo origen madrid)
    (vuelo origen paris)
    (vuelo origen roma)

    ; Vuelos entre ciudades
    (vuelo madrid paris)
    (vuelo madrid roma)

    (vuelo paris madrid)
    (vuelo paris roma)

    (vuelo roma madrid)
    (vuelo roma paris)
  )

  (:goal

    (and
      (>= (numero-ciudades-visitadas) 1)
      (>= (tiempo-total) (min-dias-total))

      (forall (?c - ciudad)
        (or
          (= ?c origen)
          (not (visitada ?c))
          (>= (dias-en ?c) (min-dias-ciudad))
        )
      )
    )
  )

  (:metric minimize (interes-total))
)
