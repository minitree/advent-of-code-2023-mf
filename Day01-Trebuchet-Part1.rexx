/* Rexx */                                      
SAY "This solves Day 1, Part 2"                 
                                                
/* read the file */                             
fname = "AOC1EB.DAY1(INPUT1)"                   
"ALLOC F(INDD) DA('"fname"') SHR"               
"EXECIO * DISKR INDD (STEM INREC. FINIS"        
                                                
/* define a list of characters */               
alpha   = "abcdefghijklmnopqrstuvwxyz"          
total   = 0                                     
                                                
/* read file and calculate stuffs */            
DO I = 1 TO INREC.0                             
  outstring = STRIP(TRANSLATE(INREC.I,'',alpha))
  firstNum  = SUBSTR(outstring,1,1)             
  lastNum   = SUBSTR(REVERSE(outstring),1,1)    
  sum = firstNum||lastNum                       
  total = total + sum                           
END                                             
                                                
SAY "The answer:" total                                                              
                                                
/* bye */          
"FREE FI(INDD)"
EXIT 0                                          
