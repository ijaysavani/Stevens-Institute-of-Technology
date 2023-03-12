*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:              ;The program starts from here
    lea   filename,   a1  

    move   #51,  D0 
    trap   #15

    move.l #filesize, d2  ;Gets the size of the file
    lea    buffer,    a1  ;Buffer used to store the data
    move   #53,       d0
    trap   #15

    SIMHALT
    
    ORG    $2000
    
FILENAME   dc.b       'file.txt', 0 ;The file name
BUFFER     ds.b       80
FILESIZE   dc.b       80

    END    START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
