
module sparse_16x16 (
    input clk, rst,
    output reg signed [17:0] om [0:15],
    output reg done,
    output reg [8:0] clk_cnt
);

reg [7:0] sp_matrix_in [0:191];
reg [7:0] sp_row [0:16]; // 16+1 = 17
reg [3:0] sp_col [0:191];
reg [7:0] vt     [0:15];

initial begin
    $readmemb("sparse_16x16", sp_matrix_in);
    $readmemb("sparse_col", sp_col);
    //$readmemb("sparse_row", sp_row);          // not used - 25% sparsity = 12/16 elements in each row
    $readmemb("vector_t", vt);
end

reg [7:0] r, vt_idx, rhou, m_e, sum;

always @(posedge clk) begin
    if(rst) begin
        r <= 0;
        vt_idx <= 0;        // test vector index
        sum <= 0;
        m_e <= 0;
        done <= 0;
        om[0] <= 0;
        om[1] <= 0;
        om[2] <= 0;
        om[3] <= 0;
        om[4] <= 0;
        om[5] <= 0;
        om[6] <= 0;
        om[7] <= 0;
        om[8] <= 0;
        om[9] <= 0;
        om[10] <= 0;
        om[11] <= 0;
        om[12] <= 0;
        om[13] <= 0;
        om[14] <= 0;
        om[15] <= 0;
        clk_cnt <= 0;
    end else begin
        rhou <= 12;
        clk_cnt <= clk_cnt + 1;


        if(vt_idx < rhou) begin
            vt_idx <= vt_idx + 1;
            $display("%b @ %d : ",sp_matrix_in[vt_idx], sp_col[vt_idx], vt_idx);
            om[r] <= om[r] + vt[sp_col[vt_idx]] * sp_matrix_in[vt_idx + r*8];
        end else if (r==15) begin
            done <= 1;

        end else begin
            r <= r+1;
            vt_idx <= 0;
        end
    end

end

endmodule


module l6extra2;
reg clk, rst, start;
wire done;
integer i;
wire [8:0] clk_cnt;

wire signed [17:0] om [0:15];

sparse_16x16 uuu(.clk(clk), .rst(rst), .om(om), .clk_cnt(clk_cnt));

initial begin
    $dumpfile("l6_extra2.vcd");
    $dumpvars(0, l6extra2);
    clk = 0;
    rst = 1;
    #50 rst = 0; // Release reset
    #10 start <=0;
    #10 start <= 1;
    wait(uuu.done);
    // Print result matrix C (column-major)
    for (i=0; i<16; i=i+1) begin
        $display(om[i]);
    end

    $display("clock count: %d", clk_cnt);

    $finish;
end

always #5 clk = ~clk; // Generate clock
endmodule


