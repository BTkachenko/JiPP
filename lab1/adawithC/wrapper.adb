with Interfaces.C; use Interfaces.C;
with Ada.Text_IO;  use Ada.Text_IO;

procedure Wrapper is 

type ExtendedGCD is record
    x : int;
    y : int ;
    d : int;
    end record
    with Convention => C;

  type pair is record
    x : int;
    y : int ;
    end record
    with Convention => C;  

    function mynwd(a:int ; b :int) return int
        with Import => True,
             Convention => C;

    function euclid_extend(a:long;b:long) return ExtendedGCD 
        with Import => True,
             Convention => C;

    function my_func (a : int ; b : int ) return int
     with
       Import        => True,
       Convention    => C;


    function diophant_eq (a:long; b : long ; c: long)   return pair
     with
       Import        => True,
       Convention    => C;
     R: int;
     T: ExtendedGCD;
     P : pair;
begin
     R:= mynwd(4,6);
     Put_Line("NWD(4,6) : " & int'Image(R))  ; 
     T := euclid_extend(30,15);
     Put_Line("Euclid Extend(4,6) : " & int'Image(T.d))  ; 

     P:= diophant_eq(4,6,10); 
     Put_Line("Diophant(4,6,2) : X = " & int'Image(P.x) &" Y = "& int'Image(P.y));       
end Wrapper;