module tb();

  reg reset;
  reg clk = 0;
  wire [1:0] Q;

  sequential_circuit dut (
    .clk(clk),
    .reset(reset),
    .Q(Q)
  );

  always begin
    clk <= ~clk;
    #5;
  end

  initial begin
    reset <= 1'b1;
    #10;
    reset <= 1'b0;
    #200;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end

endmodule
     
// iverilog -o out.vpp testbench.v design.v dump.vcd 
// vvp out.vpp 
// gtkware dump.vcd