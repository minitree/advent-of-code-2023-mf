/* Rexx */                                                              00010000
SAY "This solves Day 11 Part 1"                                         00020091
NUMERIC DIGITS 31                                                       00020199
                                                                        00021001
/* read the file */                                                     00030001
fname = "AOC1EB.DAY11IN"                                                00040091
"ALLOC F(INDD) DA('"fname"') SHR"                                       00042003
"EXECIO * DISKR INDD (STEM INREC. FINIS"                                00050030
/*                                                                      00050199
thing.foo = "hello"                                                     00050299
b = "FOO"                                                               00050399
SAY thing.b       /* it says "hello" */            hello                00050499
foo = "newVal"                                    THING.newVal          00050599
SAY thing.foo     /* it says THING.newVal */       THING.NEWVAL         00050699
SAY thing.newVal  /* it says THING.NEWVAL */       THING.hi             00050799
newVal = "hi"                                      hi                   00050899
SAY thing.newVal  /* it says "THING.hi"   */       yo                   00050999
thing.newVal = "yo"                                                     00051099
SAY newVal        /* it says "hi"         */                            00051199
SAY thing.newVal  /* it says "yo"         */                            00051299
EXIT 0                                                                  00051399
*/                                                                      00051599
/* game rules */                                                        00051662
answer = 0                                                              00051784
SAY "lines" INREC.0                                                     00051892
SAY "length" LENGTH(INREC.1)                                            00051992
                                                                        00052003
/* read file and calculate stuffs */                                    00052122
galaxies  = 0                                                           00052296
universe. = "+"                                                         00052399
exp = 0                                                                 00052498
inputLines = INREC.0                                                    00052599
inputCols  = LENGTH(INREC.1)                                            00052699
                                                                        00052795
DO I = 1 TO INREC.0                                                     00052830
  expand = 0                                                            00052996
  Ie = I + exp                                                          00053099
/*SAY "Ie in loop" Ie*/                                                 00053199
  DO G = 1 TO LENGTH(INREC.I)                                           00053293
    cell = SUBSTR(INREC.I,G,1)                                          00053393
    universe.Ie.G = cell                                                00053499
    IF cell = "#" THEN DO                                               00053599
      galaxies = galaxies + 1                                           00053699
      locsgal.galaxies = I"+++"G                                        00053799
    END                                                                 00053899
    IF cell = "." THEN expand = expand + 1                              00053996
    IF expand = LENGTH(INREC.I) THEN DO                                 00054097
   /* SAY "horizontal expand" /* 11 */ */                               00054199
     DO expo = 1 TO 1                                                   00054299
      inputLines = inputLines + 1                                       00054399
      exp = exp + 1                                                     00054497
      Ie = Ie + 1                                                       00054599
   /* SAY "Ie in expansion" Ie */                                       00054699
      DO Ge = 1 TO LENGTH(INREC.I)                                      00054799
        universe.Ie.Ge = "."                                            00054899
      END                                                               00054999
     END                                                                00055099
    END                                                                 00055197
  END                                                                   00055293
/*SAY "line" Ie universe.Ie.4*/                                         00055399
END                                                                     00055552
                                                                        00055699
/* columns 140 */                                                       00055799
/* lines   151 */                                                       00055899
/* expand columns */                                                    00055999
exp = 0                                                                 00056099
universeEx. = "."                                                       00056199
DO C = 1 TO 140                                                         00056399
  expand = 0                                                            00056499
  Ce = C + exp                                                          00056599
  DO L = 1 TO inputLines                                                00056799
   cell = universe.L.C                                                  00056999
   universeEx.L.Ce = cell                                               00057099
   IF cell = "." THEN expand = expand + 1                               00057299
   IF expand = inputLines THEN DO                                       00057399
    DO EXPO = 1 TO 1                                                    00057499
     inputCols = inputCols + 1                                          00057699
     exp = exp + 1                                                      00057799
     Ce = Ce + 1                                                        00057899
     DO Le = 1 TO inputLines                                            00058099
       universeEx.Le.Ce = "."                                           00058199
     END                                                                00058299
    END                                                                 00058399
   END                                                                  00058499
  END                                                                   00058599
END                                                                     00058699
                                                                        00058794
/*SAY "galaxies" galaxies                                               00058899
SAY "random cell" universeEx.139.146                                    00058999
SAY "input lines after expansion" inputLines                            00059099
SAY "input cols after expansion" inputCols                              00059199
SAY universeEx.1.1                                                      00059299
SAY universeEx.2.2*/                                                    00059399
                                                                        00059499
galaxies   = 0                                                          00059599
locations. = ""                                                         00059699
DO inL = 1 TO inputLines                                                00059799
  line = ""                                                             00059899
  DO inC = 1 TO inputCols                                               00059999
    IF universeEx.inL.inC = "#" THEN DO                                 00060099
      galaxies = galaxies + 1                                           00060199
      universeEx.inL.inC = galaxies                                     00060299
      locations.galaxies = inL" "inC                                    00060399
    END                                                                 00060499
    line = line||universeEx.inL.inC                                     00060599
  END                                                                   00060699
/*SAY line*/                                                            00060799
END                                                                     00060899
/* create pairs of galaxies */                                          00060999
galapairs. = ""                                                         00061099
numIndices = 0                                                          00061199
DO P = 1 TO galaxies                                                    00061299
  DO pair = P + 1 TO galaxies                                           00061399
    distanceX = ABS(WORD(locations.P,1) - WORD(locations.pair,1))       00061699
    distanceY = ABS(WORD(locations.P,2) - WORD(locations.pair,2))       00061799
    distance = distanceX + distanceY                                    00061899
    answer = answer + distance                                          00062099
    galapairs.P.pair = "DISTANCE"                                       00062199
    numIndices = numIndices + 1                                         00062299
  END                                                                   00062399
END                                                                     00062499
                                                                        00062599
SAY numIndices                                                          00062699
SAY galapairs.1.2                                                       00062799
SAY locsgal.1                                                           00062899
                                                                        00062999
SAY "The answer:" answer                                                00063099
                                                                        00063199
/* bye */                                                               00063299
"FREE FI(INDD)"                                                         00064099
EXIT 0                                                                  00070001
