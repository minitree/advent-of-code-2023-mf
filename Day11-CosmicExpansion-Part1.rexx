/* Rexx */                                                              
SAY "This solves Day 11 Part 1"                                         
NUMERIC DIGITS 31                                                       
                                                                        
/* read the file */                                                     
fname = "AOC1EB.DAY11IN"                                                
"ALLOC F(INDD) DA('"fname"') SHR"                                       
"EXECIO * DISKR INDD (STEM INREC. FINIS"                                
                                                                        
/* game rules */                                                        
answer = 0                                                              
                                                                        
/* read file and calculate stuffs */                                    
galaxies  = 0                                                           
universe. = "+"                                                         
exp = 0                                                                 
inputLines = INREC.0                                                    
inputCols  = LENGTH(INREC.1)                                            
                                                                        
DO I = 1 TO INREC.0                                                     
  expand = 0                                                            
  Ie = I + exp                                                          
  DO G = 1 TO LENGTH(INREC.I)                                           
    cell = SUBSTR(INREC.I,G,1)                                          
    universe.Ie.G = cell                                                
    IF cell = "#" THEN DO                                               
      galaxies = galaxies + 1                                           
      locsgal.galaxies = I"+++"G                                        
    END                                                                 
    IF cell = "." THEN expand = expand + 1                              
    IF expand = LENGTH(INREC.I) THEN DO                                 
     DO expo = 1 TO 1                                                   
      inputLines = inputLines + 1                                       
      exp = exp + 1                                                     
      Ie = Ie + 1                                                       
      DO Ge = 1 TO LENGTH(INREC.I)                                      
        universe.Ie.Ge = "."                                            
      END                                                               
     END                                                                
    END                                                                 
  END                                                                   
END                                                                     
                                                                        
/* columns 140 */                                                       
/* lines   151 */                                                       
/* expand columns */                                                    
exp = 0                                                                 
universeEx. = "."                                                       
DO C = 1 TO 140                                                         
  expand = 0                                                            
  Ce = C + exp                                                          
  DO L = 1 TO inputLines                                                
   cell = universe.L.C                                                  
   universeEx.L.Ce = cell                                               
   IF cell = "." THEN expand = expand + 1                               
   IF expand = inputLines THEN DO                                       
    DO EXPO = 1 TO 1                                                    
     inputCols = inputCols + 1                                          
     exp = exp + 1                                                      
     Ce = Ce + 1                                                        
     DO Le = 1 TO inputLines                                            
       universeEx.Le.Ce = "."                                           
     END                                                                
    END                                                                 
   END                                                                  
  END                                                                   
END                                                                     
                                                                        
galaxies   = 0                                                          
locations. = ""                                                         
DO inL = 1 TO inputLines                                                
  line = ""                                                             
  DO inC = 1 TO inputCols                                               
    IF universeEx.inL.inC = "#" THEN DO                                 
      galaxies = galaxies + 1                                           
      universeEx.inL.inC = galaxies                                     
      locations.galaxies = inL" "inC                                    
    END                                                                 
    line = line||universeEx.inL.inC                                     
  END                                                                   
END                                                                     
                                                                        
/* create pairs of galaxies */                                          
galapairs. = ""                                                         
numIndices = 0                                                          
DO P = 1 TO galaxies                                                    
  DO pair = P + 1 TO galaxies                                           
    distanceX = ABS(WORD(locations.P,1) - WORD(locations.pair,1))       
    distanceY = ABS(WORD(locations.P,2) - WORD(locations.pair,2))       
    distance = distanceX + distanceY                                    
    answer = answer + distance                                          
    galapairs.P.pair = "DISTANCE"                                       
    numIndices = numIndices + 1                                         
  END                                                                   
END                                                                     
                                                                        
SAY "The answer:" answer                                                
                                                                        
/* bye */                                                               
"FREE FI(INDD)"                                                         
EXIT 0                                                                  
