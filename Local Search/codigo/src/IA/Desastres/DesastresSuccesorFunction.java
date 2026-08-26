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
public class DesastresSuccesorFunction implements SuccessorFunction{

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
      int total_helicopteros = board.getTotalHelicopteros();
      for (int h = 0; h < total_helicopteros; ++h) {
          ArrayList<Integer> gruposARescatar_por_h = board.getGruposARescatar(h);
          for (int i = 0; i < gruposARescatar_por_h.size(); i++) {
              for (int j = i + 1; j < gruposARescatar_por_h.size(); ++j) {
                  DesastresBoard hijo = new DesastresBoard(board);
                  hijo.cambiarOrden(h, i, j);
                  String action = "Helicoptero  " + h + ": cambio de orden de los grupos " + i + " y " + j;
                  retval.add(new Successor(action, hijo));
                }
            }
        }
        return retval;
    }

}
