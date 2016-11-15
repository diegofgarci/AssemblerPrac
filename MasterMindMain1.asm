section .data               
;Cambiar Nombre y Apellido por vuestros datos.
developer db "_Nom_ _Cognom1_"

;Constantes que también están definidas en C.
DimVector equ 5		

section .text            
;Variables definidas en Ensamblador.
global developer                        

;Subrutinas de ensamblador que se llaman desde C.
global printTriesP1, checkSecretP1, getSecretP1, getPlayP1
global checkHitsP1, printSecretP1, playP1

;Variables definidas en C.
extern charac, rowScreen, colScreen
extern vSecret, vPlay, tries, state

;Funciones de C que se llaman desde ensamblador
extern clearScreen_C, gotoxyP1_C, printchP1_C, getchP1_C
extern printMenuP1_C, printBoardP1_C, printMessage_C


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATENCIÓN: Recordad que las variables y los parámetros de tipo 'char',
;;   en ensamblador se tienen que asignar a registros de tipo BYTE 
;;   (1 byte): al, ah, bl, bh, cl, ch, dl, dh, sil, dil, ...
;;   y los de tipo 'int' se tienen que asignar a registros 
;;   de tipo DWORD (4 bytes): eax, ebx, ecx, edx, esi, edi, ....
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Las subrutinas en ensamblador que tenéis que implementar son:
;;   printTriesP1, checkSecretP1, getSecretP1, getPlayP1
;;   checkHitsP1, printSecretP1  
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Esta subrutina se da hecha. NO LA PODÉIS MODIFICAR.
; Situar el cursor en la fila indicada por la variable (rowScreen) y 
; en la columna indicada por la variable (colScreen) de la pantalla, 
; llamando a la función gotoxyP1_C.
;
; Variables globales utilizadas:	
; rowScreen: fila de la pantalla donde posicionamos el cursor.
; colScreen: columna de la pantalla donde posicionamos el cursor.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gotoxyP1:
   push rbp
   mov  rbp, rsp
   ;guardamos el estado de los registros del procesador porque
   ;las funciones de C no mantienen el estado de los registros.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15

   call gotoxyP1_C
 
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax

   mov rsp, rbp
   pop rbp
   ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Esta subrutina se da hecha. NO LA PODÉIS MODIFICAR.
; Mostrar un carácter guardado en la variable (charac) en la pantalla, 
; en la posición donde está el cursor, llamando a la función printchP1_C
; 
; Variables globales utilizadas:	
; charac   : carácter que queremos mostrar.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printchP1:
   push rbp
   mov  rbp, rsp
   ;guardamos el estado de los registros del procesador porque
   ;las funciones de C no mantienen el estado de los registros.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15

   call printchP1_C
 
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax

   mov rsp, rbp
   pop rbp
   ret
   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Esta subrutina se da hecha. NO LA PODÉIS MODIFICAR.
; Leer una tecla y guardar el carácter asociado a la variable (charac)
; sin mostrarlo por pantalla, llamando a la función getchP1. 
; 
; Variables globales utilizadas:	
; charac   : carácter que leemos de teclado.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getchP1:
   push rbp
   mov  rbp, rsp
   ;guardamos el estado de los registros del procesador porque
   ;las funciones de C no mantienen el estado de los registros.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15

   call getchP1_C
 
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mostrar los intentos que quedan (tries) para acertar la combinaciónn 
; secreta. 
; Situar el cursor en la fila 21, columna 5 llamando a la subrutina gotoxyP1.
; Mostrar el carácter asociado al valor de la variable (tries) 
; llamando a la subrutina printchP1.
; Para obtener el carácter asociado a los intentos, código ASCII del número,
; hay que sumar al valor numérico de los intentos (tries) 48 (código 
; ASCII de '0'). (charac=tries+'0' o charac=tries+48).
; 
; Variables globales utilizadas:	
; rowScreen: fila de la pantalla donde posicionamos el cursor.
; colScreen: columna de la pantalla donde posicionamos el cursor.
; charac   : carácter que leemos de teclado.
; tries    : número de intentos que quedan.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
printTriesP1:
   push rbp
   mov  rbp, rsp
   
   push rax; ponemos en la pila el registro rax
   
   mov DWORD[rowScreen], 21; rowScreen=21. Guardamos el valor 21 en la variable rowScreen.
   mov DWORD[colScreen], 5; colScreen=5. Guardamos el valor 5 en la variable colScreen.
   call gotoxyP1; Llamamos a la rutina gotoxyP1 para situar el cursor en los valores indicados. 
   
   mov al, BYTE[tries]; al= tries. Ponemos el valor de la varible tries (tipo char) en el regisitro al (tipo Byte)
   add al, 48; al=tries+48
   mov BYTE[charac], al; charac=al=tries+48  charac = (char)tries + '0'; Realizamos las operaciones adecuadas para obtener el valor ASCII correcto y lo movemos a la variable char.
   
   call printchP1; llamamos a la subrutina printchP1 para imprimir el valor correspondiente por pantalla. 
   
   pop rax; sacamos de la pila el registro rax

   mov rsp, rbp
   pop rbp
   ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Verifica que la combinación secreta (vSecret) no tenga espacios, 
