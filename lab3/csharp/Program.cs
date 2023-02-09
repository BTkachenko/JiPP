using System;

namespace PolynomialTest
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // Create some polynomials
            Polynomial p1 = new Polynomial(1, 2, 3);
            Polynomial p2 = new Polynomial(4, 5, 6);
            Polynomial p3 = new Polynomial(7, 8, 9);
            Polynomial p4 = new Polynomial(1, 0, -1);

            // Perform various operations
            Polynomial sum = p1 + p2;
            Polynomial difference = p3 - p4;
            Polynomial product = p1 * p2;
            Polynomial quotient = p3 / p4;
            Polynomial remainder = p3 % p4;

            // Print the results
            Console.WriteLine("p1 = " + p1);
            Console.WriteLine("p2 = " + p2);
            Console.WriteLine("p3 = " + p3);
            Console.WriteLine("p4 = " + p4);
            Console.WriteLine("p1 + p2 = " + sum);
            Console.WriteLine("p3 - p4 = " + difference);
            Console.WriteLine("p1 * p2 = " + product);
            Console.WriteLine("p3 / p4 = " + quotient);

                        Console.WriteLine("p3 % p4 = " + remainder);

            // Test polynomial evaluation
            double x = 2;
            Console.WriteLine("p1(" + x + ") = " + p1.Evaluate(x));
            Console.WriteLine("p2(" + x + ") = " + p2.Evaluate(x));
            Console.WriteLine("p3(" + x + ") = " + p3.Evaluate(x));
            Console.WriteLine("p4(" + x + ") = " + p4.Evaluate(x));
        }
    }
}


