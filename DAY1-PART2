/* Rexx */                                                
SAY "This solves Day 1, Part 2"                           
                                                          
/* read the file */                                       
fname = "AOC1EB.DAY1(INPUT1)"                             
ADDRESS TSO                                               
"ALLOC F(INDD) DA('"fname"') SHR"                         
"EXECIO * DISKR INDD (STEM INREC. FINIS"                  
                                                          
/* define a list of numbers */                            
numbers = "123456789"                                     
alpha   = "abcdefghijklmnopqrstuvwxyz"                    
total   = 0                                               
/* adding an index tracking stem for part two */          
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
  loIndex = 99999                                     
  hiIndex = 0                                         
  loStr = ""                                          
  hiStr = ""                                          
  loNum = ""                                          
  hiNum = ""                                          
  DO J = 1 TO 9                                       
    numIndex.J = POS(numSpelled.J,input)              
    IF numIndex.J <> 0 THEN DO                        
      IF numIndex.J < loIndex THEN DO                 
        loIndex = numIndex.J                          
        loStr   = numSpelled.J                        
        loNum   = J                                   
      END                                             
    END                                               
  END                                                 
  DO J = 1 TO 9                                       
    numIndex.J = LASTPOS(numSpelled.J,input)          
    IF numIndex.J > hiIndex THEN DO                   
      hiIndex = numIndex.J                            
      hiStr   = numSpelled.J                          
      hiNum   = J                                     
    END                                               
  END                                                 
  outstring = INREC.I                                 
  IF loIndex <> 99999 THEN                            
    outstring = OVERLAY(loNum,outstring,loIndex)      
  outstring = TRANSLATE(outstring,'',alpha)           
  outstring = STRIP(outstring)                        
  firstNum  = SUBSTR(outstring,1,1)                   
/* reset string */                               
  outstring = INREC.I                            
  IF hiIndex <> 0 THEN                           
    outstring = OVERLAY(hiNum,INREC.I,hiIndex)   
  outstring = TRANSLATE(outstring,'',alpha)      
  outstring = STRIP(outstring)                   
  outstring = REVERSE(outstring)                 
  lastNum   = SUBSTR(outstring,1,1)              
                                                 
  sum = firstNum||lastNum                        
  total = total + sum                            
END                                              
                                                 
SAY "The answer:"                                
SAY total                                        
                                                 
/* bye */                                        
EXIT 0                                           