; ni números repetidos.
; Para cada elemento del vector (vSecret) mirar que no haya un espacio
; y que no esté repetido en el resto del vector (de la posición 
; siguiente a la actual hasta el final).
; Si la combinación secreta es correcta, poner (state=1) para indicar 
; que la combinación secreta es correcta y que vamos a leer jugadas.
; Si la combinación secreta es incorrecta, poner (state=3) para volverla
; a pedir sin inicializarla.
; 
; Variables globales utilizadas:	
; vSecret  : vector donde guardamos la combinación secreta
; state    : estado del juego.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
checkSecretP1:
      push rbp
      mov  rbp, rsp
   
      push rax; utilizaremos el registro rax para guardar la variable i
      push rbx; utilizaremos el registro rbx para guardar la variable j
      push rcx; utilizareos el registro rcx para guardar la variable local secretError
      push rdx; lo utilizamos para guardar la direccion del vector vSecret
   
      mov ecx, 0; int secretError=0. utilizamos el registro ecx para guardar el valor de variable local ecx que nos marca si se han encontrado o no errores. 
   
   ;comprobamos si hay espacios en la combinación secreta.
   forSpaceinit:
      mov eax, 0; i=0. Utilizaremos el registro eax como variable de control del bucle for. 
   
   forCheckSpace:
      cmp eax, DimVector; i<DimVector. Comparamos si hemos llegado al final del vector.
      jge setState; si hemos llegado al final del vector pasamos al final de la rutina
   
      mov dl, BYTE[vSecret+eax]; dl= vSecret[i]
      cmp dl, ' '; realizamos una comparación para comprobar la igualdad vSecret[i]==' '
      jne forcheckRepeatinit; si no es igual saltamos a la rutina que comprueba si hay valores repetidos. 
      mov ecx, 1; En caso de que encontremos un espacio ponemos el valor de ecx a 1. secretError=1 
   
   ;comprobamos si hay valores repetidos en la combinación secreta;
   forcheckRepeatinit:
      mov ebx,eax; utilizaremos el registro ebx para guardar la variable de control del segundo bucle for (j=i)
      inc ebx; (j=i+1)
   
   forCheckRepeat:
      cmp ebx, DimVector;  j<DimVector
      jge forCheckRepeatEnd
                     
   compareIJ:
      cmp dl, BYTE[vSecret+ebx]; realizamos la comparación entre los valores del vector (vSecret[i]==vSecret[j])
      je areEqual; si son iguales saltamos a la rutina correspondiente.
      inc ebx; aumentamos el valor de ebx (j++)
      jmp forCheckRepeat
   
   areEqual:
      mov ecx, 1; si son iguales le damos el valor correspondiente al registro ecx (secretError=1) 
      inc ebx; j++
      jmp forCheckRepeat
      
   forCheckRepeatEnd:
      inc eax; aumentamos el valor de eax (i++)
      jmp forCheckSpace; saltamos al primer for.
  
   setState:
      cmp ecx, 1; 
      je stateNoCorrect; en que caso de que sea igual (secretError==1) saltamos a la subrutina stateNoCorrect
      mov DWORD[state], 1;  secretError=0 -> state = 1
      jmp checkSecretP1End
   
   stateNoCorrect:; secretError=1
      mov DWORD[state], 3;  state = 3
   
 checkSecretP1End:
      pop rax
      pop rbx
      pop rcx
      pop rdx

      mov rsp, rbp
      pop rbp
      ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Leer la combinación secreta y guardarla en un vector de DimVector(5) posiciones.
