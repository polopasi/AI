package IA.Desastres;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Random;


public class DesastresBoard {

    //private int tiempoTotal;            // tiempo de rescate segun criterio (1), suma secuencial de los tiempos
    //private int tiempoPrioritarios;     // tiempo de rescate segun criterio (2), tiempo empleado en rescatar a los heridos

    private Centros centros;            // la clase Centros que recibimos en las constructoras
    private Grupos grupos;              // la clase Grupos que recibimos en las constructoras
    //private int numberHelicoptersPerCenter;     // quiza es static
    //private int max_tiempo = Integer.MAX_VALUE;
    

    /*public int getMaxTiempo() {
        return max_tiempo;
    }
    public void setMaxTiempo(int n) {
        this.max_tiempo = n;
    }*/
    
    /*  
     * Un estado viene determinado por un array de Helicopteros. Un Helicoptero viene determinado por
     * una estructura (id_centro, grupos_a_rescatar)
     * donde id_centro es el centro del que proviene un Helicoptero, y los grupos a rescatar un array
     * de identificadores de los grupos. 
     * 
     * Como en Java no hay pairs, se ha creado (una clase privada Helicoptero con los atributos 
     * mencionados (esto lo podemos cambiar!!!)
    */
    private class Helicoptero { 
        public int idCentro;
        public ArrayList<Integer> gruposARescatar;
        //public int viajes_hechos;
        //public int grupos_prioritarios_rescatados;
        //public int grupos_no_prioritarios_rescatados;

        public Helicoptero() {
        }

        public Helicoptero(Helicoptero h) {
            this.idCentro = h.idCentro;
            this.gruposARescatar = new ArrayList<>(h.gruposARescatar);
        }
    }

    private Helicoptero[] representacionEstado;

    // comparador para las colas ordenadas por tamaño que usamos en las funciones de generacion de estado inicial
    private Comparator<Integer> comparador_size = new Comparator<Integer>() {
        @Override
        // compara los tamaños de dos grupos i y j, y retorna el que tenga el tamaño mayor
        public int compare(Integer i, Integer j) {
            return getTamannoGrupo(j) - getTamannoGrupo(i);
        }
    };

    public void imprimirEstado() {   
        for (int h = 0; h < representacionEstado.length; ++h) {
            System.out.println(this.getGruposARescatar(h));
        }
    }

    public void imprimirSolucion() {
        System.out.println("Grupos rescatados por cada helicoptero y viaje:");
        
        for (int helicoptero = 0; helicoptero < representacionEstado.length; ++helicoptero) {
            System.out.println("-- Helicoptero " + helicoptero + ": ");

            int gruposRescatados = this.getGruposARescatar(helicoptero).size();

            if (gruposRescatados > 0) {
                int personasRescatadas = 0;
                int gruposEnUnVuelo = 0;
                int viaje = 1;
                System.out.print("Viaje " + viaje + ":");

                for (int i = 0; i < gruposRescatados; ++i) {
                    
                    int actualGrupo = this.getGruposARescatar(helicoptero).get(i);
                    int numeroPersonasGrupoActual = getTamannoGrupo(actualGrupo);

                    if (gruposEnUnVuelo == 3 || personasRescatadas + numeroPersonasGrupoActual > 15) {
                        System.out.println(); // nueva línea para nuevo grupo
                        viaje++;
                        System.out.print("Viaje " + viaje + ":");
                        personasRescatadas = 0;
                        gruposEnUnVuelo = 0;
                    }

                    System.out.print(" " + actualGrupo);
                    personasRescatadas += numeroPersonasGrupoActual;
                    gruposEnUnVuelo++;
                }
                System.out.println();
            }
        }
    }


    public int getTotalHelicopteros() {
        return representacionEstado.length;
    }

    public int getSizeGruposR(int h) {
        return representacionEstado[h].gruposARescatar.size();
    }
    
    public int getTamannoGrupo(int i) {
        return this.grupos.get(i).getNPersonas();
    }

    
    public int getGrupoPrioridad(int i) {
        return this.grupos.get(i).getPrioridad();
    }

    
    public int getGrupoCoordX(int i) {
        return this.grupos.get(i).getCoordX();
    }

    public int getGrupoCoordY(int i) {
        return this.grupos.get(i).getCoordY();
    }

    public int getHelicopteroCoordX(int h) {
        int idC = this.representacionEstado[h].idCentro;
        return this.centros.get(idC).getCoordX();
    }

    public int getHelicopteroCoordY(int h) {
        int idC = this.representacionEstado[h].idCentro;
        return this.centros.get(idC).getCoordY();
    }

    public ArrayList<Integer> getGruposARescatar(int h) {
        return this.representacionEstado[h].gruposARescatar;
    }


