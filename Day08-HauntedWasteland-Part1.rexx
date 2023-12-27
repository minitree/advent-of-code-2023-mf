/* Rexx */                                                
SAY "This solves Day 8 Part 1"                            
                                                          
/* read the file */                                       
fname = "AOC1EB.DAY8IN"                                   
"ALLOC F(INDD) DA('"fname"') SHR"                         
"EXECIO * DISKR INDD (STEM INREC. FINIS"                  
                                                          
/* game rules */                                          
answer  = 0                                               
                                                          
instructions = STRIP(INREC.1)                             
instructionsTotal = LENGTH(instructions)                  
                                                          
/* read file and parse locations */                       
DO I = 3 TO INREC.0                                       
   PARSE VAR INREC.I key "= (" lefty ", " righty ")"      
   dirs = STRIP(lefty)||" "||STRIP(righty)                
   INTERPRET "coords."key"= dirs"                         
END                                                       
                                                          
nextCell = "AAA"                                          

DO UNTIL nextCell = "ZZZ"                                     
  DO J = 1 TO instructionsTotal                               
    direction = STRIP(SUBSTR(instructions,J,1))               
    IF direction == "L" THEN DO                               
      nextCell = STRIP(WORD(coords.nextCell,1))               
    END                                                       
    IF direction == "R" THEN DO                               
      nextCell = STRIP(WORD(coords.nextCell,2))               
    END                                                       
    answer = answer + 1                                       
    IF nextCell = "ZZZ" THEN DO                               
      LEAVE                                                   
    END                                                       
  END                                                         
END                                                           
                                                              
SAY "The answer:" answer                                      
                                                              
/* bye */                                                     
"FREE FI(INDD)"                                               
EXIT 0                                                        