; 
; · Primero indicar la posición del cursor en pantalla (rowScreen=3) y
;   (colScreen=22)
; · Inicializar con espacios el vector (vSecret) si estamos entrando 
;   por primera vez la combinación secreta (state=0).
; Mientras no se pulse ENTER(10) o ESC(27) hacer lo siguiente:
; · Posicionar el cursor en pantalla llamando a a la subrutina gotoxyP1, 
;   según el valor de las variables (rowScreen y colScreen).
; · Leer un carácter de teclado llamando a la subrutina getchP1
;   que deja en la variable (charac) el código ASCII del carácter leído.
;    - Si se ha leído una 'k'(izquierda) o una 'l' (derecha) mover el 
;      cursor por las 5 posiciones de la combinación, actualizando
;      el índice del vector (i +/-1) y la columna (colScreen +/-2).
;      (no se puede salir de la zona donde estamos escribiendo (5 posiciones))
;    - Si se ha leído un carácter válido ['0'-'9'] lo guardamos en el vector
;      (vSecret).
;      Pondremos un '*' en (charac) para que no se vea la combinación 
;      secreta que escribimos(charc='*').
;      y mostramos el carácter (charac) por pantalla en la posición donde 
;      esta el cursor llamando a al subrutina printchP1.
; · Verificar la combinación secreta (que no tenga números repetidos, 
;   ni espacios) llamando a la subrutina checkSecretP1.
; · Si se ha pulsado ESC(27) poner (state=7) para indicar que tenemos 
;   que salir.
; 
; Si se pulsa ENTER(10) aceptar la combinación tal y como esté.
; NOTA: Hay que tener en cuenta que si se pulsa ENTER sin haber asignado
; valores a todas las posiciones del vector, habrá posiciones que serán
; un espacio (valor utilizado para inicialitar los vectores).
; 
; Variables globales utilizadas:	
; rowScreen: fila de la pantalla donde posicionamos el cursor.
; colScreen: columna de la pantalla donde posicionamos el cursor.
; charac   : carácter que leemos de teclado.
; vSecret  : vector donde guardamos la combinación secreta
; state    : estado del juego.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
getSecretP1:
      push rbp
      mov  rbp, rsp
	
      push rax
      push rbx
      push rsi
      push rdi
	
      mov DWORD[rowScreen], 3; rowScreen=21 · Primero indicar la posición del cursor en pantalla (rowScreen=3) y (colScreen=22)  									
      mov DWORD[colScreen], 22; colScreen=5
   
   ;inicializar vSecret con espacios si state=0
   ifState0:
      mov eax, DWORD[state]
      cmp eax, 0; if (state==0)
      jne getSecretP1Do; si el estado es distinto de 0 pasamos a la siguiente parte del algoritmo.
   
   ;rellenamos el vector Vsecret con espacios
   initVsecret:
      mov ebx, 0; i=0
 
   initVsecretFor:
      cmp ebx, DimVector; i<Dimvector 
      jge getSecretP1Do; si es mayor saltamos al do while
      mov BYTE[vSecret+ebx], ' '; vSecret[i]=' '
      inc ebx; i++
      jmp initVsecretFor
      
   getSecretP1Do:
      mov ebx, 0; i=0
   
   getSecretP1While:
      call gotoxyP1;
      call getchP1;
      mov sil, BYTE[charac]
      
      cmp sil, 'k'
      je left
      cmp sil, 'l'
      je right
      
      ;comprobamos que el caracter esté entre 0 y 9
      cmp sil, 48; charac >='0'
      jl whileCondition
      cmp sil, 57; charac <='9'
      jle validCharacter
      
   whileCondition:		
      cmp sil, 10; ENTER
      je ENTE
      cmp sil, 27; ESC
      je ESC
      jmp getSecretP1While
           
   validCharacter: ;si el cararcter es valido lo movemos al vector vSecret[i] e imprimimos un * por pantalla.
      mov BYTE[vSecret+ebx], sil
      mov BYTE[charac], '*'
      call printchP1 
      jmp getSecretP1While
      
   left:; k: movemos el cursor a la izquierda
      cmp ebx, 0
      jg decrementI; i>0 
      jmp getSecretP1While
      decrementI:
         dec ebx; i--
         sub DWORD[colScreen], 2; colscreen -2
         jmp getSecretP1While
   
   right:;l movemos el cursor a la derecha
      mov edi, DimVector
      dec edi; dimVector-1
      cmp ebx, edi; i<dimVector-1
      jl incrementI
      jmp getSecretP1While
      incrementI:
         inc ebx; i++
         add DWORD[colScreen], 2; colScreen +2
         jmp getSecretP1While
   
      ;si se pulsa ESC comprobamos el numero secreto y ponemos state=7
   ESC:
      call checkSecretP1 
      mov DWORD[state], 7
      jmp getSecretP1End
   
      ;si se pulsa enter solo comprobamos el número secreto.
   ENTE:
      call checkSecretP1 
   
   getSecretP1End:
      pop rax
      pop rbx
      pop rsi

      mov rsp, rbp
      pop rbp
      ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Leer la jugada y guardarla en un vector de DimVector(5) posiciones.
