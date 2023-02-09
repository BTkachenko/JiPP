with Ada; use Ada;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

-- main task = environment task
procedure dining_philosopher is

-----------------------------------------------------
-----------------------------------------------------
       -- Number of philosophers
     NUM_PHILOSOPHERS : Integer := 5;
    -- Number of times each philosopher will eat
     EATING_LIMIT : Integer := 2;

     FINISHED : Integer := 0;
   -- Fork task
   task type Fork is
      entry Take_Fork(ID: Integer);
      entry Give_Fork(ID: Integer);
   end Fork;

    -- Fork task body
   task body Fork is
      Available : Boolean := True;
   begin

      loop
         select

            when Available =>

               accept Take_Fork(ID: Integer) do
                  Put_Line("Take_Fork from " & ID'Image);
                  Available := False;
               end Take_Fork;

         or
            when not Available =>

               accept Give_Fork(ID: Integer) do
                  Put_Line("                     Give_Fork from" & ID'Image);
                  Available := True;
               end Give_Fork;

         end select;
        end loop;

   end Fork;

-----------------------------------------------------
-----------------------------------------------------

   -- task Philopsopher

   -- not null access becasue the Fork must have an access type
   task type Philopsopher(ID: Integer; Left_Fork, Right_Fork: not null access Fork);

   task body Philopsopher is

      Eating_Counter : Integer := 0;
      Eating_Limit : Integer := 3;
    ------------declarations start--------------
    -- inner declaration of the Philopsopher task

      -- random generator to Give_Fork random values
      Random_Generator : Generator;

      --Think for a random time
      procedure Think is
      begin

        Put_Line("Thinking " & ID'Image);

         delay Duration(Random(Random_Generator) *  0.05);
      end Think;

      --request the two Forks
      procedure Hungry is
      begin

         Put_Line("Hungry " & ID'Image);

         Left_Fork.Take_Fork(ID);
         Right_Fork.Take_Fork(ID);
      end Hungry;

      --start Eating for random time
      procedure Eat is
      begin

         Put_Line("Eat " & ID'Image);

         delay Duration(Random(Random_Generator) * 0.1);
         Eating_Counter:=Eating_Counter+1;
      end Eat;

      --Finish Eating and giving back the Forks
      procedure Finish is
      begin

         Put_Line("Finish " & ID'Image);

         Left_Fork.Give_Fork(ID);
         Right_Fork.Give_Fork(ID);
      end Finish;
    ------------declarations end--------------

   --Philopsopher task begin
    begin
      -- a seed for the random generator
      Reset(Random_Generator);

      Put_Line("start phil with ID=" & ID'Image);

      -- 1..X is how many time each Philopsopher will
      -- Think then be hangry then Eat then Finish
      while Eating_Counter<Eating_Limit loop
         Think;     --Think for a random time
         Hungry;    --request the two Forks
         Eat;       --start Eating for random time
         Finish;    --Finish Eating and giving back the Forks
      end loop;
   Put_Line("                                                   Skonczyl!!!! "&ID'Image);
      FINISHED:=FINISHED+1;
    end Philopsopher;

-----------------------------------------------------
-----------------------------------------------------


        Fork1,Fork2,Fork3,Fork4,Fork5: aliased Fork;

        --need to declare 'Access type on the Fork
        p1: Philopsopher(1, Fork1'Access, Fork2'Access);
        p2: Philopsopher(2, Fork2'Access, Fork3'Access);
        p3: Philopsopher(3, Fork3'Access, Fork4'Access);
        p4: Philopsopher(4, Fork4'Access, Fork5'Access);
        p5: Philopsopher(5, Fork5'Access, Fork1'Access);


   begin
   Put_Line("main thread start");

   while FINISHED /= NUM_PHILOSOPHERS loop
      delay Duration(1);
   end loop;
   Put_Line("All philosophers have finished");
end dining_philosopher;
