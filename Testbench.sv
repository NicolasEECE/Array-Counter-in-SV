module testbench;
  reg clk;
  reg rst;
  reg incr;
  reg [2:0] incr_addr;
  reg decr;
  reg [2:0] decr_addr;
  wire [4:0] cnt [0:7];
  CounterArray counter_array (
    .clk(clk),
    .rst(rst),
    .incr(incr),
    .incr_addr(incr_addr),
    .decr(decr),
    .decr_addr(decr_addr),
    .cnt(cnt)
  );
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    incr = 0;
    incr_addr = 0;
    decr = 0;
    decr_addr = 0;
    // Reset the circuit
    rst = 1;
    #10;
    rst = 0;
    // Test 1: Increase counter 0 by 1
    incr = 1;
    incr_addr = 0;
    #10;
    incr = 0;
    // Display the state of the cnt array after Test 1
    $display("State after Test 1:");
    for (int i = 0; i < 8; i = i + 1) begin
      $display("cnt[%0d] = %0d", i, cnt[i]);
    end
    // Test 2: Decrease counter 1 by 1
    decr = 1;
    decr_addr = 1;
    #10;
    decr = 0;

     // Display the state of the cnt array after Test 2
    $display("State after Test 2:");
    for (int i = 0; i < 8; i = i + 1) begin
      $display("cnt[%0d] = %0d", i, cnt[i]);
    end
    // Test 3: Increase counter 2 and decrease counter 2 in the
   //  same clock cycle (no change)
    incr = 1;
    incr_addr = 2;
    decr = 1;
    decr_addr = 2;
    #10;
    incr = 0;
    decr = 0;
    // Display the state of the cnt array after Test 3
    $display("State after Test 3:");
    for (int i = 0; i < 8; i = i + 1) begin
      $display("cnt[%0d] = %0d", i, cnt[i]);
    end
    // Finish simulation
    $finish;
  end
  always #5 clk = ~clk; 
endmodule
