class producer_consumer_env extends uvm_env;

   `uvm_component_utils(producer_consumer_env)

   producer p;
   consumer c;

   // Please declare a variable to hold the square_it object
   square_it env_square_it;
   uvm_tlm_fifo #(int)    producer2square_it;

   // Please declare a uvm_tlm_fifo #(int) that will go from square_it to the consumer.
   uvm_tlm_fifo #(int) square_it2consumer;
   
   function new(string name, 
                uvm_component parent);
      super.new(name, parent);      
   endfunction: new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      p = producer::type_id::create("p",this);
      c = consumer::type_id::create("c",this);
      // Please use the factory to get a new square_it object
      env_square_it = square_it::type_id::create("square_it", this);
      producer2square_it = new ("producer2square_it",this);
      // Please create a new uvm_tlm_fifo to go from the square_it object to the consumer
      square_it2consumer = new("square_it2consumer", this);
   endfunction: build_phase

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      p.phone1.connect(producer2square_it.put_export);
      
      // Please connect your square_it object to the producer2square_it uvm_tlm_fifo
      //  remember to use the get_export object in the fifo.
      env_square_it.get_func.connect(producer2square_it.get_export);
      // Please connect your square_it object to the uvm_tlm_fifo that goes from the 
      // square_it object to the consumer.  You declared this uvm_tlm_fifo above.
      // Remember to use the put_export from your uvm_tlm_fifo.
      env_square_it.put_func.connect(square_it2consumer.put_export);

      c.phone2.connect(square_it2consumer.get_export);  
      
   endfunction: connect_phase
   
endclass: producer_consumer_env
