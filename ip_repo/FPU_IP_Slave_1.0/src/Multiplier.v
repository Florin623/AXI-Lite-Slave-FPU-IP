module Multiplier(
    input  wire [31:0] a,
    input  wire [31:0] b,
    output wire [31:0] out
);


reg        a_sign;
reg [7:0]  a_exponent;
reg [23:0] a_mantissa;


reg        b_sign;
reg [7:0]  b_exponent;
reg [23:0] b_mantissa;


reg        o_sign;
reg [7:0]  o_exponent_wo_bias;
reg [7:0]  o_exponent;
reg [24:0] o_mantissa;


reg [47:0] mantissa_product;


assign out[31] = o_sign;
assign out[30:23] = o_exponent;
assign out[22:0] = o_mantissa[22:0];


reg  [7:0]  i_e;
reg  [47:0] i_m;
wire [7:0]  o_e;
wire [47:0] o_m;


Mul_Normaliser mul_normaliser(
	.in_e(i_e),
	.in_m(i_m),
	.out_e(o_e),
	.out_m(o_m)
);


always @(*) begin
	a_sign = a[31];
	if (a[30:23] == 0) begin
		a_exponent = 8'b00000001;
		a_mantissa = {1'b0, a[22:0]};
	end

	else begin
		a_exponent = a[30:23];
		a_mantissa = {1'b1, a[22:0]};
	end

	b_sign = b[31];
	if (b[30:23] == 0) begin
		b_exponent = 8'b00000001;
		b_mantissa = {1'b0, b[22:0]};
	end

	else begin
		b_exponent = b[30:23];
		b_mantissa = {1'b1, b[22:0]};
	end

    o_sign = a_sign ^ b_sign;
    o_exponent_wo_bias = a_exponent + b_exponent;
    o_exponent = o_exponent_wo_bias - 127;
    mantissa_product = a_mantissa * b_mantissa;

	// Normalization
    if (mantissa_product[47] == 1) begin
        mantissa_product = mantissa_product >> 1;
        o_exponent = o_exponent + 1;
    end

    else if ((mantissa_product[46] != 1) && (o_exponent != 0)) begin
        i_e = o_exponent;
        i_m = mantissa_product;
        o_exponent = o_e;
        mantissa_product = o_m;
    end
		o_mantissa = mantissa_product[46:23];    // truncation
end


endmodule