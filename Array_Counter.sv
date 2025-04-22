module CounterArray (
  input logic clk,
  input logic rst,
  input logic incr,
  input logic[2:0] incr_addr,
  input logic decr,
  input logic[2:0] decr_addr,
  output logic [4:0] cnt [0:7]
 );
  reg [4:0] counters [0:7];
  reg [4:0] temp_counters [0:7]; 
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      for (int i = 0; i < 8; i = i + 1) begin
        counters[i] <= 5'b0;
      end
    end else begin
      temp_counters = counters; 
      if (incr) begin  // incrementing
        temp_counters[incr_addr] = counters[incr_addr] + 1;
      end
      if (decr) begin // decrementing
        temp_counters[decr_addr] = counters[decr_addr] - 1;
      end
      // in case both incr and decr are active, keep the current value
      if (incr && decr && incr_addr == decr_addr) begin
        temp_counters[incr_addr] = counters[incr_addr]; 
      end
      // Update counters with the new values
      for (int i = 0; i < 8; i = i + 1) begin
        counters[i] <= temp_counters[i];
      end
    end
  end
  assign cnt = counters;
 endmodule
