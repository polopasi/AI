(define (problem viaje-europa)

  (:domain ext3)

  (:objects

      origen madrid paris roma - ciudad

      hm1 hm2
      hp1 hp2
      hr1 hr2
      - hotel

      vm1 vm2
      vp1 vp2
      vr1 vr2
      mp1 mp2
      mr1 mr2
      pm1 pm2
      pr1 pr2
      rm1 rm2
      rp1 rp2
      - vuelo
  )

  (:init

      ; Iniciamos el recorrido en una ciudad fantasma, llamada "origen".
      (en origen)
      (inicio)

      ; Contadores
      (= (numero-ciudades-visitadas) 0)
      (= (tiempo-total) 0)
      (= (coste-total) 0)

      (= (dias-en madrid) 0)
      (= (dias-en paris) 0)
      (= (dias-en roma) 0)

      ; Restricciones de estancia
      (= (min-dias-ciudad) 1)
      (= (max-dias-ciudad) 3)
      (= (min-dias-total) 3)

      (= (min-presupuesto) 365)
      (= (max-presupuesto) 365)

      ; Hoteles
      (hotel-en hm1 madrid)
      (hotel-en hm2 madrid)

      (hotel-en hp1 paris)
      (hotel-en hp2 paris)

      (hotel-en hr1 roma)
      (hotel-en hr2 roma)

      ; Precios hoteles (por noche)
      (= (coste-hotel hm1) 50)
      (= (coste-hotel hm2) 90)

      (= (coste-hotel hp1) 60)
      (= (coste-hotel hp2) 120)

      (= (coste-hotel hr1) 55)
      (= (coste-hotel hr2) 100)

      ; Conectamos la ciudad origen con todas las ciudades del sistema.
      (conecta vm1 origen madrid)
      (conecta vm2 origen madrid)

      (conecta vp1 origen paris)
      (conecta vp2 origen paris)

      (conecta vr1 origen roma)
      (conecta vr2 origen roma)

      ; Vuelos entre ciudades
      (conecta mp1 madrid paris)
      (conecta mp2 madrid paris)

      (conecta mr1 madrid roma)
      (conecta mr2 madrid roma)

      (conecta pm1 paris madrid)
      (conecta pm2 paris madrid)

      (conecta pr1 paris roma)
      (conecta pr2 paris roma)

      (conecta rm1 roma madrid)
      (conecta rm2 roma madrid)

      (conecta rp1 roma paris)
      (conecta rp2 roma paris)

      ; Costes vuelos
      (= (coste-vuelo vm1) 80)
      (= (coste-vuelo vm2) 150)

      (= (coste-vuelo vp1) 90)
      (= (coste-vuelo vp2) 180)

      (= (coste-vuelo vr1) 100)
      (= (coste-vuelo vr2) 170)

      (= (coste-vuelo mp1) 70)
      (= (coste-vuelo mp2) 140)

      (= (coste-vuelo mr1) 60)
      (= (coste-vuelo mr2) 130)

      (= (coste-vuelo pm1) 70)
      (= (coste-vuelo pm2) 140)

      (= (coste-vuelo pr1) 50)
      (= (coste-vuelo pr2) 120)

      (= (coste-vuelo rm1) 60)
      (= (coste-vuelo rm2) 130)

      (= (coste-vuelo rp1) 50)
      (= (coste-vuelo rp2) 120)
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

  (:metric minimize (coste-total))
)
