module FPU(
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
	input  wire [31:0] A,
	input  wire [31:0] B,
	input  wire [1:0]  opcode,
	output wire [31:0] O
);


wire        a_sign;
wire [7:0]  a_exponent;
wire [23:0] a_mantissa;


wire        b_sign;
wire [7:0]  b_exponent;
wire [23:0] b_mantissa;


reg         o_sign;
reg [7:0]   o_exponent;
reg [24:0]  o_mantissa;


reg  [31:0] adder_a_in;
reg  [31:0] adder_b_in;
wire [31:0] adder_out;


reg  [31:0] multiplier_a_in;
reg  [31:0] multiplier_b_in;
wire [31:0] multiplier_out;


reg  [31:0] divider_a_in;
reg  [31:0] divider_b_in;
wire [31:0] divider_out;


reg         start_reg;
reg [31:0]  A_reg;
reg [31:0]  B_reg;
reg [1:0]   opcode_reg;


assign a_sign = A_reg[31];
assign a_exponent = A_reg[30:23];
assign a_mantissa = {1'b1, A_reg[22:0]};


assign b_sign = B_reg[31];
assign b_exponent = B_reg[30:23];
assign b_mantissa = {1'b1, B_reg[22:0]};


assign O[31] = o_sign;
assign O[30:23] = o_exponent;
assign O[22:0] = o_mantissa[22:0];


assign ADD = !opcode_reg[1] & !opcode_reg[0];
assign SUB = !opcode_reg[1] & opcode_reg[0];
assign MUL = opcode_reg[1] & !opcode_reg[0];
assign DIV = opcode_reg[1] & opcode_reg[0];


Adder adder(
	.a(adder_a_in),
	.b(adder_b_in),
	.out(adder_out)
);


Multiplier multiplier(
	.a(multiplier_a_in),
	.b(multiplier_b_in),
	.out(multiplier_out)
);


Divider divider(
	.a(divider_a_in),
	.b(divider_b_in),
	.out(divider_out)
);


always @(posedge clk) begin
    if (!rst) begin
        start_reg <= 0;
        A_reg <= 0;
        B_reg <= 0;
        opcode_reg <= 0;
        o_sign <= 0;
        o_exponent <= 0;
        o_mantissa <= 0;
    end

    else begin
        start_reg <= start;
        A_reg <= A;
        B_reg <= B;
        opcode_reg <= opcode;
        if (start_reg) begin
	        if (ADD) begin
	        	//If a or b or both are NaN return NaN
	        	if ((a_exponent == 8'b11111111 && a_mantissa != 0) || (b_exponent == 8'b11111111 && b_mantissa != 0) ||
	        	    (a_exponent == 8'b11111111 && a_mantissa != 0 && b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //If a is 켲nf and b is 켲nf return 켲nf
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0) && (a_sign == b_sign)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //if a is 켲nf and b is -+inf return NaN
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0) && (a_sign != b_sign)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = 1;
	        	end
                //If a is 켲nf and b is not NaN return 켲nf
                else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && !(b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
	        	//If b is 켲nf and a is not NaN return 켲nf
                else if ((b_exponent == 8'b11111111 && b_mantissa == 0) && !(a_exponent == 8'b11111111 && a_mantissa != 0)) begin
	        		o_sign = b_sign;
	        		o_exponent = b_exponent;
	        		o_mantissa = b_mantissa;
	        	end
	        	//Not special cases
	        	else begin
	        		adder_a_in = A_reg;
	        		adder_b_in = B_reg;
	        		o_sign = adder_out[31];
	        		o_exponent = adder_out[30:23];
	        		o_mantissa = adder_out[22:0];
	        	end
	        end

	        else if (SUB) begin
	        	//If a or b or both are NaN return NaN
	        	if ((a_exponent == 8'b11111111 && a_mantissa != 0) || (b_exponent == 8'b11111111 && b_mantissa != 0) ||
	        	    (a_exponent == 8'b11111111 && a_mantissa != 0 && b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //If a is 켲nf and b is 켲nf return NaN
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0) && (a_sign == b_sign)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = 1;
	        	end
                //if a is 켲nf and b is -+inf return 켲nf
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0) && (a_sign != b_sign)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //If a is 켲nf and b is not NaN return 켲nf
                else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && !(b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
	        	//If b is 켲nf and a is not NaN return -+inf
                else if ((b_exponent == 8'b11111111 && b_mantissa == 0) && !(a_exponent == 8'b11111111 && a_mantissa != 0)) begin
	        		o_sign = ~b_sign;
	        		o_exponent = b_exponent;
	        		o_mantissa = b_mantissa;
	        	end
	        	//Not special cases
	        	else begin
	        		adder_a_in = A_reg;
	        		adder_b_in = {~B_reg[31], B_reg[30:0]};
	        		o_sign = adder_out[31];
	        		o_exponent = adder_out[30:23];
	        		o_mantissa = adder_out[22:0];
	        	end
	        end

	        else if (MUL) begin
	        	//If a or b or both are NaN return NaN
	        	if ((a_exponent == 8'b11111111 && a_mantissa != 0) || (b_exponent == 8'b11111111 && b_mantissa != 0) ||
	        	    (a_exponent == 8'b11111111 && a_mantissa != 0 && b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //if a is inf and b is inf return inf
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //if a is 켲nf and b is 0 return NaN
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b00000000 && b_mantissa == 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = 1;
	        	end
                //if a is 0 and b is 켲nf return NaN
	        	else if ((a_exponent == 8'b00000000 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0)) begin
	        		o_sign = b_sign;
	        		o_exponent = b_exponent;
	        		o_mantissa = 1;
	        	end
                //If a is inf and b is not NaN return inf
                else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && !(b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
	        	//If b is inf and a is not NaN return inf
                else if ((b_exponent == 8'b11111111 && b_mantissa == 0) && !(a_exponent == 8'b11111111 && a_mantissa != 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = b_exponent;
	        		o_mantissa = b_mantissa;
	        	end
	        	//Not special cases
	        	else begin
	        		multiplier_a_in = A_reg;
	        		multiplier_b_in = B_reg;
	        		o_sign = multiplier_out[31];
	        		o_exponent = multiplier_out[30:23];
	        		o_mantissa = multiplier_out[22:0];
	        	end
	        end

	        else if (DIV) begin
	        	//If a or b or both are NaN return NaN
	        	if ((a_exponent == 8'b11111111 && a_mantissa != 0) || (b_exponent == 8'b11111111 && b_mantissa != 0) ||
	        	    (a_exponent == 8'b11111111 && a_mantissa != 0 && b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
                //if a is inf and b is inf return NaN
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && (b_exponent == 8'b11111111 && b_mantissa == 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = 999999;
	        	end
	        	//if a is 0 and b is 0 return NaN
	        	else if ((a_exponent == 8'b00000000 && a_mantissa == 0) && (b_exponent == 8'b00000000 && b_mantissa == 0)) begin
	        		o_sign = a_sign;
	        		o_exponent = 8'b11111111;
	        		o_mantissa = 1;
	        	end
                //if a is inf and b is not NaN return inf
	        	else if ((a_exponent == 8'b11111111 && a_mantissa == 0) && !(b_exponent == 8'b11111111 && b_mantissa != 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
	        	//If a is not NaN and b is inf return 0
                else if (!(a_exponent == 8'b11111111 && a_mantissa != 0) && (b_exponent == 8'b11111111 && b_mantissa == 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = 8'b00000000;
	        		o_mantissa = b_mantissa;
	        	end
	        	//If a is not NaN and b is 0 return 켲nf
	        	else if (!(a_exponent == 8'b11111111 && a_mantissa != 0) && (b_exponent == 8'b00000000 && b_mantissa == 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = 8'b11111111;
	        		o_mantissa = 0;
	        	end
	            //If a is 0 and b is not NaN return 0
	        	else if ((a_exponent == 8'b00000000 && a_mantissa == 0) && !(b_exponent == 8'b00000000 && b_mantissa != 0)) begin
	        		o_sign = a_sign ^ b_sign;
	        		o_exponent = a_exponent;
	        		o_mantissa = a_mantissa;
	        	end
	        	//Not special cases
	        	else begin
	        		divider_a_in = A_reg;
	    	        divider_b_in = B_reg;
	    	        o_sign = divider_out[31];
	    	        o_exponent = divider_out[30:23];
	    	        o_mantissa = divider_out[22:0];
	        	end
	        end
	    end
    end
end


endmodule