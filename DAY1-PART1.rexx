/* Rexx */                                        
SAY "This is the solution for day 1 part 1"       
                                                  
/* read the file */                               
fname = "AOC1EB.DAY1(INPUT1)"                     
ADDRESS TSO                                       
"ALLOC F(INDD) DA('"fname"') SHR"                 
"EXECIO * DISKR INDD (STEM INREC. FINIS"          
                                                  
/* define a list of numbers */                    
numbers = "1234567890"                            
alpha   = "abcdefghijklmnopqrstuvwxyz"            
total   = 0                                       
                                                  
/* read file and calculate stuffs */              
DO I = 1 TO INREC.0                               
/*SAY INREC.I*/                                   
  outstring = TRANSLATE(INREC.I,'',alpha)         
  outstring = STRIP(outstring)                    
  firstNum  = SUBSTR(outstring,1,1)               
  outstring = REVERSE(outstring)                  
  lastNum   = SUBSTR(outstring,1,1)               
  sum = firstNum||lastNum                         
  total = total + sum                             
END                                               
                                                  
SAY "The answer:"                                 
SAY total                                         
                                                  
/* bye */                                         
EXIT 0                                            
