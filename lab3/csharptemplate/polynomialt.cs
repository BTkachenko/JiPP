using System;
using System.Collections.Generic;


    public class Polynomial<T>
    {
        private readonly List<T> coefficients;

        // Constructor
        public Polynomial(params T[] coefficients)
        {
            this.coefficients = new List<T>(coefficients);
        }

        // Override ToString method to return the polynomial in string form
        public override string ToString()
        {
            string result = "";
            for (int i = this.coefficients.Count - 1; i >= 0; i--)
            {
                if (!this.coefficients[i].Equals(default(T)))
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

            Polynomial<T> p = (Polynomial<T>)obj;
            if (this.coefficients.Count != p.coefficients.Count)
            {
                return false;
            }

            for (int i = 0; i < this.coefficients.Count;i++)
{
                if (!this.coefficients[i].Equals(p.coefficients[i]))
                {
                    return false;
                }
            }
            return true;
        }

        // Override operator + to add two polynomials
        public static Polynomial<T> operator +(Polynomial<T> p1, Polynomial<T> p2)
        {
            int length = Math.Max(p1.coefficients.Count, p2.coefficients.Count);
            T[] result = new T[length];
            for (int i = 0; i < length; i++)
            {
                T c1 = i < p1.coefficients.Count ? p1.coefficients[i] : default(T);
                T c2 = i < p2.coefficients.Count ? p2.coefficients[i] : default(T);
                result[i] = (dynamic)c1 + (dynamic)c2;
            }
            return new Polynomial<T>(result);
        }

        // Override operator - to subtract two polynomials
        public static Polynomial<T> operator -(Polynomial<T> p1, Polynomial<T> p2)
        {
            int length = Math.Max(p1.coefficients.Count, p2.coefficients.Count);
            T[] result = new T[length];
            for (int i = 0; i < length; i++)
            {
                T c1 = i < p1.coefficients.Count ? p1.coefficients[i] : default(T);
                T c2 = i < p2.coefficients.Count ? p2.coefficients[i] : default(T);
                result[i] = (dynamic)c1 - (dynamic)c2;
            }
            return new Polynomial<T>(result);
        }

        // Override operator * to multiply two polynomials
        public static Polynomial<T> operator *(Polynomial<T> p1, Polynomial<T> p2)
        {
            int length = p1.coefficients.Count + p2.coefficients.Count - 1;
            T[] result = new T[length];
            for (int i = 0; i < p1.coefficients.Count; i++)
            {
                for (int j = 0; j < p2.coefficients.Count; j++)
                {
                    result[i + j] = (dynamic)result[i + j] + (dynamic)p1.coefficients[i] * (dynamic)p2.coefficients[j];
                }
            }
            return new Polynomial<T>(result);
        }

        // Override operator / to divide two polynomials
        public static Polynomial<T> operator /(Polynomial<T> p1, Polynomial<T> p2)
        {
            if (p2.coefficients.Count > p1.coefficients.Count)
            {
                throw new DivideByZeroException("Division by zero");
            }

            int
length = p1.coefficients.Count - p2.coefficients.Count + 1;
            T[] result = new T[length];
            Polynomial<T> remainder = p1;
            for (int i = length - 1; i >= 0; i--)
            {
                T c = (dynamic)remainder.coefficients[i + p2.coefficients.Count - 1] / (dynamic)p2.coefficients[p2.coefficients.Count - 1];
                Polynomial<T> term = Polynomial<T>.Multiply(p2,c);
                for (int j = 0; j < term.coefficients.Count; j++)
                {
                    remainder.coefficients[i + j] = (dynamic)remainder.coefficients[i + j] - (dynamic)term.coefficients[j];
                }
                result[i] = c;
            }
            return new Polynomial<T>(result);
        }



public static Polynomial<T> Multiply(Polynomial<T> p, T value)
{
    T[] result = new T[p.coefficients.Count];
    for (int i = 0; i < p.coefficients.Count; i++)
    {
        result[i] = (dynamic)p.coefficients[i] * value;
    }
    return new Polynomial<T>(result);
}







        // Override operator % to get the remainder of dividing two polynomials
        public static Polynomial<T> operator %(Polynomial<T> p1, Polynomial<T> p2)
        {
            if (p2.coefficients.Count > p1.coefficients.Count)
            {
                throw new DivideByZeroException("Division by zero");
            }

            int length = p1.coefficients.Count - p2.coefficients.Count + 1;
            Polynomial<T> remainder = p1;
            for (int i = length - 1; i >= 0; i--)
            {
                T c = (dynamic)remainder.coefficients[i + p2.coefficients.Count - 1] / (dynamic)p2.coefficients[p2.coefficients.Count - 1];
                Polynomial<T> term = Polynomial<T>.Multiply(p2,c);
                for (int j = 0; j < term.coefficients.Count; j++)
                {
                    remainder.coefficients[i + j] = (dynamic)remainder.coefficients[i + j] - (dynamic)term.coefficients[j];
                }
            }
            return remainder;
        }

        // Indexer to get or set the coefficient at a given index
        public T this[int index]
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
        public T Evaluate(T x)
        {
            T result = default(T);
            for (int i = this.coefficients.Count - 1; i >= 0; i--)
            {
                result = (dynamic)result * x + (dynamic)this.
coefficients[i];
            }
            return result;
        }
    }

