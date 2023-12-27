/* Rexx */                                                              00010000
SAY "This solves Day 11 Part 2"                                         00020099
NUMERIC DIGITS 15                                                       00020199
                                                                        00021001
/* read the file */                                                     00030001
fname = "AOC1EB.DAY11IN"                                                00040091
"ALLOC F(INDD) DA('"fname"') SHR"                                       00042003
"EXECIO * DISKR INDD (STEM INREC. FINIS"                                00050030
                                                                        00051099
/* game rules */                                                        00051662
answer = 0                                                              00051784
SAY "lines" INREC.0                                                     00051892
SAY "length" LENGTH(INREC.1)                                            00051992
                                                                        00052003
/* read file and calculate stuffs */                                    00052122
galaxies  = 0                                                           00052296
universe. = "+"                                                         00052399
uni.      = "+"                                                         00052499
inputLines = INREC.0                                                    00052599
inputCols  = LENGTH(INREC.1)                                            00052699
HUBBLE_CONST = 999999                                                   00052799
                                                                        00052899
DO I = 1 TO inputLines                                                  00052999
  DO J = 1 TO inputCols                                                 00053099
    cell = SUBSTR(INREC.I,J,1)                                          00053199
    IF cell = "#" THEN DO                                               00053299
      galaxies = galaxies + 1                                           00053399
      universe.galaxies.X = I                                           00053599
      uni.galaxies.X = I                                                00053699
      universe.galaxies.Y = J                                           00053799
      uni.galaxies.Y = J                                                00053899
    END                                                                 00053999
  END                                                                   00054099
END                                                                     00054199
                                                                        00054299
SAY "galaxies" galaxies                                                 00054399
                                                                        00054499
/* recalc row expansioned galaxy location */                            00054599
num_expansions = 0                                                      00054699
DO I = 1 TO inputLines                                                  00054799
  expand = 0                                                            00054899
  DO G = 1 TO inputCols                                                 00054999
    cell = SUBSTR(INREC.I,G,1)                                          00055099
    IF cell = "." THEN expand = expand + 1                              00055299
    IF expand = LENGTH(INREC.I) THEN DO                                 00055499
      num_expansions = num_expansions + 1                               00055699
      DO gal = 1 TO galaxies                                            00055799
        IF universe.gal.X > I THEN DO                                   00055899
          uni.gal.X = uni.gal.X + HUBBLE_CONST                          00056099
        END                                                             00056299
      END                                                               00056399
    END                                                                 00056499
  END                                                                   00056599
END                                                                     00056799
                                                                        00056899
/* recalc column expansioned galaxy location */                         00057299
num_expansions = 0                                                      00057399
DO C = 1 TO inputCols                                                   00057599
  expand = 0                                                            00057799
  DO L = 1 TO inputLines                                                00057999
   cell = SUBSTR(INREC.L,C,1)                                           00058199
   IF cell = "." THEN expand = expand + 1                               00059099
   IF expand = 140 THEN DO                                              00060099
     num_expansions = num_expansions + 1                                00060199
     DO gal = 1 TO galaxies                                             00060499
       IF universe.gal.Y > C THEN DO                                    00060599
         uni.gal.Y = uni.gal.Y + HUBBLE_CONST                           00060999
       END                                                              00061199
     END                                                                00061299
   END                                                                  00061399
  END                                                                   00061499
END                                                                     00061599
                                                                        00061699
DO P = 1 TO galaxies                                                    00069999
  DO pair = P + 1 TO galaxies                                           00070099
    distanceX = ABS(uni.P.X - uni.pair.X)                               00070399
    distanceY = ABS(uni.P.Y - uni.pair.Y)                               00070499
    distance = distanceX + distanceY                                    00070699
    answer = answer + distance                                          00070799
  END                                                                   00070999
END                                                                     00071099
                                                                        00071199
SAY "The answer:" answer                                                00071699
                                                                        00071799
/* bye */                                                               00071899
"FREE FI(INDD)"                                                         00072099
EXIT 0                                                                  00080001
