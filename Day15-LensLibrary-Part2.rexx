/* Rexx */                                                           
SAY "This solves Day 15 Part 2"                                      
                                                                     
/* read the file - this time in EBCDIC */  
/* I also prepped the file with hashes - DAY15OT */
fname = "AOC1EB.DAY15IN"                                             
oname = "AOC1EB.DAY15OT"                                             
"ALLOC F(INDD)   DA('"fname"') SHR"                                  
"ALLOC F(INDDOT) DA('"oname"') SHR"                                  
"EXECIO * DISKR INDD (STEM INREC. FINIS"                             
"EXECIO * DISKR INDDOT (STEM INRECOT. FINIS"                         
                                                                     
/* game rules */                                                     
answer = 0                                                           
                                                                     
/* read file and calculate stuffs */                                 
rest = INREC.1                                                       
ind = 0                                                              
boxes. = " "                                                         
                                                  
DO UNTIL LENGTH(rest) = 0                                               
  ind = ind + 1                                                         
  charLabel = ""                                                        
  operation = ""                                                        
  power = ""                                                            
  powerin = "NO"                                                        
  PARSE VAR rest firstStr ',' rest                                      
  DO J = 1 TO LENGTH(firstStr)                                          
    char = SUBSTR(firstStr,J,1)                                         
    IF DATATYPE(char) = "NUM" THEN power = char                         
    IF char \= "=" & char \= "-" & DATATYPE(char) \= "NUM" ,            
      THEN charLabel = charLabel||char                                  
    IF char = "=" THEN DO                                               
      operation = "lens"                                                
      iii = INRECOT.ind                                                 
      INTERPRET "boxing = boxes."iii                                    
    IF WORDPOS(charLabel,boxing) = 0 THEN DO                            
assign = "boxes."iii" = boxes."iii" || charLabel || ' ' || power || ' '"
      powerin = "YES"                                                   
    END                                                                 
    ELSE DO                                                             
      iii = INRECOT.ind                                                 
      INTERPRET "boxing = boxes."iii                                    
      position = WORDPOS(charLabel,boxing)                              
      position2 = WORDINDEX(boxing,position)                            
      charLen  = LENGTH(charLabel)                                      
      nextPower = SUBSTR(firstStr,J+1,1)                                
      charLen2 = charLabel || " " || nextPower                          
      boxing = OVERLAY(charLen2,boxing,position2,charLen+2)             
      INTERPRET "boxes2."iii"=boxing"                                   
      INTERPRET "boxes."iii"=boxing"                                    
    END                                                                 
    END           
    IF char = "-" THEN DO                                               
      operation = "skip"                                                
      iii = INRECOT.ind                                                 
      INTERPRET "boxing = boxes."iii                                    
      IF WORDPOS(charLabel,boxing) \= 0 THEN DO                         
        position = WORDPOS(charLabel,boxing)                            
        position2 = WORDINDEX(boxing,position)                          
        charLen  = LENGTH(charLabel)                                    
        boxing = OVERLAY(" ",boxing,position2,charLen+2," ")            
        INTERPRET "boxes2."iii"=boxing"                                 
        INTERPRET "boxes."iii"=boxing"                                  
      END                                                               
    END                                                                 
  END                                                                   
  IF powerin = "YES" THEN INTERPRET assign                              
/*SAY INRECOT.ind charLabel operation power*/                           
END                                                                     
                                                                        
DO K = 0 TO 255                                                         
  wordNum = 0                                                           
  DO W = 1 TO WORDS(boxes.K)                                            
    addAns = 0                                                          
    IF DATATYPE(WORD(boxes.K,W)) \= "NUM" THEN DO                       
      wordNum = wordNum + 1                                             
      addAns = (K+1) * wordNum * WORD(boxes.K,W+1)                      
    END                                                                 
    answer = answer + addAns                                            
  END                                                                   
END                                                                     
                                                                        
SAY "The answer:" answer                                                
                                                                        
/* bye */                                                               
"FREE FI(INDD)"                                                         
EXIT 0                                                                  
