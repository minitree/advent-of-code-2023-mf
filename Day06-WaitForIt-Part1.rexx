/* Rexx */                                                         
SAY "This solves Day 6 Part 1"                                     
                                                                   
/* read the file */                                                
fname = "AOC1EB.DAY6IN"                                            
"ALLOC F(INDD) DA('"fname"') SHR"                                  
"EXECIO * DISKR INDD (STEM INREC. FINIS"                           
                                                                   
/* game rules */                                                   
answer  = 1                                                        
                                                                   
line_t = INREC.1                                                   
line_d = INREC.2                                                   
PARSE VAR line_t timeTitle timer1 timer2 timer3 timer4             
PARSE VAR line_d distTitle dist1 dist2 dist3 dist4                 
                                                                   
DO Xe = 1 TO 4                                                     
  INTERPRET 'timeIn = timer'Xe                                     
  timeIn = STRIP(timeIn)                                           
  INTERPRET 'distance = dist'Xe                                    
  distance = STRIP(distance)                                       
  ans_step = 0                                                     
  wait     = 0                                                     
  timeRec  = 0                                                     
  distRec  = 0                                                     
  DO i = 1 TO timeIn                                               
    timeRec = timeIn - wait                                        
    speed = wait * 1                                               
    distRec = speed * timeRec                                      
    IF distRec > distance THEN ans_step = ans_step + 1             
    wait = wait + 1                                                
  END                                                              
  answer = answer * ans_step                                       
END                                                                

SAY "The answer:" answer        
                                
/* bye                          
"FREE FI(INDD)" */              
EXIT 0                          
