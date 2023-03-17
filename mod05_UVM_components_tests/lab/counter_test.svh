class counter_test extends uvm_test;

   `uvm_component_utils(counter_test);

   integer nloops = 5;

   virtual interface counter_if ct_if;

   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Please set the local virtual interface "ct_if" equal to the 
      // global counter_if that you created in the package file.
      ct_if = counter_pkg::virt_interf;
   
   endfunction : build_phase
   
   
   task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      repeat (nloops) begin
         @(negedge ct_if.clk);
         {ct_if.ld, ct_if.inc} = $random;
         ct_if.data_in = $random;
         `uvm_info("run", $psprintf("data_in: %2h q: %2h  ld: %1b,  inc: %1b",
                                   ct_if.data_in, ct_if.q, ct_if.ld, ct_if.inc),UVM_MEDIUM);
      end
      phase.drop_objection(this);
   endtask // run
endclass // tester

