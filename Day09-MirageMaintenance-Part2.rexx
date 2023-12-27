/* Rexx */                                                              
SAY "This solves Day 9 Part 2"                                          
NUMERIC DIGITS 31                                                       
                                                                        
/* read the file */                                                     
fname = "AOC1EB.DAY9IN"                                                 
"ALLOC F(INDD) DA('"fname"') SHR"                                       
"EXECIO * DISKR INDD (STEM INREC. FINIS"                                
                                                                        
/* game rules */                                                        
answer    = 0                                                           
numbers.  = 0                                                           
numbers.0 = INREC.0                                                     
                                                                        
/* INREC.0 = 1                                                          
INREC.1 = INREC.2 */                                                    
/* read file and build I.1 - input number lists */                      
DO I = 1 TO INREC.0                                                     
  lineLen = WORDS(INREC.I)                                              
  DO J = 1 TO lineLen                                                   
    numbers.I.1.J = WORD(INREC.I,J)                                     
  END                                                                   
  numbers.I.1.0 = lineLen                                               
END                                                                     
                                                                        
/* calculate one as an example */                                       
/* numbers.X */                                                         
DO X = 1 TO INREC.0                                                     
    toN = numbers.X.1.0 - 1                                             
    allZeros = 0                                                        
    Z = 2                                                               
    DO UNTIL allZeros = 1                                               
       printNumbers = ""                                                
       numZeros = 0                                                     
       DO N = 1 TO toN                                                  
         M = N + 1                                                      
         P = Z - 1                                                      
         numbers.X.Z. = "NONUM"                                         
         numbers.X.Z.N = numbers.X.P.M - numbers.X.P.N                  
         printNumbers = printNumbers  numbers.X.Z.N                     
         IF numbers.X.Z.N = 0 THEN numZeros = numZeros + 1              
         IF numZeros = toN THEN allZeros = 1                            
       END                                                              
       IF allZeros \= 1 THEN DO                                         
         toN = toN - 1                                                  
         Z = Z + 1                                                      
       END                                                              
    END                                                                 
    lastLevel = Z                                                       
    lastN     = toN                                                     
    toN = 1                                                             
    DO UNTIL Z = 0                                                      
      toNN = toN - 2                                                    
      nextZ = Z + 1                                                     
      numbers.X.Z.toNN = numbers.X.Z.toN - numbers.X.nextZ.toNN         
      Z = Z - 1                                                         
    END                                                                 
    answer = answer + (numbers.X.1.toNN)                                
END                                                                     
                                                                        
SAY "The answer:" answer                                                
                                                                        
/* bye */                                                               
"FREE FI(INDD)"                                                         
EXIT 0                                                                  
