.model  tiny
.code
.286

assume cs:@code

org 0100h

start:

        xor     ax, ax
        mov     es, ax
        mov     si, ax

        mov     cx, 0ffh

loop1:

        push    cx



        mov     dx, es:[si]
        mov     cx, 00004h
        mov     di, offset _val+008h

loop0:

        mov     al, dl
        and     al, 00fh
        cmp     al, 00ah
        sbb     al, 069h
        das
        mov     cs:[di], al
        dec     di
        shr     dx, 004h

        loop    loop0

        add     si, 2

        mov     dx, es:[si]
        mov     cx, 00004h
        mov     di, offset _val+003h

loop2:

        mov     al, dl
        and     al, 00fh
        cmp     al, 00ah
        sbb     al, 069h
        das
        mov     cs:[di], al
        dec     di
        shr     dx, 004h

        loop    loop2


        pop     cx

        mov     ah, 009h
        mov     dx, offset _val
        int     21h

        add     si, 2

        loop    loop1

        ret

_val    db      00,00,00,00,':',00,00,00,00,0dh,0ah,'$'

ends
end start