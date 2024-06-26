module Add_Div_Normaliser(
    input  wire [7:0]  in_e, 
    input  wire [24:0] in_m,
    output reg  [7:0]  out_e,
    output reg  [24:0] out_m
);


always @(*) begin
    if (in_m[23:22] == 2'b01) begin
        out_m = in_m << 1;
		out_e = in_e - 1;
	end

	else if (in_m[23:21] == 3'b001) begin
	    out_m = in_m << 2;
		out_e = in_e - 2;
	end

	else if (in_m[23:20] == 4'b0001) begin
	    out_m = in_m << 3;
		out_e = in_e - 3;
	end

	else if (in_m[23:19] == 5'b00001) begin
	    out_m = in_m << 4;
		out_e = in_e - 4;
	end

	else if (in_m[23:18] == 6'b000001) begin
	    out_m = in_m << 5;
		out_e = in_e - 5;
	end

	else if (in_m[23:17] == 7'b0000001) begin
	    out_m = in_m << 6;
		out_e = in_e - 6;
	end

	else if (in_m[23:16] == 8'b00000001) begin
	    out_m = in_m << 7;
		out_e = in_e - 7;
	end

	else if (in_m[23:15] == 9'b000000001) begin
	    out_m = in_m << 8;
		out_e = in_e - 8;
	end

	else if (in_m[23:14] == 10'b0000000001) begin
	    out_m = in_m << 9;
		out_e = in_e - 9;
	end

	else if (in_m[23:13] == 11'b00000000001) begin
	    out_m = in_m << 10;
		out_e = in_e - 10;
	end

	else if (in_m[23:12] == 12'b000000000001) begin
	    out_m = in_m << 11;
		out_e = in_e - 11;
	end

	else if (in_m[23:11] == 13'b0000000000001) begin
	    out_m = in_m << 12;
		out_e = in_e - 12;
	end

	else if (in_m[23:10] == 14'b00000000000001) begin
	    out_m = in_m << 13;
		out_e = in_e - 13;
	end

	else if (in_m[23:9] == 15'b000000000000001) begin
	    out_m = in_m << 14;
		out_e = in_e - 14;
	end

	else if (in_m[23:8] == 16'b0000000000000001) begin
	    out_m = in_m << 15;
		out_e = in_e - 15;
	end

	else if (in_m[23:7] == 17'b00000000000000001) begin
	    out_m = in_m << 16;
		out_e = in_e - 16;
	end

	else if (in_m[23:6] == 18'b000000000000000001) begin
	    out_m = in_m << 17;
		out_e = in_e - 17;
	end

	else if (in_m[23:5] == 19'b0000000000000000001) begin
	    out_m = in_m << 18;
		out_e = in_e - 18;	
	end

    else if (in_m[23:4] == 20'b00000000000000000001) begin
        out_m = in_m << 19;
		out_e = in_e - 19;
	end

	else if (in_m[23:3] == 21'b000000000000000000001) begin
	    out_m = in_m << 20;
		out_e = in_e - 20;
	end

	else if (in_m[23:2] == 22'b0000000000000000000001) begin
	    out_m = in_m << 21;
		out_e = in_e - 21;
	end

	else if (in_m[23:1] == 23'b00000000000000000000001) begin
	    out_m = in_m << 22;
		out_e = in_e - 22;
	end

	else if (in_m[23:0] == 24'b000000000000000000000001) begin
	    out_m = in_m << 23;
		out_e = in_e - 23;
	end
end


endmodule