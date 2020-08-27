; hello-os
	ORG		0x7c00		; このプログラムが読み込まれる場所

; 標準的なFAT12フォーマットフロッピーディスクのための記述
	JMP		entry
	DB		0x90
	DB		"HELLOIPL"	; ブートセクタの名前（8Bytes，自由）
	DW		512			; size of a sector(must be 512)
	DB		1			; size of a cluster(must be 1)
	DW		1			;
	DB		2
	DW		224
	DW		2880
	DB		0xf0
	DW		9
	DW		18
	DW		2
	DD		0
	DD		2880
	DB		0,0,0x29	; よくわからないけどこの値にしておくと良いらしい
	DD		0xffffffff
	DB		"HELLO-OS  "
	TIMES	18 DB 0

; main program
entry:
	MOV		AX,0		; レジスタの初期化
	MOV		SS,AX
	MOV		SP,0x7c00
	MOV		DS,AX
	MOV		ES,AX

	MOV		SI,msg
putloop:
	MOV		AL,[SI]
	ADD		SI,1
	CMP		AL,0
	JE		fin
	MOV		AH,0x0e
	MOV		BX,15
	INT		0x10
	JMP		putloop
fin:
	HLT					; 何かあるまでCPUを停止させる
	JMP		fin			; 無限ループ

msg:
	DB		0x0a, 0x0a	; newline x 2
	DB		"helloos, day2."
	DB		0x0a
	DB		0

	TIMES	0x7dfe-($-$$)-0x7c00 DB 0	; ここから510バイト目まで0埋め（$:現在の命令，$$:このプログラムの先頭の命令
	;TIMES	0x01fe-(S-SS) DB 0	; ここから510バイト目まで0埋め（$:現在の命令，$$:このプログラムの先頭の命令
	;TIMES	(510 - $) DB 0
	DB		0x55, 0xaa

; 以下はブートセクタ以外の部分の記述
	DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
	TIMES	4600 DB 0
	DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
	TIMES	1469432	DB 0