; 
; · Primero indicar la posición del cursor en la pantalla 
;   (rowScreen=9+(DimVector-tries)*2) y (colScreen = 8)
;   y inicializar con espacios el vector (vPlay).
; · Inicializar la variable que utilizaremos como índice del vector 
;   (i) a 0.
; Mientras no se pulse ENTER(10) o ESC(27) hacer lo siguiente:
; · Posicionar el cursor en la pantalla llamando a a la subrutina gotoxyP1, 
;   según el valor de les variables (rowScreen y colScreen).
; · Leer un carácter de teclado llamando a la subrutina getchP1
;   que deja en la variable (charac) el código ASCII del carácter leído.
;    - Si se ha leído una 'k'(izquierda) o una 'l' (derecha) mover el 
;      cursor por las 5 posiciones de la combinación, actualizando la 
;      variable (i +/-1) y la variable (colScreen +/-2).
;      (no se puede salir de la zona donde estamos escribiendo (5 posiciones))
;    - Si se ha leído un carácter válido ['0'-'9'] lo guardamos en el 
;      vector (vPlay).
;      y mostramos el carácter (charac) por pantalla en la posición donde 
;      está el cursor llamando a la subrutina printchP1.
; · Si se ha pulsado ESC(27) poner (state=7) para indicar que tenemos 
;   que salir.
;  
; Si se pulsa ENTER(10) aceptar la combinación tal y como esté.
; NOTA: Hay que tener en cuenta que si se pulsa ENTER sin haber asignado
; valores a todas las posiciones del vector, habrá posiciones que serán
; un espacio (valor utilizado para inicializar los vectores).
; 
; Variables globales utilizadas:	
; rowScreen: fila de la pantalla donde posicionamos el cursor.
; colScreen: columna de la pantalla donde posicionamos el cursor.
; charac   : carácter que leemos de teclado.
; vPlay    : vector donde guardamos cada jugada.
; tries    : número de intentos que quedan
; state    : estado del juego.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
getPlayP1:
      push rbp
      mov  rbp, rsp
   
      push rax
      push rbx
      push rsi
   
      ;colocamos el cursor en la posición indicada          
      mov eax, DimVector
      sub eax, DWORD[tries]; eax=DimVector-tries
      add eax, eax; eax=eax*2
      add eax, 9; eax=eax+9
      mov DWORD[rowScreen], eax
      mov DWORD[colScreen], 8
   
   ;inicializamos con espacios el vector vPlay
   initVplay:
      mov ebx, 0; i=0
      
   initVplayFor:
      cmp ebx, DimVector; i<dimVector
      jge getPlayP1Do; si es mayor saltamos al Do While
      mov BYTE[vPlay+ebx], ' '; vPlay[i]=' '
      inc ebx; i++
      jl initVplayFor
      
   getPlayP1Do:   
      mov ebx, 0; i=0
       
   getPlayP1While:
     call gotoxyP1;
     call getchP1;
     mov sil, BYTE[charac]
      
     ;comprobamos si se pulsa izquierda o derecha
     cmp sil, 'k'
     je left2
     cmp sil, 'l'
     je right2
       
     ;comprobamos si el número está entre 0 y 9         
     cmp sil, 48
     jl whileCondition2
     cmp sil, 57
     jle validCharacter2
                
   ;comprobamos la condición while, sino se cumple realizamos de nuevo el bucle     
   whileCondition2:		
     cmp sil, 10; ENTER
     je getPlayP1End
     cmp sil, 27; ESC
     je ESC2
     jmp getPlayP1While
   
   ; siel cararcter es valido lo movemos al vector vPlay[i] y lo imprimimos por pantalla
   validCharacter2:
     mov BYTE[vPlay+ebx], sil; vPlay[i]
     call printchP1
     jmp getPlayP1While
   
   ;realizamos la acción left sin que el cursor se salga del espacio marcado    
   left2:
     cmp ebx, 0
     jg decrementI2; 
     jmp getPlayP1While  
   decrementI2:
     dec ebx; i--
     sub DWORD[colScreen], 2; colScreen -2
     jmp getPlayP1While; reiniciamos el bucle
   
   ;realizamos la acción left sin que el cursor se salga del espacio marcado. 
   right2:
     mov edi, DimVector
     dec edi; edi= dimVector -1
     cmp ebx, edi; i<DimVector-1
     jl incrementI2
     jmp getPlayP1While
   incrementI2:
     inc ebx; i++
     add DWORD[colScreen], 2; colScreen +2 
     jmp getPlayP1While; reiniciamos el bucle.
   
   ESC2:
     mov DWORD[state], 7; si pulsamos esc -> state=7
   
   getPlayP1End:
     pop rax
     pop rbx
     pop rsi

     mov rsp, rbp
     pop rbp
     ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mirar si la jugada (vPlay) es igual (posición a posición) a la 
