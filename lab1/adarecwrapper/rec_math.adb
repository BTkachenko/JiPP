package body Rec_math is


    function Factorial(Var: Integer) return Integer
    is

    begin
        if Var = 1 or Var = 0 then 
        return 1;
        else 
         return Var * Factorial(Var - 1);
        end if;
    end Factorial;


    function NWD( A : Integer ; B : Integer) return Integer
    is
    begin
        if B /= 0 then
        return NWD(B,A mod B);
        end if;
        return A;
    end NWD;







function Euclid_extend(A,B: Integer) return ExtendedGCD
    is 
    Res : ExtendedGCD;
    Atemp,Btemp,X,Y,D ,T: Integer;
    begin
        Btemp:= B;
        Atemp:=A;

        if Btemp = 0 then
            D:= Atemp; X:= 1; Y:=0;
            Res := (X,Y,D);
            return Res;
        end if;    
        Res := euclid_extend(Btemp,Atemp mod Btemp);
        T := Res.Y;
        Res.Y := Res.X - (Atemp/Btemp) * Res.Y;
        Res.X := T;
        return Res;

    end Euclid_extend;


    function Diophant(A,B,C:Integer) return Para is
        X,Y:Integer;
    Res : Para;
    Gcd : ExtendedGCD;
    begin
        Gcd := Euclid_extend(A,B);
        if C mod Gcd.D /= 0 then
            X := 0;
            Y := 0;
        else 
            X := gcd.X*(C/Gcd.D);
            Y := gcd.Y*(C/Gcd.D);   
        end if;
        Res := (X,Y);
        return Res;
    end Diophant;
end Rec_math;