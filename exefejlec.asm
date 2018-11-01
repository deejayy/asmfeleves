.model  tiny
.code
.286

assume cs:@code

org 0100h

start:

        ; f jl megnyit sa
        mov     ah, 03dh
        mov     cx, 00000h
        lea     dx, fname
        int     21h

        ; filehandle elment‚se bx-be
        mov     bx, ax

        ; olvas s 512 b jtot (HEX. 200)
        mov     cx, 00200h
        mov     dx, offset _buf
        mov     ah, 03fh
        int     21h

        ; kiiro init
        mov     di, offset _val+4
        mov     cx, 002h
        xor     ax, ax

loop0:

        ; konvert hex -> string
        mov     si, offset _buf+016h
        sub     si, cx

        mov     al, [si]
        and     al, 00Fh
        cmp     al, 00ah
        sbb     al, 069h
        das
        dec     di
        mov     ds:[di], al

        mov     al, [si]
        shr     al, 004h
        cmp     al, 00ah
        sbb     al, 069h
        das
        dec     di
        mov     ds:[di], al

        loop    loop0

        mov     ah, 009h
        mov     dx, offset _val
        int     21h

        mov     di, offset _val+4
        mov     cx, 002h
        xor     ax, ax

loop1:

        ; konvert hex -> string
        mov     si, offset _buf+012h
        sub     si, cx

        mov     al, [si]
        and     al, 00Fh
        cmp     al, 00ah
        sbb     al, 069h
        das
        dec     di
        mov     ds:[di], al

        mov     al, [si]
        shr     al, 004h
        cmp     al, 00ah
        sbb     al, 069h
        das
        dec     di
        mov     ds:[di], al

        loop    loop1

        mov     ah, 009h
        mov     dx, offset _val
        int     21h

        ; f jl lez r sa
        mov     ah, 03eh
        int     21h

        ret

fname   db      'vizsga.exe',0
_val    db      00,00,00,00,00dh,00ah,'$'
_buf    db      00200h dup(?)
_hFile  dw      ?
_datax  dw      ?


ends
end start