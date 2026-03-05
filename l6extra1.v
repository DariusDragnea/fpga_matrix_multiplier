
module l6_mac_v2 (
    input signed [7:0] x,
    input signed [7:0] y,
    input mmac_clr,
    input rst,
    input clk,
    output reg [18:0] s,
    output reg [7:0] xo,
    output reg [7:0] yo
);
wire [18:0] z;
assign z = x * y;

always @(posedge clk) begin
    if(rst) s<=0;
    else s <= s + z;
end

always @(posedge clk) begin
    if(rst) begin
        xo <= 0;
        yo <= 0;
    end else begin
        xo <= x;
        yo <= y;
    end
end

endmodule


module l6_8x8_array (
    input rst, clk, clr,
    input [7:0] xin [0:7],
    input [7:0] yin [0:7],
    output wire [18:0] c [0:7][0:7]
);

wire [7:0] x [0:8][0:8];
wire [7:0] y [0:8][0:8];
//wire [18:0] c [0:7][0:7];



genvar i, j;
generate
    for (i = 0; i < 8; i = i + 1) begin : col

        assign x[0][i] = xin[i];
        assign y[i][0] = yin[i];

        for (j = 0; j < 8; j = j + 1) begin : row

            l6_mac_v2 mac_inst (
                .clk(clk),
                .rst(rst),
                .mmac_clr(clr),
                .x(x[i][j]),
                .y(y[i][j]),
                .s(c[i][j]),
                .xo(x[i+1][j]),         // max allowed - [8][7]
                .yo(y[i][j+1])          // max allowed - [7][8]
            );

        end
    end
endgenerate

endmodule

module dff_io(
    input clk, rst,
    input [7:0] d,
    output reg [7:0] q
);

always @(posedge clk) begin
    if(rst) begin
        q <= 0;
    end else begin
        q <= d;
    end

end

endmodule

module dff_chain #(
    parameter N = 8  // Number of DFFs in the chain
)(
    input clk,
    input rst,
    input [7:0] d_in,         // Input to first DFF
    output [7:0] q_out        // Output from last DFF
);

// Declare intermediate connection wires
wire [7:0] q_chain [0:N];

// Assign input to first DFF
assign q_chain[0] = d_in;

// Generate DFF chain
genvar i;
generate
    for (i = 1; i <= N; i = i + 1) begin : dff_gen
        dff_io dff_inst (
            .clk(clk),
            .rst(rst),
            .d(q_chain[i-1]),  // Input from previous stage
            .q(q_chain[i])     // Output to next stage
        );
    end
endgenerate

// Final output assignment
assign q_out = q_chain[N];

endmodule


module l6_array_feed (
input clk, rst
);

reg [7:0] ma [0:63]; // Matrix A
reg [7:0] mb [0:63]; // Matrix B

initial begin
    $readmemb("ram_A", ma);
    $readmemb("ram_B", mb);
end

wire [7:0] xin_chained [0:7];
wire [7:0] yin_chained [0:7];
reg [7:0] xb [0:8];
reg [7:0] yb [0:8];

assign xin_chained[0] = xb[0];      // First one in array have no dff
assign yin_chained[0] = yb[0];
genvar i;
generate
    for(i = 1; i < 8; i=i+1) begin
        dff_chain #(.N(i)) dff_x_delayline0 (.clk(clk), .rst(rst), .d_in(xb[i]), .q_out(xin_chained[i]));
        dff_chain #(.N(i)) dff_y_delayline0 (.clk(clk), .rst(rst), .d_in(yb[i]), .q_out(yin_chained[i]));
    end
endgenerate

wire [18:0] outbuf [0:7][0:7];

l6_8x8_array uuu(.rst(rst), .clk(clk), .clr(1'b0), .xin(xin_chained), .yin(yin_chained), .c(outbuf));

reg [7:0] clk_r;

always @(posedge clk) begin
    if(rst) begin
        clk_r <= 0;
        xb[0] <= 0;
        xb[1] <= 0;
        xb[2] <= 0;
        xb[3] <= 0;
        xb[4] <= 0;
        xb[5] <= 0;
        xb[6] <= 0;
        xb[7] <= 0;

        yb[0] <= 0;
        yb[1] <= 0;
        yb[2] <= 0;
        yb[3] <= 0;
        yb[4] <= 0;
        yb[5] <= 0;
        yb[6] <= 0;
        yb[7] <= 0;
    end else if (clk_r < 8) begin

        xb[0] <= ma[8*clk_r];


        xb[1] <= ma[1+8*clk_r];
        xb[2] <= ma[2+8*clk_r];
        xb[3] <= ma[3+8*clk_r];
        xb[4] <= ma[4+8*clk_r];
        xb[5] <= ma[5+8*clk_r];
        xb[6] <= ma[6+8*clk_r];
        xb[7] <= ma[7+8*clk_r];


        yb[0] <= mb[clk_r];
        yb[1] <= mb[8+clk_r];
        yb[2] <= mb[16+clk_r];
        yb[3] <= mb[24+clk_r];
        yb[4] <= mb[32+clk_r];
        yb[5] <= mb[40+clk_r];
        yb[6] <= mb[48+clk_r];
        yb[7] <= mb[56+clk_r];

        clk_r <= clk_r + 1;
    end else begin          // feed 0 into dff chain, avoids undefined state
        xb[0] <= 0;
        xb[1] <= 0;
        xb[2] <= 0;
        xb[3] <= 0;
        xb[4] <= 0;
        xb[5] <= 0;
        xb[6] <= 0;
        xb[7] <= 0;

        yb[0] <= 0;
        yb[1] <= 0;
        yb[2] <= 0;
        yb[3] <= 0;
        yb[4] <= 0;
        yb[5] <= 0;
        yb[6] <= 0;
        yb[7] <= 0;
        clk_r <= clk_r + 1;
    end
end

endmodule

module l6extra;
reg clk, rst, start;
wire done;
integer i;

l6_array_feed uuu(.clk(clk), .rst(rst));

initial begin
    $dumpfile("l6_extra.vcd");
    $dumpvars(0, l6extra);
    clk = 0;
    rst = 1;
    #50 rst = 0; // Release reset
    #10 start <=0;
    #10 start <= 1;
    #300
    $display(uuu.outbuf[0][0]);

    // Print result matrix C (column-major)

    $finish;
end

always #5 clk = ~clk; // Generate clock
endmodule


