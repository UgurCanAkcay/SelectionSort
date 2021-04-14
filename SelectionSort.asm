;SELECTION SORT ASSEMBLY Code
org 100h         


MOV BX,0200H     ;sayilarin yerlestirilmesi
MOV BYTE PTR [bx],55h
MOV BYTE PTR [bx+1],66H
MOV BYTE PTR [bx+2],54H
MOV BYTE PTR [bx+3],11H
MOV BYTE PTR [bx+4],87H
MOV BYTE PTR [bx+5],33H
MOV BYTE PTR [bx+6],75H
MOV BYTE PTR [bx+7],05H
MOV BYTE PTR [bx+8],5FH
MOV BYTE PTR [bx+9],23H

MOV BX,0200H    ; sayilarin baslangic adresi
MOV DI,0        ; 
MOV SI,0        ;


@OUTER_LOOP:   ; dongunun dis katmani
MOV DL,[BX+DI] ; DL=[BX+DI] en kucu sayi
INC SI         ; set SI=SI+1

@INNER_LOOP:   ; dongunun ic katmani tekrarla
MOV AL,[BX+SI] ; 
CMP AL,DL      ; sorgulama
JB @SKIP       ; @SKIP komutuna gider
INC SI         ; deger arttirma
CMP SI,09      ; kontrol
JBE INNER_LOOP ; EGER BX!=0 ise @INNER_LOOP a atla
         
INC DI         ; 
CMP DI,09      ; kontrol
JB OUTER_LOOP  ; ele alınan sayı daha küçük değilse
HLT            ; bitir

@SKIP:
MOV CL,AL ; saklama
MOV AL,DL ; AL = DL en küçük sayinin indisi kopyalanir
MOV DL,CL ; DL = AL en kucuk sayi kopyalanir

MOV CL ,[BX+SI]         ; saklama
MOV BYTE PTR [BX+SI],AL ; yeni en küçük sayinin indisi kopyalanir
MOV BYTE PTR [BX+DI],CL ; yeni en kucuk sayi kopyalanir

INC SI          ;  SI degerini 1 arttirir    
CMP SI,09       ;  
JBE INNER_LOOP  ; Ic dongu tekrar
JA OUTER_LOOP   ; Dis dongu tekrar

HLT ;programı sonlandırır.
