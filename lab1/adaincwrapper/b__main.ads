pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#5496a4ce#;
   pragma Export (C, u00001, "iter_mathB");
   u00002 : constant Version_32 := 16#2285387d#;
   pragma Export (C, u00002, "iter_mathS");
   u00003 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00003, "system__standard_libraryB");
   u00004 : constant Version_32 := 16#4113f22b#;
   pragma Export (C, u00004, "system__standard_libraryS");
   u00005 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00005, "interfacesS");
   u00006 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00006, "interfaces__cB");
   u00007 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00007, "interfaces__cS");
   u00008 : constant Version_32 := 16#185015e7#;
   pragma Export (C, u00008, "ada__exceptionsB");
   u00009 : constant Version_32 := 16#d6578bab#;
   pragma Export (C, u00009, "ada__exceptionsS");
   u00010 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00010, "adaS");
   u00011 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#cfec26ee#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#8d3f9472#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#f32b4133#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#03a1141d#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00018, "system__parametersB");
   u00019 : constant Version_32 := 16#0ed9b82f#;
   pragma Export (C, u00019, "system__parametersS");
   u00020 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00022, "system__soft_links__initializeB");
   u00023 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00023, "system__soft_links__initializeS");
   u00024 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00024, "system__stack_checkingB");
   u00025 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00025, "system__stack_checkingS");
   u00026 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00026, "system__exception_tableB");
   u00027 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00027, "system__exception_tableS");
   u00028 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00030, "system__exceptions__machineB");
   u00031 : constant Version_32 := 16#5c74e542#;
   pragma Export (C, u00031, "system__exceptions__machineS");
   u00032 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00032, "system__exceptions_debugB");
   u00033 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00033, "system__exceptions_debugS");
   u00034 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00034, "system__img_intB");
   u00035 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00035, "system__img_intS");
   u00036 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00036, "system__tracebackB");
   u00037 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00037, "system__tracebackS");
   u00038 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00038, "system__traceback_entriesB");
   u00039 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00039, "system__traceback_entriesS");
   u00040 : constant Version_32 := 16#448e9548#;
   pragma Export (C, u00040, "system__traceback__symbolicB");
   u00041 : constant Version_32 := 16#46491211#;
   pragma Export (C, u00041, "system__traceback__symbolicS");
   u00042 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00042, "ada__containersS");
   u00043 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00043, "ada__exceptions__tracebackB");
   u00044 : constant Version_32 := 16#ae2d2db5#;
   pragma Export (C, u00044, "ada__exceptions__tracebackS");
   u00045 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00045, "system__bounded_stringsB");
   u00046 : constant Version_32 := 16#31c8cd1d#;
   pragma Export (C, u00046, "system__bounded_stringsS");
   u00047 : constant Version_32 := 16#0062635e#;
   pragma Export (C, u00047, "system__crtlS");
   u00048 : constant Version_32 := 16#bba79bcb#;
   pragma Export (C, u00048, "system__dwarf_linesB");
   u00049 : constant Version_32 := 16#9a78d181#;
   pragma Export (C, u00049, "system__dwarf_linesS");
   u00050 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00050, "ada__charactersS");
   u00051 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00051, "ada__characters__handlingB");
   u00052 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00052, "ada__characters__handlingS");
   u00053 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00053, "ada__characters__latin_1S");
   u00054 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00054, "ada__stringsS");
   u00055 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00055, "ada__strings__mapsB");
   u00056 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00056, "ada__strings__mapsS");
   u00057 : constant Version_32 := 16#5886cb31#;
   pragma Export (C, u00057, "system__bit_opsB");
   u00058 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00058, "system__bit_opsS");
   u00059 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00059, "system__unsigned_typesS");
   u00060 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00060, "ada__strings__maps__constantsS");
   u00061 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00061, "system__address_imageB");
   u00062 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00062, "system__address_imageS");
   u00063 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00063, "system__img_unsB");
   u00064 : constant Version_32 := 16#ed47ac70#;
   pragma Export (C, u00064, "system__img_unsS");
   u00065 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00065, "system__ioB");
   u00066 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00066, "system__ioS");
   u00067 : constant Version_32 := 16#f790d1ef#;
   pragma Export (C, u00067, "system__mmapB");
   u00068 : constant Version_32 := 16#7c445363#;
   pragma Export (C, u00068, "system__mmapS");
   u00069 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00069, "ada__io_exceptionsS");
   u00070 : constant Version_32 := 16#91eaca2e#;
   pragma Export (C, u00070, "system__mmap__os_interfaceB");
   u00071 : constant Version_32 := 16#1fc2f713#;
   pragma Export (C, u00071, "system__mmap__os_interfaceS");
   u00072 : constant Version_32 := 16#1e7d913a#;
   pragma Export (C, u00072, "system__mmap__unixS");
   u00073 : constant Version_32 := 16#54420b60#;
   pragma Export (C, u00073, "system__os_libB");
   u00074 : constant Version_32 := 16#d872da39#;
   pragma Export (C, u00074, "system__os_libS");
   u00075 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00075, "system__case_utilB");
   u00076 : constant Version_32 := 16#79e05a50#;
   pragma Export (C, u00076, "system__case_utilS");
   u00077 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00077, "system__stringsB");
   u00078 : constant Version_32 := 16#2623c091#;
   pragma Export (C, u00078, "system__stringsS");
   u00079 : constant Version_32 := 16#5a3f5337#;
   pragma Export (C, u00079, "system__object_readerB");
   u00080 : constant Version_32 := 16#82413105#;
   pragma Export (C, u00080, "system__object_readerS");
   u00081 : constant Version_32 := 16#fb020d94#;
   pragma Export (C, u00081, "system__val_lliB");
   u00082 : constant Version_32 := 16#2a5b7ef4#;
   pragma Export (C, u00082, "system__val_lliS");
   u00083 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00083, "system__val_lluB");
   u00084 : constant Version_32 := 16#1f7d1d65#;
   pragma Export (C, u00084, "system__val_lluS");
   u00085 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00085, "system__val_utilB");
   u00086 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00086, "system__val_utilS");
   u00087 : constant Version_32 := 16#d7bf3f29#;
   pragma Export (C, u00087, "system__exception_tracesB");
   u00088 : constant Version_32 := 16#62eacc9e#;
   pragma Export (C, u00088, "system__exception_tracesS");
   u00089 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00089, "system__wch_conB");
   u00090 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00090, "system__wch_conS");
   u00091 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00091, "system__wch_stwB");
   u00092 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00092, "system__wch_stwS");
   u00093 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00093, "system__wch_cnvB");
   u00094 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00094, "system__wch_cnvS");
   u00095 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00095, "system__wch_jisB");
   u00096 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00096, "system__wch_jisS");
   u00097 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00097, "system__memoryB");
   u00098 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00098, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_lli%b
   --  system.val_llu%b
   --  iter_math%s
   --  iter_math%b
   --  END ELABORATION ORDER

end ada_main;