    /*
     * Constructora principal de la clase
     * Llama a las funcion GeneracionEstadoInicial.
     * Asigna centros y grupos a sus atributos privados para utilizarlos en otras funciones. 
     * Para determinar que generacion de estado inicial utilizar (aleatoria o colas de prioridad o distancias),
     * utilizamos una variable generacion.
     */
    public DesastresBoard(Centros centros, Grupos grupos, int generacion) {
        // asignar atributos
        this.centros = centros;
        this.grupos = grupos;


        /* 
         * PREGUNTA: lo hacemos asi o simplificamos H*C
        int num_total_helicopteros = 0;
        for (int i = 0; i < centros.size(); ++i) {
            num_total_helicopteros  += centros.get(i).getNHelicopteros();
        }
        */

        int H = centros.get(0).getNHelicopteros();
        int C = centros.size();

        this.representacionEstado = new Helicoptero[H*C];
        for (int i = 0; i < H*C; ++i) {
            this.representacionEstado[i] = new Helicoptero();
            this.representacionEstado[i].idCentro = i / H;
            this.representacionEstado[i].gruposARescatar = new ArrayList<Integer>();
        }


        switch(generacion){
            case 0:
                // llamamiento de GeneracionEstadoInicialPrioridadAleatorio
                this.GeneracionEstadoInicialPrioridadAleatorio();
                break;
            case 1:
                // llamamiento de GeneracionEstadoInicialDistancias
                this.GeneracionEstadoInicialDistancias();
                break;
            case 2:
                // llamamiento de GeneracionEstadoInicialPrioridadDistancias
                this.GeneracionEstadoInicialPrioridadDistancias();
                break;
            default:
                // llamamiento de GeneracionEstadoInicialAleatorioTotal
                this.GeneracionEstadoInicialAleatorioTotal();
                break;
            }
    }

    /*
     * Constructora de la clase que recibe un DesastresBoard 
     * creando una copia de board. Esta funcion se utilizara
     * principalmente por SuccessorFunction.
     */
    public DesastresBoard(DesastresBoard board) {
        // clone de board
        this.centros = board.centros;
        this.grupos = board.grupos;
        //this.numberHelicoptersPerCenter = board.numberHelicoptersPerCenter;
        this.representacionEstado = new Helicoptero[board.representacionEstado.length];
        for (int i = 0; i < this.representacionEstado.length; ++i) {
            this.representacionEstado[i] = new Helicoptero(board.representacionEstado[i]);
        }
        //this.tiempoPrioritarios = board.tiempoPrioritarios;
        //this.tiempoTotal = board.tiempoTotal;
    }

    /*
     * Funcion que genera el estado inicial de forma aleatoria
     * asigna valores al atributo privado representacion_estado
    */
    private void GeneracionEstadoInicialAleatorioTotal() {
        // asigna de forma aleatoria que grupos rescata cada helicoptero
        // RESTRICCION: ningun grupo puede ser rescatado por mas de un helicoptero
        //              es decir, un mismo grupo no puede ser asignado en mas de
        //              un helicoptero

        /*
         * 1. Inicializa representacionEstado, que es el array de C*H Helicopteros
         * 2. Por cada grupo g de Grupos:
         *     2.1. Asigna el grupo g a un Helicoptero aleatorio
        */
        Random rand = new Random();
        for (int i = 0; i < this.grupos.size(); ++i) {
            representacionEstado[rand.nextInt(this.getTotalHelicopteros())].gruposARescatar.add(i);
        }


    }

