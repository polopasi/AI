package IA.Desastres;

import aima.search.framework.SuccessorFunction;
import aima.search.framework.Successor;
import java.util.ArrayList;
import java.util.List;



/*
    * Funcion que genera todos los sucesores. La generacion de los sucesores
    * es diferente segun el algoritmo de busqueda utilizado:
    *      
    *     (1) Hill Climbing:       generar todas las posibles aplicaciones de los 
    *                              operadores al estado actual
    * 
    *     (2) Simulated Annealing: escoger al azar un operador y generar solo 
    *                              un sucesor aplicando este operador con 
    *                              parametros tambien al azar
    * 
    * Al generar cada sucesor, se especifica un String con la operacion realizada:
    * 
    *     Succesor("operador aplicado a argumentos x, y...", new_state)
    */
public class DesastresSuccesorFunctionIG implements SuccessorFunction{


    private double dist(int x0, int y0, int x1, int y1) {
        return Math.sqrt((x1 - x0)*(x1 - x0) + (y1 - y0)*(y1 - y0));
    }

    public List getSuccessors(Object state){
        ArrayList retval = new ArrayList();
        DesastresBoard board = (DesastresBoard) state;
        /* 
            DesastresBoard hijo = new DesastresBoard(board);
            hijo.cambiarOrden(h, i, j);
            retval.add(hijo);
        */


        /*
         * Generacion de todos los hijos con operador cambiarOrden
         * 
         * 0. total_helicopteros = state.getTotalHelicopteros()
         * 
         * 1. Por cada Helicoptero h hasta total_helicopteros
         *     1.1. gruposARescatar_por_h = state.getGruposARescatar(h)
         *     1.2. Por cada grupo i de gruposARescatar_por_h
         *         1.2.1. Por cada grupo j de gruposARescatar_por_h tal que i != j
         *               1.2.1.1. DesastresBoard hijo = new DesastresBoard(board);
         *               1.2.1.2. hijo.cambiarOrden(h, i, j)
         *               1.2.1.3. retval.add(hijo)
        */
       /* 
        * Intercambiamos el ultimo grupo de h0 por el grupo mas lejano de h1
       */
        int total_helicopteros = board.getTotalHelicopteros();
        for (int h0 = 0; h0 < total_helicopteros; ++h0) {
            if (board.getGruposARescatar(h0).size() != 0) {             // si el helicoptero no tiene a nadie a quien rescatar, no se hace nada

                ArrayList<Integer> gruposARescatar_por_h0 = board.getGruposARescatar(h0);
                for (int h1 = h0 + 1; h1 < total_helicopteros; ++h1) {
                    if (board.getGruposARescatar(h1).size() != 0) {     // si el helicoptero no tiene a nadie a quien rescatar, no se hace nada

                        int id_cambio = -1;
                        double distancia = Double.MAX_VALUE;
                        ArrayList<Integer> gruposARescatar_por_h1 = board.getGruposARescatar(h1);
                        for (int i = 0; i < gruposARescatar_por_h1.size(); i++) {
                            
                            int coordX = board.getGrupoCoordX(gruposARescatar_por_h1.get(i));
                            int coordY = board.getGrupoCoordY(gruposARescatar_por_h1.get(i));
                            double d = this.dist(coordX, coordY, board.getHelicopteroCoordX(h0), board.getHelicopteroCoordY(h0));
                            if (d <= distancia) {
                                distancia = d;
                                id_cambio = i;
                            }
                        }
                        DesastresBoard hijo = new DesastresBoard(board);
                        hijo.intercambioGrupos(h0, h1, board.getSizeGruposR(h0) - 1, id_cambio);
                        String action = "Helicoptero  " + h0 + " y " + h1 + " intercambian los grupos " + gruposARescatar_por_h0.get(board.getSizeGruposR(h0) - 1) + " y " + gruposARescatar_por_h1.get(id_cambio);
                        retval.add(new Successor(action, hijo));
                        
                    }
                }

            }
        }
        return retval;
    }
}
