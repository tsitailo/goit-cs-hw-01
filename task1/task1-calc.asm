org  0x100               ; Вказуємо, що це програма .COM:
    ; a + b - c  (expected: 6) ===> b - c + a (expected: 7)
    ; TO COMPILE ASM
    ; install https://www.nasm.us/pub/nasm/releasebuilds/3.02/win64/
    ; add C:\Users\elina\AppData\Local\bin\NASM to PATH
    ; compile asmfile with the command: nasm -f bin -o calchw.com "task1-calc.asm"

    ; TO RUN *.com
    ; install https://www.dosbox.com/download.php?main=1
    ; C:\Program Files (x86)\DOSBox-0.74-3
    ; mount dir with *.com: mount c c:\\path\\to\\directory
    ; go to c drive:  c:
    ; exec file *.com in dosbox: calchw.com

section .data
    a db 6               ; Визначаємо a = 6
    b db 3               ; Визначаємо b = 3
    c db 2               ; Визначаємо c = 2
    resultMsg db 'Result: $' ; Визначення рядка для виведення результату

section .text
_start:
    mov al, [b]          ; Завантажуємо b в al
    sub al, [c]          ; Віднімаємо c від al
    add al, [a]          ; Додаємо a до al


    ; Перетворення результату в ASCII символ (для однозначних чисел)
    add al, 30h          ; Перетворюємо число в ASCII символ

    ; Виведення результату
    mov ah, 09h          ; Функція DOS для виведення рядка
    lea dx, resultMsg    ; Встановлюємо DX на адресу resultMsg
    int 21h              ; Виклик DOS-переривання

    ; Виведення числа
    mov dl, al           ; Поміщаємо результат в dl для виводу
    mov ah, 02h          ; Функція DOS для виводу символу
    int 21h              ; Виклик DOS-переривання

    ; Завершення програми
    mov ax, 4c00h        ; Функція DOS для завершення програми
    int 21h              ; Виклик DOS-переривання