    /*
     * Funcion que genera el estado inicial con colas de prioridad
     * asigna valores al atributo privado representacion_estado
    */
    private void GeneracionEstadoInicialPrioridadAleatorio() {
        // Dos colas de prioridad (una para prioridad=1, otra para prioridad=2)
        // las colas se ordenan segun tamanyo de grupo
        // RESTRICCION: ningun grupo puede ser rescatado por mas de un helicoptero
        //              es decir, un mismo grupo no puede ser asignado en mas de
        //              un helicoptero

        /*
         * 1. Crea dos colas de prioridad pq_prioritarios, pq_no_prioritarios cuyos elementos
         *    seran un identificador y su ordenacion por el tamaño del grupo
         * 
         * * primero, creamos las colas de prioridad
         * 
         * 2. Por cada g de Grupos:
         *     2.1. Si g prioritario   , pq_prioritarios.push(g)
         *          Si g no prioritario, pq_no_prioritario.push(g)
         * 
         * 3. Por cada g de pq_prioritrios:
         *     3.1. Asigna el grupo g a un Helicoptero aleatorio
         * 
         * * idem para no prioritarios
         * 
         * 4. Por cada g de pq_no_prioritario:
         *     4.1. Asigna el grupo g a un Helicoptero aleatorio
        */
        PriorityQueue <Integer> pq_prioritarios = new PriorityQueue<Integer>(this.comparador_size);
        PriorityQueue <Integer> pq_no_prioritarios = new PriorityQueue<Integer>(this.comparador_size);

        // asignamos las colas de prioritarios y no prioritarios
        for (int g = 0; g < this.grupos.size(); ++g) {
            if (this.getGrupoPrioridad(g) == 1) pq_prioritarios.add(g);    // push del indice del grupo g
            else pq_no_prioritarios.add(g);
        }

        Random rand = new Random();
        while (!pq_prioritarios.isEmpty()) {
            int g = pq_prioritarios.poll();
            // asignamos el grupo g prioritario a un helicoptero aleatorio
            representacionEstado[rand.nextInt(this.getTotalHelicopteros())].gruposARescatar.add(g);
        }
        while (!pq_no_prioritarios.isEmpty()) {
            int g = pq_no_prioritarios.poll();
            // asignamos el grupo g no prioritario a un helicoptero aleatorio
            representacionEstado[rand.nextInt(this.getTotalHelicopteros())].gruposARescatar.add(g);
        }
    }


    private void GeneracionEstadoInicialPrioridadDistancias() {
        // Dos colas de prioridad (una para prioridad=1, otra para prioridad=2)
        // las colas se ordenan segun tamanyo de grupo
        // RESTRICCION: ningun grupo puede ser rescatado por mas de un helicoptero
        //              es decir, un mismo grupo no puede ser asignado en mas de
        //              un helicoptero

        /*
         * 1. Crea dos colas de prioridad pq_prioritarios, pq_no_prioritarios cuyos elementos
         *    seran un identificador y su ordenacion por el tamaño del grupo
         * 
         * * primero, creamos las colas de prioridad
         * 
         * 2. Por cada g de Grupos:
         *     2.1. Si g prioritario   , pq_prioritarios.push(g)
         *          Si g no prioritario, pq_no_prioritario.push(g)
         * 
         * * segundo, asignamos los grupos prioritarios a UN (1) helicoptero del centro mas cercano
         * * observacion, hay que intentar distribuir justamente las cargas entre los Helicopteros de
         * * un mismo centro. Por ejemplo, si hay 6 grupos cercanos al centro 1 (que tiene 5 helicopteros)
         * * intentar que la carga de grupos sea (1, 1, 1, 1, 2)
         * 
         * 3. Por cada g de pq_prioritrios:
         *     3.1. Por cada c de Centros
         *           4.1.1. Calcula la distancia dist(g, c)
         *     3.2. Asigna el grupo g a un Helicoptero del centro mas cercano
         * 
         * * idem para no prioritarios
         * 
         * 4. Por cada g de pq_no_prioritario:
         *     4.1. Por cada c de Centros
         *           4.1.1. Calcula la distancia dist(g, c)
         *     4.2. Asigna el grupo g a un Helicoptero del centro mas cercano
        */
        PriorityQueue <Integer> pq_prioritarios = new PriorityQueue<Integer>(this.comparador_size);
        PriorityQueue <Integer> pq_no_prioritarios = new PriorityQueue<Integer>(this.comparador_size);

        // asignamos las colas de prioritarios y no prioritarios
        for (int g = 0; g < this.grupos.size(); ++g) {
            if (this.getGrupoPrioridad(g) == 1) pq_prioritarios.add(g);    // push del indice del grupo g
            else pq_no_prioritarios.add(g);
        }


        // ### Ahora se asignan los grupos a un helicoptero del centro mas distribuyendo las cargas equitativamente ### 
        int H = centros.get(0).getNHelicopteros();
        int C = centros.size();
        // array para contar la carga total de grupos en un centro, asi se puede distribuir la carga
        // equitativamente entre los helicopteros de un mismo centro
        int ngrupos_asignados_a_centro[] = new int[C];

        // por cada g prioritario, buscamos el centro mas cercano y lo asignamos a un helicoptero del mismo centro
        while (!pq_prioritarios.isEmpty()) {

            int g = pq_prioritarios.poll();
            int coordX_g = this.getGrupoCoordX(g);
            int coordY_g = this.getGrupoCoordY(g);
            double distancia_gc = Double.MAX_VALUE;
            int id_centro = -1;

            // por cada centro c, calculamos el centro mas cercano al grupo g
            for (int c = 0; c < this.centros.size(); ++c) {
                int coordX_c = this.centros.get(c).getCoordX();
                int coordY_c = this.centros.get(c).getCoordY();
                double d = this.dist(coordX_g, coordY_g, coordX_c, coordY_c);
                if (d < distancia_gc) {
                    distancia_gc = d;
                    id_centro = c;
                }
            }

            // ngrupos es la carga de grupos en el centro id_centro
            int ngrupos = ngrupos_asignados_a_centro[id_centro];
            // con el modulo repartimos equitativamente los grupos a rescatar entre los helicopteros de un mismo centro
            representacionEstado[H*id_centro + (ngrupos % H)].gruposARescatar.add(g);
            ngrupos_asignados_a_centro[id_centro] +=1;
        }
    }




