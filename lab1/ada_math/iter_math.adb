package body Iter_math is
    function Factorial(Var: Integer) return Integer
        is
        R: Integer;
    begin
        R :=1;
        for J in 2 .. Var loop
        R := R*j;
        end loop;
        return R;
    end Factorial;



    function NWD( A : Integer ; B : Integer) return Integer
    is
    Pom ,BTemp,ATemp : Integer;
    begin
    BTemp:= B;
    ATemp:= A;
        loop
            exit when BTemp = 0;
            Pom:=BTemp;
            BTemp:= (Atemp mod BTemp);
            ATemp:= Pom;
        end loop;
        return ATemp;
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



end Iter_math;