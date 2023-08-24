module PhaseDetector (
    input wire clk,
    input wire reset,
    input wire signal1,
    input wire signal2,
    output wire phase_difference
);

    reg prev_signal1;
    reg prev_signal2;

    always @(posedge clk or posedge reset) begin
        if (reset)
            prev_signal1 <= 1'b0;
        else
            prev_signal1 <= signal1;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            prev_signal2 <= 1'b0;
        else
            prev_signal2 <= signal2;
    end

    assign phase_difference = prev_signal1 ^ prev_signal2;

endmodule
