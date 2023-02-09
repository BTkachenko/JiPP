using System;
using System.Collections.Generic;


    public class Polynomial
    {
        private readonly List<double> coefficients;

        // Constructor
        public Polynomial(params double[] coefficients)
        {
            this.coefficients = new List<double>(coefficients);
        }

        // Override ToString method to return the polynomial in string form
        public override string ToString()
        {
            string result = "";
            for (int i = this.coefficients.Count - 1; i >= 0; i--)
            {
                if (this.coefficients[i] != 0)
                {
                    if (result != "")
                    {
                        result += " + ";
                    }
                    result += this.coefficients[i] + "x^" + i;
                }
            }
            return result;
        }

        // Override Equals method to compare two polynomials
        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            Polynomial p = (Polynomial) obj;
            if (this.coefficients.Count != p.coefficients.Count)
            {
                return false;
            }

            for (int i = 0; i < this.coefficients.Count; i++)
            {
                if (this.coefficients[i] != p.coefficients[i])
                {
                    return false;
                }
            }

            return true;
        }

        // Override GetHashCode method to generate a unique hash code for the polynomial
        public override int GetHashCode()
        {
            int hash = 17;
            foreach (double coefficient in this.coefficients)
            {
                hash = hash * 23 + coefficient.GetHashCode();
            }
            return hash;
        }

        // Override operator == to compare two polynomials
        public static bool operator ==(Polynomial p1, Polynomial p2)
        {
            if (ReferenceEquals(p1, p2))
            {
                return true;
            }

            if (ReferenceEquals(p1, null) || ReferenceEquals(p2, null))
            {
                return false;
            }

            return p1.Equals(p2);
        }

        // Override operator != to compare two polynomials
        public static bool operator !=(Polynomial p1, Polynomial p2)
        {
            return !(p1 == p2);
        }

        // Override operator + to add two polynomials
        public static Polynomial operator +(Polynomial p1, Polynomial p2)
        {
            int length = Math.Max(p1.coefficients.Count, p2.coefficients.Count);
            double[] result = new double[length];
            for (int i = 0; i < length; i++)
            {
                double c1 = i < p1.coefficients.Count ? p1.coefficients[i] : 0;
                double c2 = i < p2.coefficients.Count ? p2.coefficients[i] : 0;
                result[i] = c1 + c2;
            }
            return new Polynomial(result);
        }

        // Override operator - to subtract two polynomials
        public static Polynomial operator -(Polynomial p1, Polynomial p2)
        {
            int length = Math.Max(p1.coefficients.Count, p2.coefficients.Count);
            double[] result = new double[length];
            for (int i = 0; i < length; i++)
            {
                double c1 = i < p1.coefficients.Count ? p1.coefficients[i] : 0;
                double c2 = i < p2.coefficients.Count ? p2.coefficients[i] : 0;
                result[i] = c1 - c2;
            }
            return new Polynomial(result);
        }

        public  Polynomial Multiply(double value)
        {
            double[] result = new double[this.coefficients.Count];
            for (int i = 0; i < this.coefficients.Count; i++)
        {
            result[i] = this.coefficients[i] * value;
        }
            return new Polynomial(result);
        }



        // Override operator * to multiply two polynomials
        public static Polynomial operator *(Polynomial p1, Polynomial p2)
        {
            int length = p1.coefficients.Count + p2.coefficients.Count - 1;
            double[] result = new double[length];
            for (int i = 0; i < p1.coefficients.Count; i++)
            {
                for (int j = 0; j < p2.coefficients.Count; j++)
                {
                    result[i + j] += p1.coefficients[i] * p2.coefficients[j];
                }
            }
            return new Polynomial(result);
        }

        // Override operator / to divide two polynomials
        public static Polynomial operator /(Polynomial p1, Polynomial p2)
        {
            if (p2.coefficients.Count > p1.coefficients.Count)
            {
                throw new DivideByZeroException("Division by zero");
            }

            int length = p1.coefficients.Count - p2.coefficients.Count + 1;
            double[] result = new double[length];
            Polynomial remainder = p1;
            for (int i = length - 1; i >= 0; i--)
            {
                result[i] = remainder.coefficients[i + p2.coefficients.Count - 1] / p2.coefficients[p2.coefficients.Count - 1];
                Polynomial term = p2.Multiply(result[i]);
                for (int j = 0; j < term.coefficients.Count; j++)
                {
                    remainder.coefficients[i + j] -= term.coefficients[j];
                }
            }
            return new Polynomial(result);
        }

        // Override operator % to get the remainder of dividing two polynomials
        public static Polynomial operator %(Polynomial p1, Polynomial p2)
        {
            if (p2.coefficients.Count > p1.coefficients.Count)
            {
                throw new DivideByZeroException("Division by zero");
            }

            int length = p1.coefficients.Count - p2.coefficients.Count + 1;
Polynomial remainder = p1;
            for (int i = length - 1; i >= 0; i--)
            {
                double c = remainder.coefficients[i + p2.coefficients.Count - 1] / p2.coefficients[p2.coefficients.Count - 1];
                Polynomial term = p2.Multiply(c);
                for (int j = 0; j < term.coefficients.Count; j++)
                {
                    remainder.coefficients[i + j] -= term.coefficients[j];
                }
            }
            return remainder;
        }

        // Method to get the coefficient at a given index
        public double this[int index]
        {
            get
            {
                if (index >= this.coefficients.Count)
                {
                    throw new IndexOutOfRangeException("Index out of range");
                }
                return this.coefficients[index];
            }
            set
            {
                if (index >= this.coefficients.Count)
                {
                    throw new IndexOutOfRangeException("Index out of range");
                }
                this.coefficients[index] = value;
            }
        }

        // Method to evaluate the polynomial at a given value of x
        public double Evaluate(double x)
        {
            double result = 0;
            for (int i = this.coefficients.Count - 1; i >= 0; i--)
            {
                result = result * x + this.coefficients[i];
            }
            return result;
        }
    }

