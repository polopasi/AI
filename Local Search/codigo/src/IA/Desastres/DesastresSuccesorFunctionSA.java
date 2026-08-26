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
public class DesastresSuccesorFunctionSA implements SuccessorFunction{

    public List getSuccessors(Object state){
        ArrayList retval = new ArrayList();
        DesastresHeuristicFunction HF  = new DesastresHeuristicFunction();
        DesastresBoard board = (DesastresBoard) state;
        DesastresBoard hijo = new DesastresBoard(board);


        // seleccion aleatoria de los parametros del operador
        int H  = board.getTotalHelicopteros();
        Random rand = new Random();
        // escoge un helicoptero aleatorio. Si este helicoptero tiene menos de 2 grupos a rescatar, no se puede realizar el operador cambio_orden
        int h = rand.nextInt(H);
        if (board.getSizeGruposR(h) >= 2) {
            int grupos_size = board.getSizeGruposR(h);
            int i = rand.nextInt(grupos_size);
            int j = rand.nextInt(grupos_size);
            hijo.cambiarOrden(h, i, j);
            double v = HF.getHeuristicValue(hijo);
            String action = "Helicoptero  " + h + ": cambio de orden de los grupos " + i + " y " + j + " --> Coste(" + v + ")";
            retval.add(new Successor(action, hijo));
        }
        return retval;
    }
}
