(define (domain ext4)

  (:requirements :strips :typing :fluents :negative-preconditions :disjunctive-preconditions :conditional-effects :equality)

  (:types
      ciudad
      hotel
      vuelo
  )

  (:predicates
      (en ?c - ciudad) ; Ubicación actual.
      (conecta ?v - vuelo ?o - ciudad ?d - ciudad)
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
      (coste-total)
      (interes-total)

      ; Restricciones del problema.
      (min-dias-ciudad)
      (max-dias-ciudad)
      (min-dias-total)
      (min-presupuesto)
      (max-presupuesto)

      (coste-vuelo ?v - vuelo)
      (coste-hotel ?h - hotel)
      (interes ?c - ciudad)
  )

  ; Moverse entre ciudades
  (:action viajar

    :parameters (?v - vuelo ?o - ciudad ?d - ciudad)

    :precondition
      (and
        (en ?o)
        (conecta ?v ?o ?d)
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
        (increase (coste-total) (coste-vuelo ?v))
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

    :parameters (?c - ciudad ?h - hotel)

    :precondition
      (and
        (en ?c)
        (alojado ?c ?h)
        (< (dias-en ?c) (max-dias-ciudad))
      )

    :effect
      (and
        (increase (dias-en ?c) 1)
        (increase (tiempo-total) 1)
        (increase (coste-total) (coste-hotel ?h))

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
