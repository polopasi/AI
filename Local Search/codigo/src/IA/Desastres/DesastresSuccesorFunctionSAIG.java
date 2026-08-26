package IA.Desastres;

import aima.search.framework.SuccessorFunction;
import aima.search.framework.Successor;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;



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
public class DesastresSuccesorFunctionSAIG implements SuccessorFunction{

    public List getSuccessors(Object state){
        ArrayList retval = new ArrayList();
        DesastresHeuristicFunction HF  = new DesastresHeuristicFunction();
        DesastresBoard board = (DesastresBoard) state;
        DesastresBoard hijo = new DesastresBoard(board);

        int H  = board.getTotalHelicopteros();
        Random rand = new Random();
        // escoge dos helicopteros aleatorios, escoge un grupo aleatorio de cada helicoptero y los intercambia
        int hi = rand.nextInt(H);
        int hj = rand.nextInt(H);
        if (board.getSizeGruposR(hi) > 0 && board.getSizeGruposR(hj) > 0) {
            // escojo un grupo aleatorio de h0
            int grupos_size_h0 = board.getSizeGruposR(hi);
            int i = rand.nextInt(grupos_size_h0);

            // escojo un grupo aleatorio de h1
            int grupos_size_h1 = board.getSizeGruposR(hj);
            int j = rand.nextInt(grupos_size_h1);

            hijo.intercambioGrupos(hi, hj, i, j);


            double v = HF.getHeuristicValue(hijo);
            String action = "Helicoptero  " + hi + " y " + hj + " intercambian los grupos " + i + " y " + j + " --> Coste(" + v + ")";
            retval.add(new Successor(action, hijo));
        }

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
        return retval;
    }

}
