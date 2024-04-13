module Divider(
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


reg  [7:0]  i_e;
reg  [24:0] i_m;
wire [7:0]  o_e;
wire [24:0] o_m;


integer i;
reg [23:0] remainder;


assign out[31] = o_sign;
assign out[30:23] = o_exponent;
assign out[22:0] = o_mantissa[22:0];


Add_Div_Normaliser add_div_normaliser(
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
    o_exponent_wo_bias = a_exponent - b_exponent;
    o_exponent = o_exponent_wo_bias + 127;

    for (i = 0; i < 24; i = i + 1)    begin     //  o_mantissa = a_mantissa / b_mantissa;
        remainder = {remainder[22:0], a_mantissa[23]};
            a_mantissa[23:1] = a_mantissa[22:0];
            remainder = remainder - b_mantissa;
            if (remainder[23] == 1)    begin
                a_mantissa[0] = 0;
                remainder = remainder + b_mantissa;
            end
            else
                a_mantissa[0] = 1;
        end
    o_mantissa = a_mantissa;   

	// Normalization
    if (o_mantissa[24] == 1) begin
        o_mantissa = o_mantissa >> 1;
        o_exponent = o_exponent + 1;  
    end

    else if ((o_mantissa[23] != 1) && (o_exponent != 0)) begin
        i_e = o_exponent;
        i_m = o_mantissa;
        o_exponent = o_e;
        o_mantissa = o_m;
    end
end


endmodule