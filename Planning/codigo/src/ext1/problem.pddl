(define (problem viaje-europa)

  (:domain ext1)

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

    (= (dias-en madrid) 0)
    (= (dias-en paris) 0)
    (= (dias-en roma) 0)

    ; Restricciones del problema
    (= (min-dias-ciudad) 1)
    (= (max-dias-ciudad) 3)
    (= (min-dias-total) 5)

    ; Hoteles
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
      (>= (numero-ciudades-visitadas) 3)
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

  (:metric minimize (numero-ciudades-visitadas)) ; Si no existe esta línea, no se ejecuta en la versión de Windows.
)
