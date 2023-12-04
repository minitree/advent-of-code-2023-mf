/* Rexx */                                        
SAY "This solves Day 1, Part 2"                   
                                                  
/* read the file */                               
fname = "AOC1EB.DAY1(INPUT1)"                     
"ALLOC F(INDD) DA('"fname"') SHR"                 
"EXECIO * DISKR INDD (STEM INREC. FINIS"          
                                                  
/* define a list of characters */                 
alpha   = "abcdefghijklmnopqrstuvwxyz"            
total   = 0                                       
                                                  
/* adding a spelled numbers stem for part two */  
numSpelled.1 = "one"                              
numSpelled.2 = "two"                              
numSpelled.3 = "three"                            
numSpelled.4 = "four"                             
numSpelled.5 = "five"                             
numSpelled.6 = "six"                              
numSpelled.7 = "seven"                            
numSpelled.8 = "eight"                            
numSpelled.9 = "nine"                             

/* read file and calculate stuffs */           
DO I = 1 TO INREC.0                            
  input = INREC.I                              
  loIndex = 2147483647                         
  hiIndex = 0                                  
  loNum = ""                                   
  hiNum = ""                                   
  DO J = 1 TO 9                                
    numIndex.J = POS(numSpelled.J,input)       
    IF numIndex.J <> 0 THEN DO                 
      IF numIndex.J < loIndex THEN DO          
        loIndex = numIndex.J                   
        loNum   = J                            
      END                                      
    END                                        
    numIndex.J = LASTPOS(numSpelled.J,input)   
    IF numIndex.J > hiIndex THEN DO            
      hiIndex = numIndex.J                     
      hiNum   = J                              
    END                                        
  END                                          
  outstring = INREC.I                          
  IF loIndex <> 2147483647 THEN                       
    outstring = OVERLAY(loNum,outstring,loIndex)      
  outstring = STRIP(TRANSLATE(outstring,'',alpha))    
  firstNum  = SUBSTR(outstring,1,1)                   
  IF hiIndex <> 0 THEN                                
    outstring = OVERLAY(hiNum,INREC.I,hiIndex)        
  outstring = STRIP(TRANSLATE(outstring,'',alpha))    
  lastNum   = SUBSTR(REVERSE(outstring),1,1)                      
                                                 
  sum = firstNum||lastNum                        
  total = total + sum                            
END                                              
                                                 
SAY "The answer:"                                
SAY total                                        
                                                 
/* bye */                                        
EXIT 0                                           
