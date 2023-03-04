`include "uvm_macros.svh"

class quiet_test extends uvm_test;

   `uvm_component_utils(quiet_test);

   counter_env env;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void end_of_elaboration_phase(uvm_phase phase);
      env.set_report_verbosity_level_hier(100);
   endfunction : end_of_elaboration_phase


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      counter_pkg::verbose = 0;
      env = counter_env::type_id::create("env",this);
   endfunction : build_phase
   
endclass // tester





