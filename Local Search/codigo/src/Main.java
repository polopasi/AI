import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.Timer;

import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.framework.SuccessorFunction;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;
import aima.search.framework.HeuristicFunction;

import IA.Desastres.Centros;
import IA.Desastres.Grupos;
import IA.Desastres.DesastresBoard;
import IA.Desastres.DesastresHeuristicFunction;
import IA.Desastres.DesastresHeuristicFunctionPrio;
import IA.Desastres.DesastresSuccesorFunction;
import IA.Desastres.DesastresSuccesorFunctionIG;
import IA.Desastres.DesastresSuccesorFunctionSA;
import IA.Desastres.DesastresSuccesorFunctionSAIG;
import IA.Desastres.DesastresGoalTest;

public class Main {

    public static void main(String[] args) throws Exception{
        // Si ejecutamos el Hill Climbing, sólo necesitamos los diez primeros parámetros.
        // Para el Simulated Annealing, se necesitan 4 parámetros más.
        if (args.length != 10 && args.length != 14) {
            System.out.println("USAGE: Main par0 par1 par2 par3 par4 par5 par6 par7 par8 par9 [par10 par11 par12 par13]");
            System.out.println("Par0: numero de repeticiones");
            System.out.println("Par1: numero de centros");
            System.out.println("Par2: numero de helicopteros por centro");
            System.out.println("Par3: numero de grupos a rescatar");
            System.out.println("Par4: selector de operador [cambia_orden o intercambio]");
            System.out.println("Par5: selector de generador de estado inicial (0 = Aleatorio con prioridad; 1 = Distancias; 2 = Distancias con prioridad; 3 = Aleatorio sin prioridad)");
            System.out.println("Par6: identificador para algoritmo a usar [HC o SA]");
            System.out.println("Par7: heuristica a utilizar [tiempo_total o prioridades]");
            System.out.println("Par8: semilla para la generacion aleatoria");
            System.out.println("Par9: ejecucion experimental (verbose) [(0 = off; 1 = on)]");
            System.out.println("Par10: parametro de Simulated Annealing: steps");
            System.out.println("Par11: parametro de Simulated Annealing: stiter");
            System.out.println("Par12: parametro de Simulated Annealing: k");
            System.out.println("Par13: parametro de Simulated Annealing: lamb");
        }
        else {
            for (int i = 0; i < Integer.parseInt(args[0]); ++i) {
                // como las coordenadas se hacen en kilometros, he escrito un random del rango [0..49] de momento
                // de forma arbitraria, tambien he decidido que el numero de helicopteros sea del rango [0..49]
                // esto se podra cambiar en cualquier momento
                Centros centrx = new Centros(Integer.parseInt(args[1]), Integer.parseInt(args[2]), Integer.parseInt(args[8]));
        
                // de igual forma, como las coordenadas es en kilometros, he considerado que hay maximo 50*50 grupos a rescatar
                Grupos grupx = new Grupos(Integer.parseInt(args[3]), Integer.parseInt(args[8]));
        
                // variable que indica si generacion aleatoria o con colas de prioridad + distancias
                DesastresBoard estado = new DesastresBoard(centrx, grupx, Integer.parseInt(args[5]));
                    
                // HEURISTIC FUNCTION
                HeuristicFunction hf = switch (args[7]) {
                    case "tiempo_total" -> new DesastresHeuristicFunction();
                    default -> new DesastresHeuristicFunctionPrio();
                };

                        
                // SEARCH ALGORITHM y HEURISTIC FUNCTION
                // Instantiate the search algorithm
                Search alg;
                SuccessorFunction sf;
                switch (args[6]) {
                    case "HC" -> {
                        alg = new HillClimbingSearch();
                        switch (args[4]) {
                            case "cambia_orden" -> sf = new DesastresSuccesorFunction();
                            default -> sf = new DesastresSuccesorFunctionIG();
                        }
                    }
                    default -> {
                        // Añadir los valores de Simulated Annealing
                        // Simulated Annealing con parametros arbitrarios
                        /*  
                        * - args[10]: parametro de Simulated Annealing: steps
                        * - args[11]: parametro de Simulated Annealing: stiter
                        * - args[12]: parametro de Simulated Annealing: k
                        * - args[13]: parametro de Simulated Annealing: lamb
                        */
                        int steps = Integer.parseInt(args[10]);
                        int stiter = Integer.parseInt(args[11]);
                        int k = Integer.parseInt(args[12]);
                        double lamb = Double.parseDouble(args[13]);
                        alg = new SimulatedAnnealingSearch(steps, stiter, k, lamb);
                        switch (args[4]) {
                            case "cambia_orden" -> sf = new DesastresSuccesorFunctionSA();
                            default -> sf = new DesastresSuccesorFunctionSAIG();
                        }
                    }
                }
        
                // Create the Problem object
                Problem p = new Problem(estado, sf, new DesastresGoalTest(), hf);
                
                
                // impresion de estado inicial
                //System.out.println("Estado inicial: ");
                //DesastresBoard ie = (DesastresBoard) p.getInitialState();
                //ie.imprimirEstado();
                
                long t_ini = System.currentTimeMillis();
                
                // Instantiate the SearchAgent object
                SearchAgent agent = new SearchAgent(p, alg);
                
                long t_end = System.currentTimeMillis();
                // We print the results of the search
                /*
                * si usamos SA, obtenemos un error con printActions. Debido a esto, es necesario incluir
                * la funcion toString() a DesastresBoard y utilizar printActionsSA, que es lo mismo que
                * printActions, pero donde se intercambia la linea:
                * String action = (String) actions.get(i);
                * 
                * por 
                *
                * DesastresBoard action = (DesastresBoard) actions.get(i);
                */
                //if ("HC".equals(args[6])) printActions(agent.getActions());
                //else printActionsSA(agent.getActions());
                
                // You can access also to the goal state using the
                // method getGoalState of class Search 
                if (Integer.parseInt(args[9]) == 1) {
                    // TIEMPO DE EJECUCION EN MILISEGUNDOS
                    System.out.println((t_end - t_ini));
                    Iterator keys = agent.getInstrumentation().keySet().iterator();
                    String key = (String) keys.next();
                    String property = agent.getInstrumentation().getProperty(key);
                    // NODOS EXPANDIDOS
                    System.out.println(property);
                    // VALOR DE LA HEURISTICA
                    if (args[7].equals("tiempo_total")) System.out.println(hf.getHeuristicValue(alg.getGoalState()));
                    else System.out.println(hf.getHeuristicValue(alg.getGoalState()));
                } else {
                    printInstrumentation(agent.getInstrumentation());
                    // impresion estado final
                    System.out.println();
                    System.out.println("ESTADO FINAL");
                    DesastresBoard o = (DesastresBoard) alg.getGoalState();
                    //o.imprimirEstado();
                    o.imprimirSolucion();
                }
            }
        }
    } 
    
    private static void printInstrumentation(Properties properties) {
        Iterator keys = properties.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            String property = properties.getProperty(key);
            System.out.println(key + " : " + property);
        }        
    }
    
    private static void printActions(List actions) {
        for (int i = 0; i < actions.size(); i++) {
            String action = (String) actions.get(i);
            System.out.println(action);
        }
    } 
    
    private static void printActionsSA(List actions) {
        for (int i = 0; i < actions.size(); i++) {
            DesastresBoard action = (DesastresBoard) actions.get(i);
            System.out.println(action);
        }
    }
}
