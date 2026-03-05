module bus_multiplexer( 
	output reg [18:0] output_bus,
	input [18:0] bus0, bus1, bus2, bus3, bus4, bus5, bus6, bus7,
	input [2:0] sel
);

	always@(*)begin
		case(sel)
			3'b000:output_bus=bus0;
			3'b001:output_bus=bus1;
			3'b010:output_bus=bus2;
			3'b011:output_bus=bus3;
			3'b100:output_bus=bus4;
			3'b101:output_bus=bus5;
			3'b110:output_bus=bus6;
			3'b111:output_bus=bus7;
			default:output_bus=bus0;
		endcase
	end

endmodule