.equ RAMEND, 0x21ff
.equ SREG, 0x3f
.equ SPL, 0x3d
.equ SPH, 0x3e
.equ PORTC, 0x08
.equ DDRC, 0x07
.equ PINC, 0x06
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ PINB, 0x03

.org 0
	rjmp main
main:
   ldi r16, 0xFF
   out DDRC, r16
   sbi PORTB, 0
   sbi PORTB, 1
   sbi PORTB, 2
   sbi PORTB, 3
   ldi r18, 0x0F
   clr r17
   clr r20
   clr r21
   clr r22
   clr r23
   clr r24
   clr r25
   clr r26
   clr r27
   clr r28
   clr r29
   clr r30
   clr r31
   mov r16,r18
   mov r19,r18
   	
mainloop:
   mov r17,r16
   sbis PINB, 0
   rjmp KONT000
   sbis PINB, 1
   rjmp KONT010
   sbis PINB, 2
   rjmp KONT020
   sbis PINB, 3
   rjmp KONT030 
   out PORTC,r17
   cpi r19, 0x01
   brne mainloop
   call wait
   cpi r19,0x03
   brne mainloop
   call wait
   cpi r19, 0x07
   brne mainloop
   call wait
   call wait
   cpi r19, 0x0F
   brne mainloop
   call wait
   call wait
   cpi r19,0x1F
   brne mainloop
   call wait
   call wait
   call wait
   cpi r19, 0x3F
   brne mainloop
   call wait
   call wait
   call wait
   cpi r19,0x7F
   brne mainloop
   call wait
   call wait
   call wait
   call wait
   cpi r19,0xFF
   brne mainloop

   rjmp mainloop

KONT000:
   inc r24
   sbic PINB,0
   clr r24
   cpi r24,0x64
   breq KONT01
   rjmp KONT000

KONT001:
   inc r28
   sbis PINB,0
   clr r28
   cpi r28,0x64
   breq lArtir
   rjmp KONT001

lArtir:
   clr r24
   clr r28
   clr r18
   sec
   rol r16
   rjmp mainloop

KONT010:
   inc r25
   sbic PINB,1
   clr r25
   cpi r25,0x64
   breq KONT011
   rjmp KONT010

KONT011:
   inc r29
   sbis PINB,1
   clr r29
   cpi r29,0x64
   breq lAzalt
   rjmp KONT011

lAzalt:
   clr r25
   clr r29
   clr r18
   
   lsr r16
   rjmp mainloop

KONT020:
   inc r26
   sbic PINB, 2
   clr r26
   cpi r26, 0x64
   breq KONT021
   rjmp KONT020

KONT021:
   inc r30
   sbis PINB, 2 
   clr r30
   cpi r30, 0x64
   breq pArtir
   rjmp KONT021

pArtir:
   clr r18
   clr r26
   clr r30
   mov r18, r19
   inc r18
   or r19, r18
   rjmp mainloop

KONT030:
   inc r27
   sbic PINB, 3
   clr r27
   cpi r27, 0x64
   breq KONT031
   rjmp KONT030

KONT031:
   inc r31
   sbis PINB, 1
   clr r31
   cpi r31, 0x64
   breq pAzalt
   rjmp KONT031

pAzalt:
   clr r18
   clr r27
   clr r31
   lsr r19
   rjmp mainloop 
   

wait:
   push r17
   push r18
   ldi r17,0x40
   ldi r18,0x00 
_w0:
   dec r18	
   brne _w0		
   dec r17	
   brne _w0			
   pop r18		
   pop r17		
   ret			
.END
