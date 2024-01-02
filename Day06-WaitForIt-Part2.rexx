/* Rexx */                                                              
SAY "This solves Day 6 Part 2"                                          
                                                                        
/* read the file                                                        
fname = "AOC1EB.DAY6IN"                                                 
"ALLOC F(INDD) DA('"fname"') SHR"                                       
"EXECIO * DISKR INDD (STEM INREC. FINIS" */                             
                                                                        
/* read the file */                                                    
fname = "AOC1EB.DAY6IN"                                                
"ALLOC F(INDD) DA('"fname"') SHR"                                      
"EXECIO * DISKR INDD (STEM INREC. FINIS"                               
                                                                       
/* game rules */                                                       
line_t = INREC.1                                                       
line_d = INREC.2                                                       
PARSE VAR line_t timeTitle timer1 timer2 timer3 timer4                 
PARSE VAR line_d distTitle dist1 dist2 dist3 dist4                     
timers = STRIP(timer1)||STRIP(timer2)||STRIP(timer3)||STRIP(timer4)    
distances = STRIP(dist1)||STRIP(dist2)||STRIP(dist3)||STRIP(dist4)     
SAY timers distances                                                   
answer  = 0                                                            
timeIn   = STRIP(timers)                                               
distance = STRIP(distances)                                            
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
