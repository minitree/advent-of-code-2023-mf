/* Rexx */                                                              
SAY "This solves Day 2 Part 1"                                          
                                                                        
/* read the file */                                                     
fname = "AOC1EB.DAY2IN"                                                 
"ALLOC F(INDD) DA('"fname"') SHR"                                       
"EXECIO * DISKR INDD (STEM INREC. FINIS"                                
                                                                        
/* game rules */                                                        
r = 'red'                                                               
g = 'green'                                                             
b = 'blue'                                                             
BALLS.r = 12                                                           
BALLS.g = 13                                                            
BALLS.b = 14                                                            
answer = 0                                                              
                                                                        
/* read file and calculate stuffs */                                    
DO I = 1 TO INREC.0                                                     
  line = INREC.I                                                        
  gamePass = 1                                                          
  PARSE VAR line 5 gameNum ":" rest                                     
  /* 6 max games assumption */                                         
  PARSE VAR rest game.1 ";" game.2 ";" game.3 ";" game.4 ";" ,          
            game.5 ";" game.6                                           
  DO X = 1 TO 6                                                         
    cleanIn = TRANSLATE(game.X,"",",")                                 
    DO Y = 1 TO WORDS(cleanIn)                                          
      word = WORD(cleanIn,Y)                                           
      IF DATATYPE(word) = "NUM" THEN DO                                 
        nextWord = WORD(cleanIn,Y+1)                                    
        valueStem = BALLS.nextWord                                    
        IF word > valueStem THEN DO                                    
          gamePass = 0                                                
        END                                                          
      END                                                             
    END                                                                
  END                                                                
  IF gamePass = 1 THEN answer = answer + gameNum                       
END                                                                  
                                                                      
SAY "The answer:" answer                                              
                                                                     
/* bye */                                                             
"FREE FI(INDD)"                                                       
EXIT 0                                                                 
