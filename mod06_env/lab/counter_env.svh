`include "uvm_macros.svh"

class counter_env extends uvm_test;

   `uvm_component_utils(counter_env);

   // Please declare three variable of the following types: driver, scorboard, and printer
   driver ctr_env_driver;
   socreboard ctr_env_sb;
   printer ctr_env_printer;
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Please create an instance of the driver using the variable you declared above
      ctr_env_driver = driver::type_id::create("driver", this);

      // Please create an instance of the scoreboard using the variable you declared above
      ctr_env_sb = scoreboard::type_id::create("scoreboard", this);
      
      // Please test the verbose variable.  If it is non-zero create an instance of the printer object
      if (counter_pkg::verbose != 0)
         ctr_env_printer = printer::type_id::create("printer", this);

      
   endfunction : build_phase
   
endclass // tester


   


   