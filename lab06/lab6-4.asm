%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите значение переменной x:',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80; Переменная, значение которой будем вводить с клавиатуры
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax,msg
call sprint
mov ecx, x 
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразрвания
call atoi ; ASCII кода в число, `eax=x`
add eax,-1; eax = eax-1 = x - 1
mov ebx,eax
imul eax,ebx; EAX = (x-1)*(x-1)
mov ebx,5
imul eax,ebx; EAX = 5*(x-1)^(x-1)
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprint ; из 'edi' в виде символов
call quit ; вызов подпрограммы завершения












