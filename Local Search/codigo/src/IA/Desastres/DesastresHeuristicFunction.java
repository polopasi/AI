package IA.Desastres;

import java.util.Arrays;

import aima.search.framework.HeuristicFunction;
public class DesastresHeuristicFunction implements HeuristicFunction {


    private double VELOCIDAD = 100.0 / 60;
    private double DESCANSO = 10.0;


    private double dist(int x0, int y0, int x1, int y1) {
        return Math.sqrt((x1 - x0)*(x1 - x0) + (y1 - y0)*(y1 - y0));
    }

    /*
     * Funcion que devuelve el coste de un estado n.
     * Llama a una de las dos funciones heuristicas (criterios de la solucion) dada una 
     * variable que indica el criterio a minimizar:
     * 
     *     (1): minimizar la suma de todos los tiempos empleados por los helicopteros en 
     *          rescatar a todos los grupos (no consideramos que todos se hace en paralelo)
     * 
     */
    /*
     * Funcion heuristica: funcion heuristica que calcula y devuelve el coste de la solucion.
     * Esta funcion sera llamada por la clase DesastresHeuristicFunction.
     * Criterio uno del enunciado: 
     *    minimizar la suma de todos los tiempos empleados por los helicopteros en rescatar 
     *    a todos los grupos (no consideramos que todos se hace en paralelo)
    */
    public double getHeuristicValue(Object n){
        // calcula el coste de la solucion segun el criterio uno del enunciado
        /*
         * tiempo_total = 0.0
         * 1. Por cada h (helicoptero) de representacionEstado:
         *     1.1. Calcula el tiempo_rescate_h total que tarda un Helicoptero en rescatar a sus grupos
         *     1.2. tiempo total += tiempo_rescate_h
         * 2. return tiempo_total
         */
        DesastresBoard board = (DesastresBoard)n;
        int rescatados = 0;
        int viajes = 0;
        double distancia = 0.0;
        int rescatados_prio = 0;
        int rescatados_noprio = 0;

        // por cada helicoptero 
        for (int i = 0; i < board.getTotalHelicopteros(); ++i) {
            int heliCoordX = board.getHelicopteroCoordX(i);
            int heliCoordY = board.getHelicopteroCoordY(i);
            int lastCoordX = heliCoordX;
            int lastCoordY = heliCoordY;
            int grupos_viaje = 0;
            int sizeGruposR = board.getSizeGruposR(i);
            int contador_grupos = sizeGruposR;
            Boolean grupos_rescatados[] = new Boolean[sizeGruposR];
            int grupos_pendientes = sizeGruposR; //variable para saber rápidamente si hemos rescatado todo el grupop
            Arrays.fill(grupos_rescatados, false);
            
            while (grupos_pendientes > 0) {
                    // por cada grupo a rescatar
                for (int j = 0; j < sizeGruposR; ++j) {
                    int personas_rescatadas = board.getTamannoGrupo(board.getGruposARescatar(i).get(j));
                    int grupoCoordX, grupoCoordY;
                    grupoCoordX = board.getGrupoCoordX(j);
                    grupoCoordY = board.getGrupoCoordY(j);
                    int futuros_rescatados = rescatados + personas_rescatadas;
                    //el grupo no está rescatado y nos cabe
                    if (!grupos_rescatados[j] && (futuros_rescatados <= 15)) {
                        rescatados += personas_rescatadas;
                        distancia += this.dist(lastCoordX, lastCoordY, grupoCoordX, grupoCoordY);
                        lastCoordX = grupoCoordX;
                        lastCoordY = grupoCoordY;
                        grupos_rescatados[j] = true;
                        grupos_viaje++;
                        grupos_pendientes--;
                        if (board.getGrupoPrioridad(board.getGruposARescatar(i).get(j)) == 1) rescatados_prio += personas_rescatadas;
                        else rescatados_noprio += personas_rescatadas;
                    } else contador_grupos--;
                    //si con el último rescate hemos llegado a los 3 grupos rescatados; no nos cabrán más grupos
                    //por restricciones del enunciado, volvemos
                    if (grupos_viaje == 3 || rescatados == 15 || contador_grupos == 0 || grupos_pendientes == 0){
                        distancia += this.dist(lastCoordX, lastCoordY, heliCoordX, heliCoordY);
                        viajes++;
                        rescatados = 0;
                        lastCoordX = heliCoordX;
                        lastCoordY = heliCoordY;
                        grupos_viaje = 0;
                        contador_grupos = sizeGruposR;
                    }
                }
            }
        }
        return (distancia / VELOCIDAD) + (DESCANSO * viajes) + (rescatados_prio * 2.0) + (rescatados_noprio * 1.0);
    }
};
