/* Rexx */                                         
SAY "This solves Day 3 Part 2"                     
                                                   
/* read the file */                                
fname = "AOC1EB.DAY3INPT"                          
"ALLOC F(INDD) DA('"fname"') SHR"                  
"EXECIO * DISKR INDD (STEM INREC. FINIS"           
                                                   
/* game rules */                                   
grid.  = "."  /* 140 characters each */            
numDigits = 0                                      
allGearLocs = ""                                   
gearNumbers. = "NUMBERS"                           
answer = 0                                         
                                                   
/* read file and calculate stuffs */               
DO I = 1 TO INREC.0                                
  line   = INREC.I                                 
  lineLength = LENGTH(INREC.I)                     
  DO J = 1 TO lineLength                           
    character = SUBSTR(line,J,1)                   
    grid.I.J  = character                          
  END                                              
END                                                
DO I = 1 TO INREC.0                                           
  DO J = 1 TO lineLength                                      
    /* determine which number we are checking now */          
    IF DATATYPE(grid.I.J) = "NUM" & numDigits <= 0 THEN DO    
      gearLocs   = ""                                         
      firstDigit = ""                                         
      secondDigit = ""                                        
      thirdDigit = ""                                         
      numDigits  = 0                                          
      firstDigit = grid.I.J                                   
      numDigits  = numDigits + 1                              
      next = J+1                                              
      IF DATATYPE(grid.I.next) = "NUM" THEN DO                
        secondDigit = grid.I.next                             
        numDigits = numDigits + 1                             
        next = J+2                                            
        IF DATATYPE(grid.I.next) = "NUM" THEN DO              
          thirdDigit = grid.I.next                            
          numDigits = numDigits + 1                           
        END                                                   
      END                                                     
    currentDigit = firstDigit||secondDigit||thirdDigit                             
   good    = 0                                              
   sumGood = 0                                              
   END                                                      
   /* check surroundings */                                 
   IF DATATYPE(grid.I.J) = "NUM" & numDigits > 0 THEN DO    
     numDigits = numDigits - 1                              
     /* left */                                             
     Jn = J-1                                               
     IF grid.I.Jn = "*" THEN DO                             
       good = 1                                             
       loc = I||";"||Jn                                     
       IF WORDPOS(loc,gearLocs) = 0 THEN                    
         gearLocs = gearLocs||" "loc                                    
     END                                                    
     /* right */                                            
     Jn = J+1                                               
     IF grid.I.Jn = "*" THEN DO                             
       good = 1                                             
       loc = I||";"||Jn                                     
       IF WORDPOS(loc,gearLocs) = 0 THEN                    
         gearLocs = gearLocs||" "loc                        
     END                                                    
     /* up */                                               
     In = I-1                                               
     IF grid.In.J = "*" THEN DO                             
       good = 1                                             
       loc = In||";"||J                                     
       IF WORDPOS(loc,gearLocs) = 0 THEN                    
         gearLocs = gearLocs||" "loc                        
     END                          
      /* down */                                     
      In = I+1                                       
      IF grid.In.J = "*" THEN DO                     
        good = 1                                     
        loc = In||";"||J                             
        IF WORDPOS(loc,gearLocs) = 0 THEN            
          gearLocs = gearLocs||" "loc                
      END                                            
      /* left up */                                  
      Jn = J-1                                       
      In = I-1                                       
      IF grid.In.Jn = "*" THEN DO                    
        good = 1                                     
        loc = In||";"||Jn                            
        IF WORDPOS(loc,gearLocs) = 0 THEN            
          gearLocs = gearLocs||" "loc                
      END                                            
      /* right up */                                 
      Jn = J+1                                       
      In = I-1                                       
      IF grid.In.Jn = "*" THEN DO                    
        good = 1                                     
        loc = In||";"||Jn                            
        IF WORDPOS(loc,gearLocs) = 0 THEN            
          gearLocs = gearLocs||" "In||";"||Jn        
      END                                            
      /* left down */                                    
      Jn = J-1                                           
      In = I+1                                           
      IF grid.In.Jn = "*" THEN DO                        
        good = 1                                         
        loc = In||";"||Jn                                
        IF WORDPOS(loc,gearLocs) = 0 THEN                
          gearLocs = gearLocs||" "In||";"||Jn            
      END                                                
      /* right down */                                   
      Jn = J+1                                           
      In = I+1                                           
      IF grid.In.Jn = "*" THEN DO                        
        good = 1                                         
        loc = In||";"||Jn                                
        IF WORDPOS(loc,gearLocs) = 0 THEN                
          gearLocs = gearLocs||" "In||";"||Jn            
      END                                                          
      IF good = 1 THEN sumGood = sumGood + good          
      IF numDigits = 0 & sumGood > 0 THEN DO             
        IF WORDPOS(gearLocs,allGearLocs) > 0 THEN DO     
          fetchedPair = gearNumbers.gearLocs             
          product = fetchedPair * currentDigit           
          answer = answer + product                      
        END                                                             
        gearNumbers.gearLocs = currentDigit              
        allGearLocs = allGearLocs||" "||gearLocs         
        gearLocs = ""                                    
      END                                                
      good = 0                                           
    END                                                      
  END                         
END                           
                              
SAY "The answer:" answer      
                              
/* bye */                     
"FREE FI(INDD)"               
EXIT 0                        
