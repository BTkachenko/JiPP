pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E74 : Short_Integer; pragma Import (Ada, E74, "system__os_lib_E");
   E09 : Short_Integer; pragma Import (Ada, E09, "ada__exceptions_E");
   E15 : Short_Integer; pragma Import (Ada, E15, "system__soft_links_E");
   E27 : Short_Integer; pragma Import (Ada, E27, "system__exception_table_E");
   E42 : Short_Integer; pragma Import (Ada, E42, "ada__containers_E");
   E69 : Short_Integer; pragma Import (Ada, E69, "ada__io_exceptions_E");
   E54 : Short_Integer; pragma Import (Ada, E54, "ada__strings_E");
   E56 : Short_Integer; pragma Import (Ada, E56, "ada__strings__maps_E");
   E60 : Short_Integer; pragma Import (Ada, E60, "ada__strings__maps__constants_E");
   E07 : Short_Integer; pragma Import (Ada, E07, "interfaces__c_E");
   E29 : Short_Integer; pragma Import (Ada, E29, "system__exceptions_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "system__object_reader_E");
   E49 : Short_Integer; pragma Import (Ada, E49, "system__dwarf_lines_E");
   E23 : Short_Integer; pragma Import (Ada, E23, "system__soft_links__initialize_E");
   E41 : Short_Integer; pragma Import (Ada, E41, "system__traceback__symbolic_E");
   E02 : Short_Integer; pragma Import (Ada, E02, "iter_math_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := null;

      if E09 = 0 then
         Ada.Exceptions'Elab_Spec;
      end if;
      if E15 = 0 then
         System.Soft_Links'Elab_Spec;
      end if;
      if E27 = 0 then
         System.Exception_Table'Elab_Body;
      end if;
      E27 := E27 + 1;
      if E42 = 0 then
         Ada.Containers'Elab_Spec;
      end if;
      E42 := E42 + 1;
      if E69 = 0 then
         Ada.Io_Exceptions'Elab_Spec;
      end if;
      E69 := E69 + 1;
      if E54 = 0 then
         Ada.Strings'Elab_Spec;
      end if;
      E54 := E54 + 1;
      if E56 = 0 then
         Ada.Strings.Maps'Elab_Spec;
      end if;
      E56 := E56 + 1;
      if E60 = 0 then
         Ada.Strings.Maps.Constants'Elab_Spec;
      end if;
      E60 := E60 + 1;
      if E07 = 0 then
         Interfaces.C'Elab_Spec;
      end if;
      E07 := E07 + 1;
      if E29 = 0 then
         System.Exceptions'Elab_Spec;
      end if;
      E29 := E29 + 1;
      if E80 = 0 then
         System.Object_Reader'Elab_Spec;
      end if;
      E80 := E80 + 1;
      if E49 = 0 then
         System.Dwarf_Lines'Elab_Spec;
      end if;
      E49 := E49 + 1;
      if E74 = 0 then
         System.Os_Lib'Elab_Body;
      end if;
      E74 := E74 + 1;
      if E23 = 0 then
         System.Soft_Links.Initialize'Elab_Body;
      end if;
      E23 := E23 + 1;
      E15 := E15 + 1;
      if E41 = 0 then
         System.Traceback.Symbolic'Elab_Body;
      end if;
      E41 := E41 + 1;
      E09 := E09 + 1;
      E02 := E02 + 1;
   end adainit;

--  BEGIN Object file/option list
   --   /home/bt/semestr5/paradygmaty/lab1/final/adaincwrapper/iter_math.o
   --   -L/home/bt/semestr5/paradygmaty/lab1/final/adaincwrapper/
   --   -L/home/bt/semestr5/paradygmaty/lab1/final/adaincwrapper/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/10/adalib/
   --   -shared
   --   -lgnat-10
   --   -ldl
--  END Object file/option list   

end ada_main;
