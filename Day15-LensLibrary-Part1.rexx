/* Rexx */                                                    
SAY "This solves Day 15 Part 1"                               
                                                              
/* read the file - it was transferred in ASCII */             
fname = "AOC1EB.DAY15AS"                                      
"ALLOC F(INDD) DA('"fname"') SHR"                             
"EXECIO * DISKR INDD (STEM INREC. FINIS"                      
                                                              
/* game rules */                                              
answer = 0                                                    
                                                              
/* read file and calculate stuffs */                          
rest = INREC.1                                                
DO UNTIL LENGTH(rest) = 0                                     
  PARSE VAR rest firstStr '2C'X rest                          
  hash = 0                                                    
  DO J = 1 TO LENGTH(firstStr)                                
    char = X2D(C2X(SUBSTR(firstStr,J,1)))                     
    hash = ((hash + char) * 17) // 256                        
  END                                                         
  answer = answer + hash                                      
END                                                           
                                                              
SAY "The answer:" answer                                      
                                                              
/* bye */                                                     
"FREE FI(INDD)"                                               
EXIT 0                                                        
