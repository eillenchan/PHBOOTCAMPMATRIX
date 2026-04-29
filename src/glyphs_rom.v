`default_nettype none

module glyphs_rom(
    input  wire [5:0] c,
    input  wire [3:0] y,
    input  wire [2:0] x,
    output reg        pixel
);

    reg [7:0] rb;
    reg [5:0] glyph;

    always @(*) begin

        // =====================================================
        // 38 glyph slots total
        //
        // 0  Y
        // 1  I
        // 2  SPACE
        // 3  M
        // 4  A
        // 5  N
        // 6  SPACE
        // 7  E
        // 8  I
        // 9  L
        // 10 L
        // 11 E
        // 12 N
        // 13 SPACE
        // 14 C
        // 15 H
        // 16 A
        // 17 N
        // 18 SPACE
        // 19 SPACE
        // 20 P
        // 21 H
        // 22 SPACE
        // 23 B
        // 24 O
        // 25 O
        // 26 T
        // 27 C
        // 28 A
        // 29 M
        // 30 P
        // 31 SPACE
        // 32 2
        // 33 0
        // 34 2
        // 35 6
        // 36 SPACE
        // 37 SPACE
        // =====================================================

        case (c % 6'd38)

            // YI MAN EILLEN CHAN
            0:  glyph = 6'd24; // Y
            1:  glyph = 6'd8;  // I
            2:  glyph = 6'd26; // SPACE
            3:  glyph = 6'd12; // M
            4:  glyph = 6'd0;  // A
            5:  glyph = 6'd13; // N
            6:  glyph = 6'd26; // SPACE
            7:  glyph = 6'd4;  // E
            8:  glyph = 6'd8;  // I
            9:  glyph = 6'd11; // L
            10: glyph = 6'd11; // L
            11: glyph = 6'd4;  // E
            12: glyph = 6'd13; // N
            13: glyph = 6'd26; // SPACE
            14: glyph = 6'd2;  // C
            15: glyph = 6'd7;  // H
            16: glyph = 6'd0;  // A
            17: glyph = 6'd13; // N

            // Separator spaces
            18: glyph = 6'd26; // SPACE
            19: glyph = 6'd26; // SPACE

            // PH BOOTCAMP 2026
            20: glyph = 6'd15; // P
            21: glyph = 6'd7;  // H
            22: glyph = 6'd26; // SPACE
            23: glyph = 6'd1;  // B
            24: glyph = 6'd14; // O
            25: glyph = 6'd14; // O
            26: glyph = 6'd19; // T
            27: glyph = 6'd2;  // C
            28: glyph = 6'd0;  // A
            29: glyph = 6'd12; // M
            30: glyph = 6'd15; // P
            31: glyph = 6'd26; // SPACE
            32: glyph = 6'd29; // 2
            33: glyph = 6'd27; // 0
            34: glyph = 6'd29; // 2
            35: glyph = 6'd33; // 6

            // Trailing spaces
            36: glyph = 6'd26; // SPACE
            37: glyph = 6'd26; // SPACE

            default: glyph = 6'd26;

        endcase


        // =====================================================
        // Actual character drawing table
        // A-Z, SPACE, 0-9
        // =====================================================

        case (glyph)

            0: begin // A
                case (y)
                    2:       rb = 8'h3C;
                    3,4,5:   rb = 8'h66;
                    6,7:     rb = 8'hFF;
                    8,9,10:  rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            1: begin // B
                case (y)
                    2,6,10:       rb = 8'hFC;
                    3,4,5,7,8,9:  rb = 8'hC6;
                    default:      rb = 8'h00;
                endcase
            end

            2: begin // C
                case (y)
                    2,10:       rb = 8'h7E;
                    3,9:        rb = 8'hC3;
                    4,5,6,7,8:  rb = 8'hC0;
                    default:    rb = 8'h00;
                endcase
            end

            3: begin // D
                case (y)
                    2,10:           rb = 8'hF8;
                    3,4,5,6,7,8,9:  rb = 8'hC6;
                    default:        rb = 8'h00;
                endcase
            end

            4: begin // E
                case (y)
                    2,6,10:       rb = 8'hFE;
                    3,4,5,7,8,9:  rb = 8'hC0;
                    default:      rb = 8'h00;
                endcase
            end

            5: begin // F
                case (y)
                    2,6:              rb = 8'hFE;
                    3,4,5,7,8,9,10:   rb = 8'hC0;
                    default:          rb = 8'h00;
                endcase
            end

            6: begin // G
                case (y)
                    2,10:     rb = 8'h7E;
                    3,4,5:    rb = 8'hC0;
                    6:        rb = 8'hCE;
                    7,8,9:    rb = 8'hC6;
                    default:  rb = 8'h00;
                endcase
            end

            7: begin // H
                case (y)
                    2,3,4,5,7,8,9,10: rb = 8'hC6;
                    6:                rb = 8'hFE;
                    default:          rb = 8'h00;
                endcase
            end

            8: begin // I
                case (y)
                    2,10:           rb = 8'h7E;
                    3,4,5,6,7,8,9:  rb = 8'h18;
                    default:        rb = 8'h00;
                endcase
            end

            9: begin // J
                case (y)
                    2:       rb = 8'h3F;
                    3,4,5,6,7,8:
                             rb = 8'h0C;
                    9:       rb = 8'hCC;
                    10:      rb = 8'h78;
                    default: rb = 8'h00;
                endcase
            end

            10: begin // K
                case (y)
                    2,10:    rb = 8'hC6;
                    3,9:     rb = 8'hCC;
                    4,8:     rb = 8'hD8;
                    5,7:     rb = 8'hF0;
                    6:       rb = 8'hE0;
                    default: rb = 8'h00;
                endcase
            end

            11: begin // L
                case (y)
                    2,3,4,5,6,7,8,9:
                             rb = 8'hC0;
                    10:      rb = 8'hFE;
                    default: rb = 8'h00;
                endcase
            end

            12: begin // M
                case (y)
                    2:       rb = 8'hC3;
                    3:       rb = 8'hE7;
                    4:       rb = 8'hFF;
                    5:       rb = 8'hDB;
                    6,7,8,9,10:
                             rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            13: begin // N
                case (y)
                    2,3:     rb = 8'hC6;
                    4:       rb = 8'hE6;
                    5:       rb = 8'hF6;
                    6:       rb = 8'hD6;
                    7:       rb = 8'hC6;
                    8:       rb = 8'hCE;
                    9,10:    rb = 8'hC6;
                    default: rb = 8'h00;
                endcase
            end

            14: begin // O
                case (y)
                    2,10:       rb = 8'h3C;
                    3,9:        rb = 8'h66;
                    4,5,6,7,8:  rb = 8'hC3;
                    default:    rb = 8'h00;
                endcase
            end

            15: begin // P
                case (y)
                    2,6:        rb = 8'hFC;
                    3,4,5:      rb = 8'hC6;
                    7,8,9,10:   rb = 8'hC0;
                    default:    rb = 8'h00;
                endcase
            end

            16: begin // Q
                case (y)
                    2,10:       rb = 8'h3C;
                    3,9:        rb = 8'h66;
                    4,5,6,7:    rb = 8'hC3;
                    8:          rb = 8'hD3;
                    11:         rb = 8'h0C;
                    default:    rb = 8'h00;
                endcase
            end

            17: begin // R
                case (y)
                    2,6:        rb = 8'hFC;
                    3,4,5:      rb = 8'hC6;
                    7,8,9:      rb = 8'hD8;
                    10:         rb = 8'hC6;
                    default:    rb = 8'h00;
                endcase
            end

            18: begin // S
                case (y)
                    2:       rb = 8'h3E;
                    3:       rb = 8'h63;
                    4:       rb = 8'h60;
                    5:       rb = 8'h7C;
                    6,7:     rb = 8'h06;
                    8:       rb = 8'h63;
                    9:       rb = 8'h3E;
                    default: rb = 8'h00;
                endcase
            end

            19: begin // T
                case (y)
                    2:       rb = 8'hFF;
                    3,4,5,6,7,8,9,10:
                             rb = 8'h18;
                    default: rb = 8'h00;
                endcase
            end

            20: begin // U
                case (y)
                    2,3,4,5,6,7,8,9:
                             rb = 8'hC6;
                    10:      rb = 8'h7E;
                    default: rb = 8'h00;
                endcase
            end

            21: begin // V
                case (y)
                    2,3,4,5,6:
                             rb = 8'hC3;
                    7,8:     rb = 8'h66;
                    9:       rb = 8'h3C;
                    10:      rb = 8'h18;
                    default: rb = 8'h00;
                endcase
            end

            22: begin // W
                case (y)
                    2,3,4,5: rb = 8'hC3;
                    6:       rb = 8'hDB;
                    7:       rb = 8'hFF;
                    8:       rb = 8'hE7;
                    9,10:    rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            23: begin // X
                case (y)
                    2,10:    rb = 8'hC3;
                    3,9:     rb = 8'h66;
                    4,8:     rb = 8'h3C;
                    5,6,7:   rb = 8'h18;
                    default: rb = 8'h00;
                endcase
            end

            24: begin // Y
                case (y)
                    2,3,4,5: rb = 8'hC3;
                    6:       rb = 8'h7E;
                    7,8,9,10:
                             rb = 8'h18;
                    default: rb = 8'h00;
                endcase
            end

            25: begin // Z
                case (y)
                    2,10:    rb = 8'hFF;
                    3:       rb = 8'h0E;
                    4:       rb = 8'h0C;
                    5:       rb = 8'h18;
                    6:       rb = 8'h30;
                    7:       rb = 8'h60;
                    8:       rb = 8'hC0;
                    9:       rb = 8'hE0;
                    default: rb = 8'h00;
                endcase
            end

            26: begin // SPACE
                rb = 8'h00;
            end

            27: begin // 0
                case (y)
                    2,10:           rb = 8'h3C;
                    3,4,5,6,7,8,9:  rb = 8'h66;
                    default:        rb = 8'h00;
                endcase
            end

            28: begin // 1
                case (y)
                    2,10:           rb = 8'h7E;
                    3,4,5,6,7,8,9:  rb = 8'h18;
                    default:        rb = 8'h00;
                endcase
            end

            29: begin // 2
                case (y)
                    2:       rb = 8'h3E;
                    3:       rb = 8'h63;
                    4:       rb = 8'h03;
                    5:       rb = 8'h06;
                    6:       rb = 8'h1C;
                    7:       rb = 8'h30;
                    8,9:     rb = 8'h60;
                    10:      rb = 8'hFF;
                    default: rb = 8'h00;
                endcase
            end

            30: begin // 3
                case (y)
                    2,10:       rb = 8'h7E;
                    3,4,5,7,8,9:
                                 rb = 8'h06;
                    6:          rb = 8'h3E;
                    default:    rb = 8'h00;
                endcase
            end

            31: begin // 4
                case (y)
                    2,3,4,5: rb = 8'h66;
                    6:       rb = 8'h7E;
                    7,8,9,10:
                             rb = 8'h06;
                    default: rb = 8'h00;
                endcase
            end

            32: begin // 5
                case (y)
                    2:       rb = 8'h7E;
                    3,4:     rb = 8'h60;
                    5:       rb = 8'h7C;
                    6,7,8:   rb = 8'h06;
                    9:       rb = 8'h66;
                    10:      rb = 8'h3C;
                    default: rb = 8'h00;
                endcase
            end

            33: begin // 6
                case (y)
                    2:       rb = 8'h3E;
                    3,4:     rb = 8'h60;
                    5:       rb = 8'h7C;
                    6,7,8,9: rb = 8'h66;
                    10:      rb = 8'h3C;
                    default: rb = 8'h00;
                endcase
            end

            34: begin // 7
                case (y)
                    2:       rb = 8'hFF;
                    3:       rb = 8'h06;
                    4:       rb = 8'h0C;
                    5:       rb = 8'h18;
                    6,7,8,9,10:
                             rb = 8'h18;
                    default: rb = 8'h00;
                endcase
            end

            35: begin // 8
                case (y)
                    2,6,10:       rb = 8'h7E;
                    3,4,5,7,8,9:  rb = 8'h66;
                    default:      rb = 8'h00;
                endcase
            end

            36: begin // 9
                case (y)
                    2,6,10:    rb = 8'h7E;
                    3,4,5:     rb = 8'h66;
                    7,8,9:     rb = 8'h06;
                    default:   rb = 8'h00;
                endcase
            end

            default: begin
                rb = 8'h00;
            end

        endcase

        pixel = rb[7 - x];

    end

endmodule
