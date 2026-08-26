package IA.Desastres;

import java.util.Arrays;

import aima.search.framework.HeuristicFunction;


public class DesastresHeuristicFunctionPrio implements HeuristicFunction {

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
     *     (2): minimizar la suma de todos los tiempos empleados por los helicopteros en 
     *          rescatar a todos los grupos, pero minimizando el tiempo que se tarda en 
     *          rescatar a los grupos de prioridad 1; es decir, minimizar tambien el tiempo 
     *          desde el inicio del rescate hasta el ultimo grupo de prioridad 1 llega a un 
     *          centro de rescate
     * 
     */
    /*
     * Funcion heuristica: funcion heuristica que calcula y devuelve el coste de la solucion.
     * Esta funcion sera llamada por la clase DesastresHeuristicFunction.
     * Criterio dos del enunciado: 
     *    minimizar la suma de todos los tiempos empleados por los helicopteros en rescatar 
     *    a todos los grupos, pero minimizando el tiempo que se tarda en rescatar a los
     *    grupos de prioridad 1; es decir, minimizar tambien el tiempo desde el inicio del rescate
     *    hasta el ultimo grupo de prioridad 1 llega a un centro de rescate
    */
    public double getHeuristicValue(Object n){
        /*
         * tiempo_total = 0.0
         * tiempo_total_prioritarios = 0.0 
         * 1. Por cada h (helicoptero) de representacionEstado:
         *     1.1. Calcula el tiempo_rescate_h total que tarda un Helicoptero en rescatar a sus grupos
         *     1.2. tiempo total += tiempo_rescate_h
         *     1.3. Siendo tiempo_rescate_ultimo_prioritario_h el tiempo en el que el ultimo grupo 
         *          prioritario (de la grupos_a_rescatar de h) es rescatado
         *          1.3.1. Si tiempo_total_prioritarios < tiempo_rescate_ultimo_prioritario_h 
         *                 entonces tiempo_total_prioritarios = tiempo_rescate_ultimo_prioritario_h
         * 2. return tiempo_total + tiempo_total_prioritarios
         */
        DesastresBoard board = (DesastresBoard)n;
        int rescatados_prio = 0;
        int rescatados_noprio = 0;
        int viajes = 0;
        double distancia = 0.0;
        //int grupos_noprio = 0;

        // por cada helicoptero 
        for (int i = 0; i < board.getTotalHelicopteros(); ++i) {
            int heliCoordX = board.getHelicopteroCoordX(i);
            int heliCoordY = board.getHelicopteroCoordY(i);
            int lastCoordX = heliCoordX;
            int lastCoordY = heliCoordY;
            int rescatados = 0;
            int grupos_viaje = 0;
            int grupos_prio = 0;
            int sizeGruposR = board.getSizeGruposR(i);
            int contador_grupos = sizeGruposR;
            Boolean grupos_rescatados[] = new Boolean[sizeGruposR];
            int grupos_pendientes_prio = 0;
            for (int j = 0; j < sizeGruposR; j++) {
                if (board.getGrupoPrioridad(board.getGruposARescatar(i).get(j)) == 1) grupos_pendientes_prio++;
            }
            int grupos_pendientes_noprio = sizeGruposR - grupos_pendientes_prio;
            Arrays.fill(grupos_rescatados, false);
            grupos_prio = grupos_pendientes_prio;
            //grupos_noprio += grupos_pendientes_noprio;

            // por cada grupo PRIORITARIO a rescatar
            while (grupos_pendientes_prio > 0) {
                //al estar puestos los prioritarios primero, no hace falta recorrer toda la lista
                for (int j = 0; j < grupos_prio; ++j) {
                    int personas_rescatadas = board.getTamannoGrupo(board.getGruposARescatar(i).get(j));
                    int grupoCoordX, grupoCoordY;
                    grupoCoordX = board.getGrupoCoordX(j);
                    grupoCoordY = board.getGrupoCoordY(j);
                    int futuros_rescatados = rescatados + personas_rescatadas;
                    //no está rescatado       &&   nos cabe
                    if (!grupos_rescatados[j] && (futuros_rescatados <= 15)) {
                        rescatados += personas_rescatadas;
                        rescatados_prio += personas_rescatadas;
                        distancia += this.dist(lastCoordX, lastCoordY, grupoCoordX, grupoCoordY);
                        lastCoordX = grupoCoordX;
                        lastCoordY = grupoCoordY;
                        grupos_rescatados[j] = true;
                        grupos_viaje++;
                        grupos_pendientes_prio--;
                    } else contador_grupos--;
                    //si con el último rescate hemos llegado a los 3 grupos rescatados; no nos cabrán más grupos
                    //por restricciones del enunciado, volvemos
                    if (grupos_viaje == 3 || rescatados == 15 || contador_grupos == 0 || grupos_pendientes_prio == 0){
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
            contador_grupos = sizeGruposR;
            //por cada grupo no prioritario a rescatar
            while (grupos_pendientes_noprio > 0) {
                for (int j = grupos_prio; j < sizeGruposR; ++j) {
                    int personas_rescatadas = board.getTamannoGrupo(board.getGruposARescatar(i).get(j));
                    int grupoCoordX, grupoCoordY;
                    grupoCoordX = board.getGrupoCoordX(j);
                    grupoCoordY = board.getGrupoCoordY(j);
                    int futuros_rescatados = rescatados + personas_rescatadas;
                        //no está rescatado    &&        nos cabe
                    if (!grupos_rescatados[j] && (futuros_rescatados <= 15)) {
                        rescatados += personas_rescatadas;
                        rescatados_noprio += personas_rescatadas;
                        distancia += this.dist(lastCoordX, lastCoordY, grupoCoordX, grupoCoordY);
                        lastCoordX = grupoCoordX;
                        lastCoordY = grupoCoordY;
                        grupos_rescatados[j] = true;
                        grupos_viaje++;
                        grupos_pendientes_noprio--;
                    } else contador_grupos--;
                    //si con el último rescate hemos llegado a los 3 grupos rescatados O no nos cabrán más grupos
                    //por restricciones del enunciado, volvemos
                    if (grupos_viaje == 3 || rescatados == 15 || contador_grupos == 0 || grupos_pendientes_noprio == 0){
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
}
