
// Capstone Project - Part C
// Student K = 31
// Box starts at row 31 (16384 + 31*32 = 17375)
// Height = 20 rows
// Width = 16 x ((31 mod 4) + 1) = 16 pixels (one screen word)

// Continuously check keyboard
(START)
    @KBD
    D=M
    @DRAW_SETUP
    D;JGT

    @CLEAR_SETUP
    0;JMP

// Draw black box
(DRAW_SETUP)
    @17375
    D=A
    @address
    M=D

    @20
    D=A
    @count
    M=D

(DRAW_LOOP)
    @address
    A=M
    M=-1

    @address
    D=M
    @32
    D=D+A
    @address
    M=D

    @count
    MD=M-1
    @DRAW_LOOP
    D;JGT

    @START
    0;JMP

// Clear box when key is released
(CLEAR_SETUP)
    @17375
    D=A
    @address
    M=D

    @20
    D=A
    @count
    M=D

(CLEAR_LOOP)
    @address
    A=M
    M=0

    @address
    D=M
    @32
    D=D+A
    @address
    M=D

    @count
    MD=M-1
    @CLEAR_LOOP
    D;JGT

    @START
    0;JMP
