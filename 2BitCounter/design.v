module sequential_circuit (Q, clk, reset);
  input clk, reset;
  output [1:0] Q;

  // Register for binary counter
  reg [1:0] Flop;

  // Binary counter logic
  always @(posedge clk or posedge reset)
  begin
    if (reset == 1'b1)
      Flop <= 2'b00;
    else
      Flop <= Flop + 1'b1;
  end

  // Output assignment
  assign Q = Flop;

endmodule

