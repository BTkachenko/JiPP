using System;

namespace PolynomialTest
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create a polynomial with integer coefficients
            Polynomial<double> p1 = new Polynomial<double>(1, 2, 3);
            Console.WriteLine("p1 = " + p1);

            // Create a polynomial with double coefficients
            Polynomial<double> p2 = new Polynomial<double>(1.1, 2.2, 3.3);
            Console.WriteLine("p2 = " + p2);

            // Add the two polynomials
            Polynomial<double> p3 = p1 + p2;
            Console.WriteLine("p3 = p1 + p2 = " + p3);

            // Subtract the two polynomials
            Polynomial<double> p4 = p1 - p2;
            Console.WriteLine("p4 = p1 - p2 = " + p4);

            // Multiply the two polynomials
            Polynomial<double> p5 = p1 * p2;
            Console.WriteLine("p5 = p1 * p2 = " + p5);

            // Divide the two polynomials
            Polynomial<double> p6 = p1 / p2;
            Console.WriteLine("p6 = p1 / p2 = " + p6);

            // Get the remainder of dividing the two polynomials
            Polynomial<double> p7 = p1 % p2;
            Console.WriteLine("p7 = p1 % p2 = " + p7);

            // Access the coefficients of the polynomial using the indexer
            Console.WriteLine("p1[1] = " + p1[1]);
            p1[1] = 4;
            Console.WriteLine("p1[1] = " + p1[1]);

            // Evaluate the polynomial at a given value of x
            double x = 2.0;
            double y = p1.Evaluate(x);
            Console.WriteLine("p1(" + x + ") = " + y);
        }
    }
}
