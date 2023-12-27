/* Rexx */                                                   
SAY "This solves Day 4 Part 1"                               
                                                             
/* read the file */                                          
fname = "AOC1EB.DAY4IN"                                      
"ALLOC F(INDD) DA('"fname"') SHR"                            
"EXECIO * DISKR INDD (STEM INREC. FINIS"                     
                                                             
/* game rules */                                             
answer = 0                                                   
                                                             
/* read file and calculate stuffs */                         
DO I = 1 TO INREC.0                                          
  line = INREC.I                                             
  gameResult = 0                                             
  firstHit   = 1                                             
  PARSE VAR line 5 cardGame ":" winning "|" cards            
  totalCards = WORDS(cards)                                  
  DO N = 1 TO totalCards                                     
    cardToCheck = WORD(cards,N)                              
    IF WORDPOS(cardToCheck,winning) > 0 THEN DO              
      IF firstHit = 1 THEN DO                                
        gameResult = 1                                       
        firstHit   = 0                                       
      END                                                    
      ELSE DO                                                
        gameResult = gameResult * 2                          
      END                                                    
    END                                                      
  END                                                        
  answer = answer + gameResult                               
END                                                          

SAY "The answer:" answer   
                           
/* bye */                  
"FREE FI(INDD)"            
EXIT 0                     
