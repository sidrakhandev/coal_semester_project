;This is a ICE-CREAM PARLOR management system
INCLUDE Irvine32.Inc
buffersize = 5000   ;for reading the files
.data
filename1 byte "mainMENUE.txt",0   ;file for the main menu
filename2 byte "ICE_CREAMmenu.txt",0  ;file for showing the flavors of ice cream
filename3 byte "SHAKESmenu.txt",0   ;file for showing the flavors of shakes
filename4 byte "SOFTdrinksMENUE.txt",0  ;file for showing the flavors of soft drinks
filehandle dword ?
buffer byte buffersize dup(?)
str1       byte"                                                   **********************************",0ah,0dh
           byte"                                                   **********************************",0ah,0dh
           byte"                                                   WELCOME TO OUR ICE CREAM PARLOR!!",0ah,0dh
	       byte"                                                   WHAT YOU WILL LIKE TO ORDER?",0ah,0dh
	       byte"                                                   **********************************",0ah,0dh
	       byte"                                                   **********************************",0ah,0dh,0
str2 byte"     Enter choice: ",0     ;string for asking the choice
str3 byte"     Enter Quantity:",0   ;string for asking number of items to order
str4 byte"     Total Bill:",0     
str5 byte"Invalid Input!",0ah,0dh,0
str6 byte"     Tax included = 18%",0ah,0dh
      byte"     After including tax Total Bill:",0
str7 byte"     Enter 1:To Continue!!",0ah,0dh
      byte"     Enter 2:To Exit!!",0ah,0dh,0
str8 byte"     Your Order will be recieved in 10 minutes!! Thanks!!:",0ah,0dh,0
arr1 dword 100,100,150,100   ;prices for ice-creams flavors
arr2 dword 150,150,150,200,150   ;prices for shakes flavors
arr3 dword 50,50,50,50,50    ;prices for the soft drinks
str9 byte"     ************************",0ah,0dh
     byte"     Enter 1:ICE CREAM:      ",0ah,0dh
     byte"     Enter 2:SHAKE:          ",0ah,0dh
     byte"     Enter 3:SOFT DRINKS:    ",0ah,0dh
     byte"     ************************",0ah,0dh,0

bill dword 0   
tax  dword 18  ;18% tax to include in the total bill
percent dword 100

.code
main proc

mov edx,offset str1
call writestring    ;welcoming string

 mov edx,offset filename1    
call openinputfile       ;opening the main menu file
mov filehandle , eax
mov eax,filehandle
mov edx , offset buffer
mov ecx,buffersize
call readfromfile
mov edx,offset buffer
call writestring    ;printing the main menu from the file
main_menu:
      call readint   ;taking the choice
	  cmp eax,1
	  je next2    ;jumping to required label 
	     cmp eax,2
             je next3
		 cmp eax,3
		     je next4
         mov edx,offset str5                    
	     call writestring ;in case of invalid input program will exit
		     jmp quit
next2:
     call ICE_CREAM  ;calling the ice cream preocedure to take the order
	 jmp status     ;asking to continue or to quit
next3:
     call SHAKES
	 jmp status
next4:
     call SOFTDRINKS
	 
status:
     mov edx,offset str7                  ;for Exit or Continue        
	 call writestring
	 mov edx,offset str2          ;asking for choice          
	 call writestring
	 call readint
	 cmp eax,1
	 je stay     ;in case of continue jumping to main menu
	 cmp eax,2
	 jmp last    ;in case of exit jumping the label last to calculate the bill
	 stay:
	 call crlf
	 mov edx,offset str9
	 call writestring
	 mov edx,offset str2
	 call writestring
	 jmp main_menu
last:
     call crlf
     mov edx,offset str4                  ;To Print Bill     
	 call writestring
	 mov eax,bill
	 call writeint
	 call crlf
	 mul tax
	 div percent
	 add eax,bill     ;adding the tax
	 mov edx,offset str6  ; telling that 18% tax is included
	 call writestring
	 call writeint
	 call crlf
	 mov edx,offset str8                   
	 call writestring      
quit:
 call readint
 invoke ExitProcess,0
main endp

ICE_CREAM proc
     call clrscr
mov edx,offset filename2
call openinputfile    ;opening the file that shows the flavors of ice creams
mov filehandle , eax
mov eax,filehandle
mov edx , offset buffer
mov ecx,buffersize
call readfromfile
mov edx,offset buffer
call writestring  
     call readint
	 cmp eax,1
	 je next6
	     cmp eax,2
		     je next7
         cmp eax,3
		     je next8
		 cmp eax,4
		     je next9
		 cmp eax,5
		     je next10
          mov edx,offset str5                   
	      call writestring 
		  jmp last
next6:
  mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr1]
	 L1:
	   add bill,ebx
	   loop L1
	   jmp last   
	 
next7:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr1+4]
	 L2:
	   add bill,ebx
	   loop L2
	   jmp last   
next8:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr1+8]
	 L3:
	   add bill,ebx
	   loop L3
	   jmp last   
next9:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr1+12]
	 L4:
	   add bill,ebx
	   loop L4 
next10:	  
last:
ret	          
ICE_CREAM endp
    

SHAKES proc
     call clrscr
mov edx,offset filename3
call openinputfile
mov filehandle , eax
mov eax,filehandle
mov edx , offset buffer
mov ecx,buffersize
call readfromfile
mov edx,offset buffer
call writestring
     call readint
	     cmp eax,1
	     je next11
	     cmp eax,2
		     je next12
         cmp eax,3
		     je next13
		 cmp eax,4
		     je next14
		 cmp eax,5
		     je next15
         cmp eax,6
		     je next10
          mov edx,offset str5                   
	      call writestring 
		  jmp last
next11:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr2]
	 L5:
	   add bill,ebx
	   loop L5
	   jmp last   
next12:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr2+4]
	 L6:
	   add bill,ebx
	   loop L6
	   jmp last   
next13:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr2+8]
	 L7:
	   add bill,ebx
	   loop L7
	   jmp last   
next14:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr2+12]
	 L8:
	   add bill,ebx
	   loop L8
	   jmp last   
next15:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr2+16]
	 L9:
	   add bill,ebx
	   loop L9
	   jmp last   
next10:
last:
ret	          
  SHAKES endp
 
 
SOFTDRINKS proc
     call clrscr
    mov edx,offset filename4
call openinputfile
mov filehandle , eax
mov eax,filehandle
mov edx , offset buffer
mov ecx,buffersize
call readfromfile
mov edx,offset buffer
call writestring
     call readint
	     cmp eax,1
	     je next16
	     cmp eax,2
		     je next17
         cmp eax,3
		     je next18
		 cmp eax,4
		     je next19
		 cmp eax,5
		     je next20
         cmp eax,6
		     je next10
          mov edx,offset str5                   
	      call writestring 
		  jmp last
next16:
     mov edx,offset str3                 
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr3]
	 L10:
	   add bill,ebx
	   loop L10
	   jmp last   
next17:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr3+4]
	 L11:
	   add bill,ebx
	   loop L11
	   jmp last   
next18:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr3+8]
	 L12:
	   add bill,ebx
	   loop L12
	   jmp last   
next19:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr3+12]
	 L13:
	   add bill,ebx
	   loop L13
	   jmp last   
next20:
     mov edx,offset str3                  
	 call writestring
	 call readint
     mov ecx,eax
	 mov ebx,[arr3+16]
	 L14:
	   add bill,ebx
	   loop L14
	   jmp last   
next10:
last:
ret	          
  SOFTDRINKS endp
  end main
 