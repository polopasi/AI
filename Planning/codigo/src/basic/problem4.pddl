(define (problem viaje-europa)

  (:domain basic)

  (:objects

    origen madrid paris roma berlin lisboa - ciudad

    hotel-madrid-1 hotel-madrid-2
    hotel-paris-1 hotel-paris-2
    hotel-roma-1
    hotel-berlin-1
    hotel-lisboa-1
      - hotel
  )

  (:init

    ; Iniciamos el recorrido en una ciudad fantasma, llamada "origen".
    (en origen)
    (visitada origen)
    (= (numero-ciudades-visitadas) 0)

    ; Hoteles
    (hotel-en hotel-berlin-1 berlin)

    (hotel-en hotel-lisboa-1 lisboa)

    (hotel-en hotel-madrid-1 madrid)
    (hotel-en hotel-madrid-2 madrid)

    (hotel-en hotel-paris-1 paris)
    (hotel-en hotel-paris-2 paris)

    (hotel-en hotel-roma-1 roma)

    ; Conectamos la ciudad origen con todas las ciudades del sistema.
    (vuelo origen berlin)
    (vuelo origen lisboa)
    (vuelo origen madrid)
    (vuelo origen paris)
    (vuelo origen roma)

    ; Vuelos entre ciudades
    (vuelo berlin paris)
    (vuelo berlin roma)

    (vuelo lisboa madrid)
    
    (vuelo madrid paris)
    (vuelo madrid lisboa)

    (vuelo paris berlin)
    (vuelo paris madrid)
    (vuelo paris roma)
    
    (vuelo roma paris)
    (vuelo roma berlin)
  )

  (:goal
    (<= (numero-ciudades-visitadas) 5)
  )

  (:metric minimize (numero-ciudades-visitadas)) ; Si no existe esta línea, no se ejecuta en la versión de Windows.
)
