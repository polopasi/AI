(define (domain basic)

  (:requirements :strips :typing :fluents :negative-preconditions)

  (:types
    ciudad hotel
  )

  (:predicates
    (en ?c - ciudad) ; Ubicación actual.
    (vuelo ?o - ciudad ?d - ciudad)
    (hotel-en ?h - hotel ?c - ciudad)
    (visitada ?c - ciudad)
  )

  (:functions
    (numero-ciudades-visitadas)
  )

  ; Moverse entre ciudades
  (:action viajar

    :parameters (?o - ciudad ?d - ciudad)

    :precondition
      (and
        (en ?o)
        (vuelo ?o ?d)
        (visitada ?o)
        (not (visitada ?d))
      )

    :effect
      (and
        (not (en ?o))
        (en ?d)
      )
  )

  ; Elegir hotel en ciudad (solo una vez por ciudad)
  (:action alojarse

    :parameters (?h - hotel ?c - ciudad)

    :precondition
      (and
        (en ?c)
        (hotel-en ?h ?c)
        (not (visitada ?c))
      )

    :effect
      (and
        (visitada ?c)
        (increase (numero-ciudades-visitadas) 1)
      )
  )
)
