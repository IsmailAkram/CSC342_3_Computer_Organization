; Listing generated by Microsoft (R) Optimizing Compiler Version 19.29.30136.0 

	TITLE	C:\Users\Izzy\OneDrive\College\CSC342_3 Computer Organization\Exams\Akram_Take_Home_Final_Take_Home_Test\Intel x86 (VS)\Dot_Product\Dot_Product\Debug\Dot_Prod_Pntr.obj
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

msvcjmc	SEGMENT
__788D8B2B_Dot_Prod_Pntr@cpp DB 01H
msvcjmc	ENDS
PUBLIC	?Dot_Prod_Pntr@@YAMPAM0H@Z			; Dot_Prod_Pntr
PUBLIC	__JustMyCode_Default
EXTRN	@__CheckForDebuggerJustMyCode@4:PROC
EXTRN	__fltused:DWORD
; Function compile flags: /Odt
;	COMDAT __JustMyCode_Default
_TEXT	SEGMENT
__JustMyCode_Default PROC				; COMDAT
	push	ebp
	mov	ebp, esp
	pop	ebp
	ret	0
__JustMyCode_Default ENDP
_TEXT	ENDS
; Function compile flags: /Odtp /ZI
;	COMDAT ?Dot_Prod_Pntr@@YAMPAM0H@Z
_TEXT	SEGMENT
_b$ = -12						; size = 4
_a$ = -8						; size = 4
_sum$ = -4						; size = 4
_arr_1$ = 8						; size = 4
_arr_2$ = 12						; size = 4
_size$ = 16						; size = 4
?Dot_Prod_Pntr@@YAMPAM0H@Z PROC				; Dot_Prod_Pntr, COMDAT
; File C:\Users\Izzy\OneDrive\College\CSC342_3 Computer Organization\Exams\Akram_Take_Home_Final_Take_Home_Test\Intel x86 (VS)\Dot_Product\Dot_Product\Dot_Prod_Pntr.cpp
; Line 1
	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH
	push	ebx
	push	esi
	push	edi
	mov	ecx, OFFSET __788D8B2B_Dot_Prod_Pntr@cpp
	call	@__CheckForDebuggerJustMyCode@4
; Line 2
	xorps	xmm0, xmm0
	movss	DWORD PTR _sum$[ebp], xmm0
; Line 5
	mov	eax, 4
	imul	ecx, eax, 0
	add	ecx, DWORD PTR _arr_1$[ebp]
	mov	DWORD PTR _a$[ebp], ecx
	mov	edx, 4
	imul	eax, edx, 0
	add	eax, DWORD PTR _arr_2$[ebp]
	mov	DWORD PTR _b$[ebp], eax
	jmp	SHORT $LN4@Dot_Prod_P
$LN2@Dot_Prod_P:
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, 4
	mov	DWORD PTR _a$[ebp], eax
	mov	ecx, DWORD PTR _b$[ebp]
	add	ecx, 4
	mov	DWORD PTR _b$[ebp], ecx
$LN4@Dot_Prod_P:
	mov	eax, DWORD PTR _size$[ebp]
	mov	ecx, DWORD PTR _arr_1$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	cmp	DWORD PTR _a$[ebp], edx
	jae	SHORT $LN3@Dot_Prod_P
; Line 6
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR _b$[ebp]
	movss	xmm0, DWORD PTR [eax]
	mulss	xmm0, DWORD PTR [ecx]
	addss	xmm0, DWORD PTR _sum$[ebp]
	movss	DWORD PTR _sum$[ebp], xmm0
	jmp	SHORT $LN2@Dot_Prod_P
$LN3@Dot_Prod_P:
; Line 7
	fld	DWORD PTR _sum$[ebp]
; Line 8
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
?Dot_Prod_Pntr@@YAMPAM0H@Z ENDP				; Dot_Prod_Pntr
_TEXT	ENDS
END
