(define (domain ext2)

  (:requirements :strips :typing :fluents :negative-preconditions :conditional-effects :disjunctive-preconditions :equality)

  (:types
    ciudad
    hotel
  )

  (:predicates
    (en ?c - ciudad) ; Ubicación actual.
    (vuelo ?o - ciudad ?d - ciudad)
    (hotel-en ?h - hotel ?c - ciudad)
    (visitada ?c - ciudad)
    (alojado ?c - ciudad ?h - hotel)
    (tiene-hotel ?c - ciudad) ; Así se evita alojarse en dos hoteles distintos en una misma ciudad.
    (inicio) ; Evita tener días de estancia en la ciudad fantasma "origen".
  )

  (:functions
    (dias-en ?c - ciudad)
    (tiempo-total) ; Número de días del viaje.
    (numero-ciudades-visitadas)
    (interes-total)

    ; Parámetros del problema
    (min-dias-ciudad)
    (max-dias-ciudad)
    (min-dias-total)

    (interes ?c - ciudad)
  )

  ; Moverse entre ciudades
  (:action viajar

    :parameters (?o - ciudad ?d - ciudad)

    :precondition
      (and
        (en ?o)
        (vuelo ?o ?d)
        (not (visitada ?d))

        (or
          (inicio)
          (>= (dias-en ?o) (min-dias-ciudad))
        )
      )

    :effect
      (and
        (not (en ?o))
        (en ?d)
        (not (inicio))
      )
  )

  ; Elegir hotel en ciudad (solo una vez por ciudad)
  (:action alojarse

    :parameters (?c - ciudad ?h - hotel)

    :precondition
      (and
        (en ?c)
        (hotel-en ?h ?c)
        (not (tiene-hotel ?c))
      )

    :effect
      (and
        (alojado ?c ?h)
        (tiene-hotel ?c)
      )
  )

  ; Incrementa en uno el número de días que se está dentro de una ciudad.
  (:action pasar-dia

    :parameters (?c - ciudad)

    :precondition
      (and
        (en ?c)
        (tiene-hotel ?c)
        (< (dias-en ?c) (max-dias-ciudad))
      )

    :effect
      (and
        (increase (dias-en ?c) 1)
        (increase (tiempo-total) 1)

        (when
          (not (visitada ?c))
          (and
            (visitada ?c)
            (increase (numero-ciudades-visitadas) 1)
            (increase (interes-total) (interes ?c))
          )
        )
      )
  )
)
