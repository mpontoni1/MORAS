// Postavi RAM[5] na najveću moguću vrijednost
@32767
D=A
@5
M=D  

// Postavi brojač na i = 0
@0
D=A
@i
M=D        

(LOOP)
    // Učitavanje trenutne vrijednosti od RAM[i]
    @i
    D=M
    @4
    D=D-A   // D = i - 4
    @END
    D; JGT  // Ako je D > 0 onda završi program

    @i
    A=M     // A = i
    D=M     // D = RAM[i]
    @SKIP
    D; JLE  // Ako je RAM[i] negativan preskoči usporedbu

    @5
    D=D-M   // Usporedi RAM[i] i RAM[5]
    @UPDATE
    D; JLT  // Ako je RAM[i] manji od RAM[5] ažuriraj RAM[5]

(SKIP)
    // Povećaj brojač i
    @i
    M=M+1
    @LOOP
    0; JMP  // Vrati se na početak petlje

(UPDATE)
    @i
    A=M     // A = i 
    D=M     // D = RAM[i]
    @5
    M=D     // RAM[5] = RAM[i]
    @LOOP
    0; JMP  // Vrati se na početak petlje

(END)
    @END
    0; JMP  // Beskonačna petlja
