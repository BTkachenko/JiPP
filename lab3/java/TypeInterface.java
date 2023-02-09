public interface TypeInterface<T> extends Comparable<T>{
    T sum(final T a) throws ArithmeticException;
  T sub(final T a) throws ArithmeticException;
  T mul(final T a) throws ArithmeticException;
  T div(final T a) throws ArithmeticException;
  T zeroElem();
  T oneElem();
  T negate();
  T inverse() throws ArithmeticException;
}
