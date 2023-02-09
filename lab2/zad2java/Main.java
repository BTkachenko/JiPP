package zad2java;
import static zad2java.GF.P;

public class Main {
    public static void main(String[] args)
    {

        System.out.println("Tworze 2 obiekty g1 =15 ,g2 = 16");
        GF g1 = new GF(15l,P);
        GF g2 = new GF(16l,P);
        System.out.println("Porównanie g1 to g2");
        int b = (g1.compareTo(g2));
        System.out.println(b);
        System.out.println("Porównanie g1 to long 15");
         b = (g1.compareTo(15l));
        System.out.println(b);
        System.out.println("To string: ");
        System.out.println(g1);
        System.out.println(g2);
        System.out.println("g1 = g1 * g2");
        g1.GFmulti(g2);
        
        System.out.println(g1);
        System.out.println("g1 = g1 / g2");
        g1.GFdiv(g2);
    }   
}
