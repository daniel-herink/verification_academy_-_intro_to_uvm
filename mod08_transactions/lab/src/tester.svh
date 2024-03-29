class tester extends uvm_agent;

   `uvm_component_utils(tester)   

     // Please declare an uvm_put_port that accepts ctr_req objects
     // and call it req_p.
   uvm_put_port #(ctr_req) req_p;


   function new(string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Please create a new instance of the req_p uvm_put_port.
      req_p = new("req_p", this);

   endfunction : build_phase

   task run_phase(uvm_phase phase);
      // Please create a new ctr_req called req
      ctr_req req;

      int nloops=5;
      phase.raise_objection(this);
      for (int i=1; i <= nloops; i++) begin

         // Please randomize req
         req.randomize();
         
         put_txn(req);
      end
      #50ns;
      phase.drop_objection(this);
      
   endtask : run_phase

   task put_txn;
      input ctr_req req;

      // Please create a task that clones the req transaction
      // and puts the clone into the req_p port.
      req_p.put(req.clone());



      // Please use `uvm_info to print the transaction to
      // the screen.
      `uvm_info("run", $psprintf("Puting the transaction (%s) on req_p", req.convert2string()), UVM_MEDIUM)

   endtask : put_txn
   
endclass : tester
