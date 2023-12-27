/* Rexx */                                                              
SAY "This solves Day 6 Part 2"                                          
                                                                        
/* read the file                                                        
fname = "AOC1EB.DAY6IN"                                                 
"ALLOC F(INDD) DA('"fname"') SHR"                                       
"EXECIO * DISKR INDD (STEM INREC. FINIS" */                             
                                                                        
/* game rules */                                                                                                             
answer  = 0                                                             
timeIn   = 59796575                                                     
distance = 597123410321328                                              
wait     = 0                                                            
timeRec  = 0                                                            
distRec  = 0                                                            
                                                                        
DO i = 1 to timeIn                                                      
  timeRec = timeIn - wait                                               
  speed = wait * 1                                                      
  distRec = speed * timeRec                                             
  IF distRec > distance THEN DO                                         
    answer = answer + 1                                                 
  END                                                                   
  IF timeIn // 1000000 = 0 THEN SAY timeIn                              
  wait = wait + 1                                                       
END                                                                     
                                                                        
SAY "The answer:" answer                                                
                                                                        
/* bye                                                                  
"FREE FI(INDD)" */                                                      
EXIT 0                                                                  