    private double dist(int x0, int y0, int x1, int y1) {
        return Math.sqrt((x1 - x0)*(x1 - x0) + (y1 - y0)*(y1 - y0));
    }

    private void GeneracionEstadoInicialDistancias() {
        // Generacion del Estado Inicial donde se asigna un grupo g a un helicoptero h del
        // centro mas cercano
        // RESTRICCION: ningun grupo puede ser rescatado por mas de un helicoptero
        //              es decir, un mismo grupo no puede ser asignado en mas de
        //              un helicoptero

        /*
         * 
         * * asignamos un grupo a un helicoptero del centro mas cercano
         * 
         * 1. Por cada g de grupos:
         *      1.1. Por cada c de centros:
         *          1.1.1. Calcula la distancia dist(g, c)
         *      1.2. Asigna el grupo g a un Helicoptero del centro mas cercano
         * 
        */
        int H = centros.get(0).getNHelicopteros();
        int C = centros.size();
        // array para contar la carga total de grupos en un centro, asi se puede distribuir la carga
        // equitativamente entre los helicopteros de un mismo centro
        int ngrupos_asignados_a_centro[] = new int[C];

        // por cada grupo g
        for (int g = 0; g < this.grupos.size(); ++g) {
            int coordX_g = this.getGrupoCoordX(g);
            int coordY_g = this.getGrupoCoordY(g);
            double distancia_gc = Double.MAX_VALUE;
            int id_centro = -1;

            // por cada centro c, calculamos el centro mas cercano al grupo g
            for (int c = 0; c < this.centros.size(); ++c) {
                int coordX_c = this.centros.get(c).getCoordX();
                int coordY_c = this.centros.get(c).getCoordY();
                double d = this.dist(coordX_g, coordY_g, coordX_c, coordY_c);
                if (d < distancia_gc) {
                    distancia_gc = d;
                    id_centro = c;
                }
            }

            // ngrupos es la carga de grupos en el centro id_centro
            int ngrupos = ngrupos_asignados_a_centro[id_centro];
            // con el modulo repartimos equitativamente los grupos a rescatar entre los helicopteros de un mismo centro
            representacionEstado[H*id_centro + (ngrupos % H)].gruposARescatar.add(g);
            ngrupos_asignados_a_centro[id_centro] +=1;
        }
    }



    /*
     * Operador de cambio de orden de dos grupos de un mismo helicoptero
     * Dado dos grupos con identificadores i, j; los cambia de orden
    */
    public void cambiarOrden(int id_helicoptero, int i, int j) {
        // cambia el orden de los grupos i y j que ha de rescatar un helicoptero id_helicoptero
        // por ejemplo, si i=3 y j=1 y un Helicoptero X ha de rescatar a [5, 1, 6, 2, 8, 2] -> [5, 2, 6, 1, 8, 2]
        int aux = representacionEstado[id_helicoptero].gruposARescatar.get(i);
        representacionEstado[id_helicoptero].gruposARescatar.set(i, representacionEstado[id_helicoptero].gruposARescatar.get(j));
        representacionEstado[id_helicoptero].gruposARescatar.set(j, aux);
    }


    /*
     * Operador de intercambio de grupos
     * Dado dos grupos con identificadores i, j; que son rescatados por dos helicopteros hi, hj;
     * los intercambia. Es decir, 
     * hi --> i
     * hj --> j
     * 
     * despues del intercambio
     * 
     * hi --> j
     * hj --> i
    */
    public void intercambioGrupos(int hi, int hj, int i, int j) {
        // helicoptero hi rescatara j; helicoptero hj rescatara i
        // Es un ArrayList de helicópteros del que dentro hay otro ArrayList con los grupos a rescatar.
        
        int aux = representacionEstado[hi].gruposARescatar.get(i);
        representacionEstado[hi].gruposARescatar.set(i, representacionEstado[hj].gruposARescatar.get(j));
        representacionEstado[hj].gruposARescatar.set(j, aux);
    }
    
    @Override
    public String toString() {
        ArrayList<String> lines = new ArrayList<>();
        for (int h = 0; h < representacionEstado.length; ++h) {
            lines.add(this.getGruposARescatar(h).toString());
        }
        return String.join("\n", lines);
    }
    

}