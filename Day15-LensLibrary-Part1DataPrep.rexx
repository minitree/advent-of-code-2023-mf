/* Rexx */                                                            
SAY "This solves Day 15 Part 1"                                       
                                                                      
/* read the file - it was transferred in ASCII */                     
fname = "AOC1EB.DAY15AS"                                              
"ALLOC F(INDD) DA('"fname"') SHR"                                     
"EXECIO * DISKR INDD (STEM INREC. FINIS"                              
/* prep a file for part 2 */                                          
"ALLOC DA('AOC1EB.DAY15OT') F(DATAOUT) OLD"                           
                                                                      
/* game rules */                                                      
answer = 0                                                            
                                                                      
/* read file and calculate stuffs */                                  
rest = INREC.1                                                        
K = 0                                                                 
DO UNTIL LENGTH(rest) = 0                                             
  K = K + 1                                                           
  PARSE VAR rest firstStr '2C'X rest                                  
  hash = 0                                                            
  hashChar = 0                                                        
  DO J = 1 TO LENGTH(firstStr)                                        
    char = X2D(C2X(SUBSTR(firstStr,J,1)))                             
    hash = ((hash + char) * 17) // 256                                
  END                                                                 
  DO Ji = 1 TO LENGTH(firstStr)                                       
    IF SUBSTR(firstStr,Ji,1) = '2D'X ,                                
    |  SUBSTR(firstStr,Ji,1) = '3D'X THEN DO                          
      LEAVE                                                           
    END                                                               
    char1 = X2D(C2X(SUBSTR(firstStr,Ji,1)))                           
    hashChar = ((hashChar + char1) * 17) // 256                       
  END                                                                 
  LINEOUT.K = hashChar                           
  answer = answer + hash                         
END                                              
                                                 
/* out file structure          */                
/* label hash */                                 
"EXECIO * DISKW DATAOUT (STEM LINEOUT."          
SAY "The answer:" answer                         
                                                 
/* bye */                                        
"FREE FI(INDD)"                                  
EXIT 0                                           
