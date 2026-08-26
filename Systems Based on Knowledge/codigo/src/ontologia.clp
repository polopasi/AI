;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 24/05/2026 14:20:25

(defclass preferencia
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot acompanyado_con
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prefiere_viajar_en
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prefiere_visitar
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass tamanyo_grupo
    (is-a preferencia)
    (role concrete)
    (pattern-match reactive)
    (multislot alojado_en
        (type INSTANCE)
        (create-accessor read-write))
    (slot numero_integrantes
        (type INTEGER)
        (create-accessor read-write))
)

(defclass restriccion
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot limitado_por
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass duracion
    (is-a restriccion)
    (role concrete)
    (pattern-match reactive)
    (slot max_dias_totales
        (type INTEGER)
        (create-accessor read-write))
    (slot min_dias_totales
        (type INTEGER)
        (create-accessor read-write))
)

(defclass numero_paradas
    (is-a restriccion)
    (role concrete)
    (pattern-match reactive)
    (slot max_ciudades_visitadas
        (type INTEGER)
        (create-accessor read-write))
    (slot min_ciudades_visitadas
        (type INTEGER)
        (create-accessor read-write))
    (slot topDataProperty
        (type INTEGER)
        (create-accessor read-write))
)

(defclass presupuesto
    (is-a restriccion)
    (role concrete)
    (pattern-match reactive)
    (slot presupuesto
        (type FLOAT)
        (create-accessor read-write))
    (slot umbral_presupuesto
        (type FLOAT)
        (create-accessor read-write))
)

(defclass tiempo_ciudad
    (is-a restriccion)
    (role concrete)
    (pattern-match reactive)
    (slot max_dias_en_ciudad
        (type INTEGER)
        (create-accessor read-write))
    (slot min_dias_en_ciudad
        (type INTEGER)
        (create-accessor read-write))
)

(defclass alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot capacidad_alojamiento
        (type INTEGER)
        (create-accessor read-write))
    (slot comodidad_alojamiento
        (type STRING)
        (create-accessor read-write))
    (slot nombre_alojamiento
        (type STRING)
        (create-accessor read-write))
    (slot precio_alojamiento
        (type FLOAT)
        (create-accessor read-write))
)

(defclass ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot dispone_de
        (type INSTANCE)
        (create-accessor read-write))
    (slot clima
        (type STRING)
        (create-accessor read-write))
    (slot coste_de_vida
        (type STRING)
        (create-accessor read-write))
    (slot densidad_poblacional
        (type FLOAT)
        (create-accessor read-write))
    (slot gastronomia
        (type STRING)
        (create-accessor read-write))
    (slot nombre_ciudad
        (type STRING)
        (create-accessor read-write))
    (slot tipo_ciudad
        (type STRING)
        (create-accessor read-write))
)

(defclass objetivo
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot tipo
        (type INSTANCE)
        (create-accessor read-write))
    (slot tipo_de_ocio
        (type STRING)
        (create-accessor read-write))
    (multislot tipo_objetivo
        (type STRING)
        (create-accessor read-write))
)

(defclass sitio_interes
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot cumple_con
        (type INSTANCE)
        (create-accessor read-write))
    (slot horario_sitio_interes
        (type SYMBOL)
        (create-accessor read-write))
    (slot nombre_sitio_interes
        (type STRING)
        (create-accessor read-write))
    (slot precio_sitio_interes
        (type FLOAT)
        (create-accessor read-write))
)

(defclass transporte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot tipo_transporte
        (type STRING)
        (create-accessor read-write))
)

(defclass usuario
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot realiza
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tiene_preferencia
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tiene_restriccion
        (type INSTANCE)
        (create-accessor read-write))
    (multislot topObjectProperty
        (type INSTANCE)
        (create-accessor read-write))
    (slot edad_usuario
        (type INTEGER)
        (create-accessor read-write))
    (slot nivel_cultural
        (type STRING)
        (create-accessor read-write))
    (slot nombre_usuario
        (type STRING)
        (create-accessor read-write))
)

(defclass viaje
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot quiere_cumplir
        (type INSTANCE)
        (create-accessor read-write))
    (multislot visita
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
)
