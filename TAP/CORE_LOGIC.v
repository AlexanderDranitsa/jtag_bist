module core_logic
(
    input           clk    
,   input  [4:0]    X
,   input           enable
,   output [3:0]    Y
);

localparam BIT_STATE_FLAG = 0;
localparam SET_STATE_FLAG = 1'b1;

reg [3:0] state;
assign Y = state;

wire [3:0] assign_X;
assign assign_X = X[4:1];

localparam STATE_0 = 4'b0000; 
localparam STATE_1 = 4'b0001; 
localparam STATE_2 = 4'b0010; 
localparam STATE_3 = 4'b0011;
localparam STATE_4 = 4'b0100;
localparam STATE_5 = 4'b0101;
localparam STATE_6 = 4'b0110;
localparam STATE_7 = 4'b0111;
localparam STATE_8 = 4'b1000;
localparam STATE_9 = 4'b1001;
localparam STATE_A = 4'b1010;
localparam STATE_B = 4'b1011;
localparam STATE_C = 4'b1100;
localparam STATE_D = 4'b1101;
localparam STATE_E = 4'b1110;
localparam STATE_F = 4'b1111;

always @ (posedge clk) begin
	if ( !enable )
		state <= 4'b0000;
	else begin

		if (X[BIT_STATE_FLAG] == SET_STATE_FLAG)
			state <= assign_X;
        else begin                    	
            case(state)
            STATE_0 : begin
                            if ( assign_X == 4'b0010 )                 state <= STATE_1;
                            if ( {assign_X[3], assign_X[2], assign_X[0]} == 3'b100 ) state <= STATE_6;
                            if ( assign_X == 4'b1111 )                 state <= STATE_D;
                        end

            STATE_1 : begin
                            if ( {assign_X[3], assign_X[2]} == 2'b10  )       state <= STATE_0;
                            if ( {assign_X[3], assign_X[2], assign_X[1]} == 3'b101 ) state <= STATE_3;
                            if ( assign_X == 4'b1110 )                 state <= STATE_6;
                            if ( assign_X == 4'b1101 )                 state <= STATE_8;
                            if ( assign_X == 4'b0010 )                 state <= STATE_B;
                        end

            STATE_2 : begin
                            if ( assign_X == 4'b1011 )                 state <= STATE_1;
                            if ( assign_X == 4'b1111 )                 state <= STATE_6;
                            if ( {assign_X[3], assign_X[2]} == 2'b00 )        state <= STATE_9;
                            if ( assign_X == 4'b1100 )                 state <= STATE_E;
                        end

            STATE_3 : begin
                       if ( assign_X == 4'b1110 )                 state <= STATE_2;
                       if ( assign_X == 4'b1010 )                 state <= STATE_4;
                       if ( assign_X == 4'b0110 )                 state <= STATE_D;
                        end

            STATE_4: begin
                       if ( assign_X == 4'b1111 )                 state <= STATE_1;
                       if ( assign_X == 4'b0001 )                 state <= STATE_7;
                       if ( assign_X == 4'b1110 )                 state <= STATE_9;
                       if ( {assign_X[3], assign_X[2], assign_X[0]} == 3'b011 ) state <= STATE_C;
                   end
            STATE_5: begin
                       if ( assign_X == 4'b1100 )                 state <= STATE_0;
                       if ( assign_X == 4'b0011 )                 state <= STATE_2;
                       if ( assign_X == 4'b1111 )                 state <= STATE_4;
                       if ( assign_X == 4'b0010 )                 state <= STATE_8;
                       if ( assign_X == 4'b1101 )                 state <= STATE_D;
                   end
           STATE_6: begin
                       if ( assign_X == 4'b0001 )                 state <= STATE_2;
                       if ( assign_X == 4'b0000 )                 state <= STATE_3;
                       if ( assign_X == 4'b0010 )                 state <= STATE_5;
                       if ( assign_X == 4'b0011 )                 state <= STATE_8;
                       if ( {assign_X[3], assign_X[2], assign_X[1]} == 3'b111 ) state <= STATE_C;
                   end
           STATE_7: begin
                       if ( assign_X == 4'b0000 )                 state <= STATE_0;
                       if ( {assign_X[3], assign_X[2], assign_X[0]} == 3'b110 ) state <= STATE_2;
                       if ( assign_X == 4'b0101 )                 state <= STATE_5;
                       if ( assign_X == 4'b0011 )                 state <= STATE_A;
                       if ( {assign_X[3], assign_X[2], assign_X[0]} == 3'b111 ) state <= STATE_9;
                   end
            STATE_8: begin
                       if ( {assign_X[3], assign_X[2], assign_X[1]} == 3'b110 ) state <= STATE_3;
                       if ( assign_X == 4'b1111 )                 state <= STATE_1;
                       if ( assign_X == 4'b0011 )                 state <= STATE_7;
                       if ( assign_X == 4'b1011 )                 state <= STATE_B;
                   end
            STATE_9: begin
                       if ( assign_X == 4'b0000 )                 state <= STATE_4;
                       if ( assign_X == 4'b0001 )                 state <= STATE_7;
                       if ( assign_X == 4'b1110 )                 state <= STATE_C;
                       if ( assign_X == 4'b1011 )                 state <= STATE_E;
                   end
            STATE_A: begin
                       if ( assign_X == 4'b0011 )                 state <= STATE_2;
                       if ( assign_X == 4'b1111 )                 state <= STATE_5;
                       if ( assign_X == 4'b1010 )                 state <= STATE_8;
                       if ( assign_X == 4'b0001 )                 state <= STATE_D;
                   end
           STATE_B: begin
                       if ( assign_X == 4'b1010 )                 state <= STATE_1;
                       if ( {assign_X[3], assign_X[2], assign_X[1]} == 3'b110 ) state <= STATE_8;
                       if ( assign_X == 4'b1111 )                 state <= STATE_D;
                       if ( assign_X == 4'b1001 )                 state <= STATE_E;
                   end
            STATE_C: begin
                       if ( assign_X == 4'b1110 )                 state <= STATE_2;
                       if ( assign_X == 4'b1001 )                 state <= STATE_6;
                       if ( {assign_X[3], assign_X[2], assign_X[1]} == 3'b101 ) state <= STATE_9;
                       if ( assign_X == 4'b0000 )                 state <= STATE_E;
                   end
           STATE_D: begin
                       if ( assign_X == 4'b0010 )                 state <= STATE_0;
                       if ( assign_X == 4'b0101 )                 state <= STATE_2;
                       if ( assign_X == 4'b1001 )                 state <= STATE_3;
                       if ( assign_X == 4'b1110 )                 state <= STATE_5;
                       if ( assign_X == 4'b1111 )                 state <= STATE_B;
                   end
           STATE_E: begin
                       if ( assign_X == 4'b1111 )                 state <= STATE_1;
                       if ( {assign_X[2], assign_X[1], assign_X[0]} == 3'b101 ) state <= STATE_4;               
                       if ( assign_X == 4'b1100 )                 state <= STATE_7;
                   end
            STATE_F: begin
                       if ( assign_X == 4'b1100 )                 state <= STATE_3;
                       if ( assign_X == 4'b1010 )                 state <= STATE_7;               
                       if ( assign_X == 4'b0000 )                 state <= STATE_A;
                       if ( {assign_X[3], assign_X[2]} == 2'b01 )        state <= STATE_C;
                   end
            default:                                state <= STATE_0;
            endcase
        end 
    end
end
//   ^   ^   ^   ^   |   |   |   |
//   |   |   |   |   v   v   v   v
//  -------------------------------
// | R | R | R | R | T | T | T | T |  <- { EXTEST_IO, TUMBLERS }
//  -------------------------------
//   ^   ^   ^   ^   v   v   v   v
//   |   |   |   |   |   |   |   |   
//   v   v   v   v   v   v   v   v
// ----------------------------------------
// | x | x | x | x | x | x | x | x | x | x | BSR     
// ----------------------------------------
//   ^   ^   ^   ^   ^   ^   ^   ^    LSB
//   |   |   |   |   |   |   |   |
//   |   |   |   |   v   v   v   v
//   |   |   |   |  ---------------
//   |   |   |   | | R | R | R | R |  INTEST_CL
//   |   |   |   |  ---------------                 
//   |   |   |   |   |   |   |   |   data_in
//   |   |   |   |   v   v   v   v               
//   |   |   |   | -----------------
//   |   |   |   | |   CoreLogic   |
//   |   |   |   | -----------------
//   |   |   |   |   |   |   |   |
//   |   |   |   -----   |   |   |   data_out      
//   |   |   -------------   |   | 
//   |   ---------------------   |      
//   -----------------------------

endmodule