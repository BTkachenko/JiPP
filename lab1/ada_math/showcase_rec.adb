with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with rec_math; use Rec_math;

procedure Showcase_rec is
 F:Integer;
 Res : ExtendedGCD;
 ResDio: Para;
begin


    Res := Euclid_extend(4,6);
    Put_Line(" ExtendedEuclid(4,6): X = "& Integer'Image(Res.X)
    & " Y = "& Integer'Image(Res.Y) & " GCD = "& Integer'Image(Res.D)) ; 

    ResDio := Diophant(4,6,10);

    Put_Line(" ExtendedEuclid(4,6,10): X = "& Integer'Image(ResDio.X)
    & " Y = "& Integer'Image(ResDio.Y)); 

      
end Showcase_rec;