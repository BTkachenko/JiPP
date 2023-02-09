class Program{

    static void Main(string[] args)
    {
       System.Console.WriteLine("Test:"); 
    try{
       GF g1 = new GF();
       GF g2 = new GF();
       g1.setValue(5);
       g2.setValue(2);
       System.Console.WriteLine(g1);
       System.Console.WriteLine(g2);
        System.Console.WriteLine("G1 + G2: " + (g1+g2));
        System.Console.WriteLine("G1 - G2: " + (g1-g2));
        System.Console.WriteLine("G1 * G2: " + (g1*g2));
        System.Console.WriteLine("G1 / G2: " + (g1/g2));
        System.Console.WriteLine("G1 + 5: " + (g1 + 5));
        System.Console.WriteLine("G1 * 3: " + g1*3);
        System.Console.WriteLine("G1 + 5: " + (g1.GFAdd(5)));
        System.Console.WriteLine("G1 * 3: " + (g1.GFmulti(3)));
        System.Console.WriteLine("Dziele przez 0!");
        System.Console.WriteLine("G1 / 0: " + (g1.GFdiv(0)));
    } 
    catch(Exception e){
        System.Console.WriteLine(e);
    }
    }
}