; combinación secreta (vSecret), para cada posición que sea igual
; incrementar los aciertos en el sitio (hitsX++).
; Si todas posiciones de la combinación secreta (vSecret) y de la jugada
; (vPlay) son iguales (hitsX=5) hemos ganado (state=5).
; 
; Variable Local de C (en ensamblador utilizar un registro):
; hitsX    : aciertos en el sitio.
;
; Variables globales utilizadas:	
; vSecret  : vector donde guardamos la combinación secreta
; vPlay    : vector donde guardamos cada jugada.
; state    ; estado del juego.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
checkHitsP1:
      push rbp
      mov  rbp, rsp
   
      push rax
      push rbx
      push rdi
      push rsi
   
   
      mov bl, 0; hitsX=0
   
   checkHitsP1forinit:
      mov eax, 0; i=0
  
   checkHitsP1for:
      cmp eax, DimVector; i<dimVector
      jl checkHitsP1if
      
      ;si llegamos al final del vector comprobamos el valor de la variable hits.
      cmp bl, 5
      je winGame; 
      jmp checkHitsP1End
   
   ;comprobamos si los valores del vector son iguales.
   checkHitsP1if:
      mov sil, BYTE[vSecret+eax]; sil=vSecret[i]
      mov dil, BYTE[vPlay+eax]; dil= VPlay[i]
      cmp sil, dil  
      je coincident; vSecret[i] == vPlay[i]
      inc eax; i++
      jmp checkHitsP1for; volvemos a reiniciar el bucle
   
   ;si los valores son iguales aumentamos el valor de hits 
   coincident:
      inc bl; hits++
      inc eax; i++
      jmp checkHitsP1for; volvemos a reiniciar el bucle.
   
    
   winGame: 
      mov DWORD[state], 5; si todos los valores son iguales state=5
   
   checkHitsP1End:
      pop rax
      pop rbx
      pop rdi
      pop rsi
      
      mov rsp, rbp
      pop rbp
      ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mostrar la combinación secreta en la parte superior del tablero 
; cuando finaliza el juego.
; 
; Variables globales utilizadas:	
; rowScreen: fila de la pantalla donde posicionamos el cursor.
; colScreen: columna de la pantalla donde posicionamos el cursor.
; charac   : carácter que leemos de teclado.
; vSecret  : vector donde guardamos la combinación secreta.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
printSecretP1:
      push rbp
      mov  rbp, rsp
   
      push rax;
      push rbx;
	
      mov DWORD[rowScreen], 3;
      mov DWORD[colScreen], 22;
   
   printSecretP1ForInit:
      mov eax, 0;
  
   printSecretP1For:
      cmp eax, DimVector; i<dimVector
      jge printSecretP1ForEnd;
   
      call gotoxyP1;
      mov bl,BYTE[vSecret+eax]; ponemos en bl el valor de vSecret[i]
      mov BYTE[charac], bl; movemos a la variable charac el contenido de bl
      call printchP1; imprimimos el contenido de charac
      add DWORD[colScreen], 2; colScreen +2
      inc eax; i++
      jmp printSecretP1For; reiniciamos el bucle
   
   printSecretP1ForEnd:  
      pop rax;
      pop rbx;
	
      mov rsp, rbp
      pop rbp
      ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Esta subrutina se da hecha. NO LA PODÉIS MODIFICAR.
