/* Rexx */                                                              
SAY "This solves Day 11 Part 2"                                         
NUMERIC DIGITS 15                                                       
                                                                        
/* read the file */                                                     
fname = "AOC1EB.DAY11IN"                                                
"ALLOC F(INDD) DA('"fname"') SHR"                                       
"EXECIO * DISKR INDD (STEM INREC. FINIS"                                
                                                                        
/* game rules */                                                        
answer = 0                                                              
                                                                        
/* read file and calculate stuffs */                                    
galaxies  = 0                                                           
universe. = "+"                                                         
uni.      = "+"                                                         
inputLines = INREC.0                                                    
inputCols  = LENGTH(INREC.1)                                            
HUBBLE_CONST = 999999                                                   
                                                                        
DO I = 1 TO inputLines                                                  
  DO J = 1 TO inputCols                                                 
    cell = SUBSTR(INREC.I,J,1)                                          
    IF cell = "#" THEN DO                                               
      galaxies = galaxies + 1                                           
      universe.galaxies.X = I                                           
      uni.galaxies.X = I                                                
      universe.galaxies.Y = J                                           
      uni.galaxies.Y = J                                                
    END                                                                 
  END                                                                   
END                                                                     
                                                                        
/* recalc row expansioned galaxy location */                            
num_expansions = 0                                                      
DO I = 1 TO inputLines                                                  
  expand = 0                                                            
  DO G = 1 TO inputCols                                                 
    cell = SUBSTR(INREC.I,G,1)                                          
    IF cell = "." THEN expand = expand + 1                              
    IF expand = LENGTH(INREC.I) THEN DO                                 
      num_expansions = num_expansions + 1                               
      DO gal = 1 TO galaxies                                            
        IF universe.gal.X > I THEN DO                                   
          uni.gal.X = uni.gal.X + HUBBLE_CONST                          
        END                                                             
      END                                                               
    END                                                                 
  END                                                                   
END                                                                     
                                                                        
/* recalc column expansioned galaxy location */                         
num_expansions = 0                                                      
DO C = 1 TO inputCols                                                   
  expand = 0                                                            
  DO L = 1 TO inputLines                                                
   cell = SUBSTR(INREC.L,C,1)                                           
   IF cell = "." THEN expand = expand + 1                               
   IF expand = 140 THEN DO                                              
     num_expansions = num_expansions + 1                                
     DO gal = 1 TO galaxies                                             
       IF universe.gal.Y > C THEN DO                                    
         uni.gal.Y = uni.gal.Y + HUBBLE_CONST                           
       END                                                              
     END                                                                
   END                                                                  
  END                                                                   
END                                                                     
                                                                        
DO P = 1 TO galaxies                                                    
  DO pair = P + 1 TO galaxies                                           
    distanceX = ABS(uni.P.X - uni.pair.X)                               
    distanceY = ABS(uni.P.Y - uni.pair.Y)                               
    distance = distanceX + distanceY                                    
    answer = answer + distance                                          
  END                                                                   
END                                                                     
                                                                        
SAY "The answer:" answer                                                
                                                                        
/* bye */                                                               
"FREE FI(INDD)"                                                         
EXIT 0                                                                  
