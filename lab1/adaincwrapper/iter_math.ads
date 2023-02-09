with Interfaces.C; use Interfaces.C;


package Iter_math is

    type ExtendedGCD is record
        X : Integer;
        Y: Integer;
        D: Integer;
    end record;

    type Para is record
         X : Integer;
        Y: Integer;
    end record;


    function Factorial(Var : Integer) return Integer 
    with
       Export        => True,
       Convention    => C,
       External_Name => "factorial";

    function NWD(A : Integer ;B : Integer) return Integer
    with
       Export        => True,
       Convention    => C,
       External_Name => "nwd";

    function Euclid_extend(A,B : Integer) return ExtendedGCD
    with
       Export        => True,
       Convention    => C,
       External_Name => "euclid_extend";

    function Diophant(A,B,C:Integer) return Para
    with
       Export        => True,
       Convention    => C,
       External_Name => "diophant";
end Iter_math;    