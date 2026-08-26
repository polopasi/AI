(define (problem viaje-europa)

  (:domain ext4)

  (:objects

      origen madrid paris roma - ciudad

      h_m1 h_m2
      h_p1 h_p2
      h_r1 h_r2
      - hotel

      v1 v2 v3 v4 v5 v6 v7 v8 v9 - vuelo
  )

  (:init

      ; Iniciamos el recorrido en una ciudad fantasma, llamada "origen".
      (en origen)
      (inicio)

      ; Contadores
      (= (numero-ciudades-visitadas) 0)
      (= (tiempo-total) 0)
      (= (coste-total) 0)
      (= (interes-total) 0)

      (= (dias-en madrid) 0)
      (= (dias-en paris) 0)
      (= (dias-en roma) 0)

      ; Restricciones de estancia
      (= (min-dias-ciudad) 1)
      (= (max-dias-ciudad) 3)
      (= (min-dias-total) 5)

      (= (min-presupuesto) 200)
      (= (max-presupuesto) 800)

      ; Interés de las ciudades
      ; 1 = máximo interés | 2 = interés medio | 3 = interés bajo
      (= (interes madrid) 1)
      (= (interes paris) 3)
      (= (interes roma) 2)

      ;; Hoteles
      (hotel-en h_m1 madrid)
      (hotel-en h_m2 madrid)

      (hotel-en h_p1 paris)
      (hotel-en h_p2 paris)

      (hotel-en h_r1 roma)
      (hotel-en h_r2 roma)

      ; Costes hoteles (por noche)
      (= (coste-hotel h_m1) 50)
      (= (coste-hotel h_m2) 90)

      (= (coste-hotel h_p1) 60)
      (= (coste-hotel h_p2) 120)

      (= (coste-hotel h_r1) 55)
      (= (coste-hotel h_r2) 100)

      ; Conectamos la ciudad origen con todas las ciudades del sistema.
      (conecta v1 origen madrid)
      (conecta v2 origen paris)
      (conecta v3 origen roma)

      ; Vuelos entre ciudades
      (conecta v4 madrid paris)
      (conecta v5 madrid roma)

      (conecta v6 paris madrid)
      (conecta v7 paris roma)

      (conecta v8 roma madrid)
      (conecta v9 roma paris)

      ;; Costes vuelos
      (= (coste-vuelo v1) 80)
      (= (coste-vuelo v2) 120)
      (= (coste-vuelo v3) 110)

      (= (coste-vuelo v4) 70)
      (= (coste-vuelo v5) 100)

      (= (coste-vuelo v6) 85)
      (= (coste-vuelo v7) 75)

      (= (coste-vuelo v8) 95)
      (= (coste-vuelo v9) 90)
  )

  (:goal

    (and
      (>= (numero-ciudades-visitadas) 3)
      (>= (tiempo-total) (min-dias-total))
      (>= (coste-total) (min-presupuesto))
      (<= (coste-total) (max-presupuesto))

      (forall (?c - ciudad)
        (or
          (= ?c origen)
          (not (visitada ?c))
          (>= (dias-en ?c) (min-dias-ciudad))
        )
      )
    )
  )

  ; Los pesos 1 y 10 sirven para priorizar el interés por las ciudades que el presupuesto.
  (:metric minimize
    (+ (* 1 (coste-total))
       (* 0 (interes-total)))
  )
)