; Subrutina principal del juego
; Leer la combinación secreta y verificar que sea correcta.
; A continuación se lee una jugada, compara la jugada con la
; combinación secreta para determinar si son iguales.
; repetir el proceso mientras no se acierta la combinación secreta y 
; mientras queden intentos. Si se pulsa la tecla 'ESC' durante la 
; lectura de la combinación secreta o de una jugada salir.
; 
; Pseudo código:
; El jugador tiene que disponer de 5 intentos para acertar la combinación 
; secreta y el estado inicial del juego es 0.
; Mostrar el tablero de juego llamando a la función printBoardP1_C.
; Mostrar los intentos que queden llamando a la subrutina printTriesP1.
; Mostrar un mensaje indicando que se tiene que entrar la combinación 
; secreta llamando a la función printMessage_C;
; Mientras (state=0) leer la combinación secreta o (state=3) se ha leído 
; la combinación secreta pero no es correcta:
;   - Leer y verificar la combinación secreta llamando a la subrutina
;     getSecretPlayP1.
;   - Si no se ha pulsado la tecla (ESC) (state!=7) mostrar un mensaje 
;     llamando a la función printMessage_C indicando que ya se pueden 
;     entrar jugadas (state=1).
; Mientras (state=1) estamos introduciendo jugadas:
;   - Mostrar los intentos que queden llamando a la subrutina printTriesP1.
;   - Leer la jugada llamando a la subrutina getSecretPlayP1.
;   - Si no se ha pulsado (ESC) llamar a la subrutina chekHitsP1 para 
;     mirar si la jugada (vPlay) es igual, posición a posición, a la 
;     combinación secreta (vSecret), si es igual (state=5).
;     Decrementamos los intentos, y si no quedan intentos (tries=0) y no 
;     hemos acertado la combinación secreta (state=1), hemos perdido (state=6).
; Para acabar, mostrar la combinación secreta llamando a la subrutina
; printSecretP1 y un mensaje indicando cual ha sido el motivo
; llamando a la función printMessage_C.
; Se acaba el juego.
; 
; Variables globales utilizadas:	
; rowScreen: fila de la pantalla donde posicionamos el cursor.
; colScreen: columna de la pantalla donde posicionamos el cursor.
; tries    : número de intentos que quedan.
; state    : estado del juego.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
playP1:
   push rbp
   mov  rbp, rsp

   mov  DWORD[tries], 5  ;tries = 5;
   mov  DWORD[state], 0  ;state = 0;
   call printBoardP1_C   ;printBoardP1_C();
   call printTriesP1     ;printTriesP1_C();
   call printMessage_C   ;printMessage_C();
   ;// Leer combinación secreta hasta que sea correcta
   p1_while0:       ;while (state == 0 || state==3) {
   cmp DWORD[state], 0
   je  p1_while0_ok
   cmp DWORD[state], 3
   jne p1_while0_end
     p1_while0_ok:
	 call getSecretP1    ;getSecretP1_C();
     p1_if1:             ;if (state!=7) {
     cmp DWORD[state], 7
     je  p1_if1_end
	   call printMessage_C;printMessage_C();
     p1_if1_end:
     jmp p1_while0
   p1_while0_end:
   
   ;// Leer las jugadas
   p1_while1:       ;while (state==1) {
   cmp DWORD[state], 1
   jne p1_while1_end
	 call printTriesP1  ;printTriesP1_C();
	 call getPlayP1     ;getPlayP1_C();
	 p1_if2:            ;if (state!=7) {
	 cmp DWORD[state], 7
	 je p1_if2_end
	   call checkHitsP1 ;checkHitsP1_C();
	   dec DWORD[tries] ;tries--;
	   p1_if3:          ;if (tries == 0 && state == 1) {
	   cmp DWORD[tries], 0
	   jne p1_if3_end
	   cmp DWORD[state], 1
	   jne p1_if3_end
         mov DWORD[state], 6  ;state = 6;//Hemos perdido, no quedan más intentos.
       p1_if3_end:
     p1_if2_end:
     jmp p1_while1
   p1_while1_end:
   call printSecretP1    ;printSecretP1_C();
   call printMessage_C   ;printMessage_C();
   
   p1_end:	
   mov rsp, rbp
   pop rbp
   ret
