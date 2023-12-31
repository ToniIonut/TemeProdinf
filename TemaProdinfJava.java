//Scrieti un program care verifica daca doua cuvinte sunt anagrame (fiecare se poate obtine din celalalt schimband ordinea literelor). 

import java.util.Arrays;

public class Anagrame {
    public static void main(String[] args) {
        String cuvant1 = "listen";
        String cuvant2 = "silent";

        String cuvantNou1 = cuvant1.replaceAll(" ", "");
        String cuvantNou2 = cuvant2.replaceAll(" ", "");

        if (cuvantNou1.length() != cuvantNou2.length()) {
            System.out.println(cuvant1 + " și " + cuvant2 + " nu sunt anagrame.");
        } else {
            char[] cuvant1Array = cuvantNou1.toCharArray();
            char[] cuvant2Array = cuvantNou2.toCharArray();

            Arrays.sort(cuvant1Array);
            Arrays.sort(cuvant2Array);

            boolean suntAnagrame = Arrays.equals(cuvant1Array, cuvant2Array);

            if (suntAnagrame) {
                System.out.println(cuvant1 + " și " + cuvant2 + " sunt anagrame.");
            } else {
                System.out.println(cuvant1 + " și " + cuvant2 + " nu sunt anagrame.");
            }
        }
    }
}


//Se se scrie un program care aduna doua numere exprimate in binar (exp a = 11, b = 1, a+b = 100). Rezultatul fiind de asemenea in binar.



//Afiseza numerele de la 1 la 10 fara folosi vreo bucla (for / while / do while). Indiciu: recursivitate.


public class AfisareNumereRecursiv {
    public static void afiseazaNumere(int n) {
        if (n <= 10) {
            System.out.println(n);
            afiseazaNumere(n + 1);
        }
    }

    public static void main(String[] args) {
        int start = 1;
        afiseazaNumere(start);
    }
}

//Returnati valorile distincte dintr-o lista ce contine duplicate. Exemplu (1, 2, 1, 5, 1, 9, 9) --> (1, 2, 5, 9)

import java.util.ArrayList;
import java.util.List;

public class ValoriDistincte {
    public static void main(String[] args) {
        List<Integer> numere = List.of(1, 2, 1, 5, 1, 9, 9);
        List<Integer> valoriDistincte = new ArrayList<>();

        for (Integer numar : numere) {
            if (!valoriDistincte.contains(numar)) {
                valoriDistincte.add(numar);
            }
        }

        System.out.println("Valori distincte: " + valoriDistincte);
    }
}


//Afisati primul caracter ce nu se repeta dintr-un String (exemplu “abcdefghijab” --> ‘c’).


public class PrimulCaracterDistinct {
    public static void main(String[] args) {
        String str = "abcdefghijab";

        for (int i = 0; i < str.length(); i++) {
            char charCurent = str.charAt(i);
            boolean esteDistinct = true;

            for (int j = 0; j < str.length(); j++) {
                if (i != j && charCurent == str.charAt(j)) {
                    esteDistinct = false;
                    break;
                }
            }

            if (esteDistinct) {
                System.out.println("Primul caracter distinct: " + charCurent);
                return;
            }
        }

        System.out.println("Nu există un caracter distinct în șirul dat.");
    }
}

//Scrieti o metoda care pentru un sir de caractere (String) primit ca parametru creaza un 
//nou sir de caractere (String) cu duplicatele eliminate. Ex: ABBCCCCCBBAB -> ABCBAB




//Scrieti un program care simuleaza aruncarea unei perechi de zaruri.
 // Puteti simula aruncarea unui zar alegand in mod aleatoriu cate un numar intreg dintre 1, 2, 3, 4, 5 si 6. 
 // Numarul ales reprezinta valoarea de pe un zar dupa aruncare. 
// Hint: (int)(Math.random()*6) + 1 
// Exemplu iesire: 
  // Primul zar are valoarea 3 
  // Al doilea zar are valoarea 5
  // Valoarea totala este 8


public class SimulareAruncareZaruri {
    public static void main(String[] args) {
        int primulZar = (int) (Math.random() * 6) + 1;
        int alDoileaZar = (int) (Math.random() * 6) + 1;
        int valoareTotala = primulZar + alDoileaZar;

        System.out.println("Primul zar are valoarea " + primulZar);
        System.out.println("Al doilea zar are valoarea " + alDoileaZar);
        System.out.println("Valoarea totală este " + valoareTotala);
    }
}

