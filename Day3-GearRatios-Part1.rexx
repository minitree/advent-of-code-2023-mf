/* Rexx */                                                  
SAY "This solves Day 3 Part 1"                              
                                                            
/* read the file */                                         
fname = "AOC1EB.DAY3INPT"                                   
"ALLOC F(INDD) DA('"fname"') SHR"                           
"EXECIO * DISKR INDD (STEM INREC. FINIS"                    
                                                            
/* game rules */                                            
grid.  = "."  /* 140 characters each */                     
numDigits = 0                                               
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
     IF grid.I.Jn \= "." & DATATYPE(grid.I.Jn) \= "NUM" THEN        
       good = 1                                                     
     /* right */                                                    
     Jn = J+1                                                       
     IF grid.I.Jn \= "." & DATATYPE(grid.I.Jn) \= "NUM" THEN        
       good = 1                                                     
     /* up */                                                       
     In = I-1                                                       
     IF grid.In.J \= "." & DATATYPE(grid.In.J) \= "NUM" THEN        
       good = 1                                                     
     /* down */                                                     
     In = I+1                                                       
     IF grid.In.J \= "." & DATATYPE(grid.In.J) \= "NUM" THEN        
       good = 1                                                     
     /* left up */                                                  
     Jn = J-1                                                       
     In = I-1                                                       
      IF grid.In.Jn \= "." & DATATYPE(grid.In.Jn) \= "NUM" THEN      
        good = 1                                                     
      /* right up */                                                 
      Jn = J+1                                                       
      In = I-1                                                       
      IF grid.In.Jn \= "." & DATATYPE(grid.In.Jn) \= "NUM" THEN      
        good = 1                                                     
      /* left down */                                                
      Jn = J-1                                                       
      In = I+1                                                       
      IF grid.In.Jn \= "." & DATATYPE(grid.In.Jn) \= "NUM" THEN      
        good = 1                                                     
      /* right down */                                               
      Jn = J+1                                                       
      In = I+1                                                       
      IF grid.In.Jn \= "." & DATATYPE(grid.In.Jn) \= "NUM" THEN      
        good = 1                                                     
      IF good = 1 THEN sumGood = sumGood + good                      
      IF numDigits = 0 & sumGood > 0 THEN DO                         
        answer = answer + currentDigit                               
      END                                                            
      good = 0                                                       
    END                                                              
  END                                                                
END                                                                  
                                                                     
SAY "The answer:" answer                                             
                                                                     
/* bye */                                                            
"FREE FI(INDD)"                                                      
EXIT 0                                                               
