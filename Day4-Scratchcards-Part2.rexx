/* Rexx */                                                 
SAY "This solves Day 4 Part 1"                             
                                                           
/* read the file */                                        
fname = "AOC1EB.DAY4IN"                                    
"ALLOC F(INDD) DA('"fname"') SHR"                          
"EXECIO * DISKR INDD (STEM INREC. FINIS"                   
                                                           
/* game rules */                                           
answer = 0                                                 
                                                           
/* init card stems */                                      
DO X = 1 TO INREC.0                                        
  totalWonCards.X = 0                                      
END                                                        
                                                           
/* read file and calculate stuffs */                       
DO I = 1 TO INREC.0                                        
  line = INREC.I                                           
  lineNum = totalWonCards.I + 1                            
  gameResult = 0                                           
  PARSE VAR line 5 cardGame ":" winning "|" cards          
  totalCards = WORDS(cards)                                
  DO N = 1 TO totalCards                                   
    cardToCheck = WORD(cards,N)                            
    IF WORDPOS(cardToCheck,winning) > 0 THEN DO            
      gameResult = gameResult + 1                          
    END                                                    
  END                                                      
  DO L = 1 TO lineNum                                         
    DO K = 1 TO gameResult                                    
      indexGame = cardGame + K                                
      totalWonCards.indexGame = totalWonCards.indexGame + 1   
    END                                                       
  END                                                         
  answer = answer + lineNum                                   
END                                                           
                                                              
SAY "The answer:" answer                                      
                                                              
/* bye */                                                     
"FREE FI(INDD)"                                               
EXIT 0                                                        
