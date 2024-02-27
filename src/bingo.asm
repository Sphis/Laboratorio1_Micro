;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"bingo.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__moduint
	extern	__divsint
	extern	__modsint
	extern	_ANSEL
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_final
	global	_limpiar
	global	_generateRandomNumber
	global	_num_decenas
	global	_num_unidades
	global	_delay
	global	_counter

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_bingo_0	udata
r0x101E	res	1
r0x101D	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1028	res	1
r0x1029	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
r0x102E	res	1
r0x102F	res	1
r0x1030	res	1
r0x1031	res	1
r0x1032	res	1
r0x1033	res	1
r0x1034	res	1
r0x1035	res	1
r0x1036	res	1
r0x1037	res	1
r0x1038	res	1
r0x1039	res	1
r0x103A	res	1
r0x103B	res	1
r0x103C	res	1
r0x103D	res	1
r0x103E	res	1
_main_arreglo_65537_18	res	20
_main_sloc0_1_0	res	1
_main_sloc1_1_0	res	1
_main_sloc2_1_0	res	1
_main_sloc3_1_0	res	1
_main_sloc4_1_0	res	1
_main_sloc5_1_0	res	1
_main_sloc6_1_0	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_bingo_0	idata
_counter
	db	0x00, 0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_bingo	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _generateRandomNumber
;   _num_unidades
;   _num_decenas
;   _delay
;   _limpiar
;   _delay
;   _limpiar
;   _final
;   _limpiar
;   _delay
;   _delay
;   _delay
;   _generateRandomNumber
;   _num_unidades
;   _num_decenas
;   _delay
;   _limpiar
;   _delay
;   _limpiar
;   _final
;   _limpiar
;24 compiler assigned registers:
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   STK00
;   r0x102E
;   r0x102F
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	77; "bingo.c"	TRISIO = 0b00001000; //Poner todos los pines como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	78; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	79; "bingo.c"	ANSEL = 0b00001000; // Set GP3 as digital input
	MOVLW	0x08
	BANKSEL	_ANSEL
	MOVWF	_ANSEL
;	.line	82; "bingo.c"	int inicio = 0;
	BANKSEL	r0x1028
	CLRF	r0x1028
	CLRF	r0x1029
;	.line	86; "bingo.c"	int b0u, b1u, b2u, b3u, b0d, b1d, b2d, b3d = 0;
	CLRF	r0x102A
	CLRF	r0x102B
;	.line	88; "bingo.c"	int j = 0; // Contador
	CLRF	r0x102C
	CLRF	r0x102D
;	.line	90; "bingo.c"	delay(5); // Delay para evitar cargar valores erroneos
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00200_DS_:
;	.line	97; "bingo.c"	if (inicio == 0 && GP3 == 1) {
	BANKSEL	r0x1029
	MOVF	r0x1029,W
	IORWF	r0x1028,W
	BTFSS	STATUS,2
	GOTO	_00196_DS_
	CLRF	r0x102E
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x102E
	INCF	r0x102E,F
_00001_DS_:
	BANKSEL	r0x102E
	MOVF	r0x102E,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00196_DS_
;	.line	99; "bingo.c"	GP0 = 0x00;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	100; "bingo.c"	GP1 = 0x00;
	BCF	_GPIObits,1
;	.line	101; "bingo.c"	GP2 = 0x00;
	BCF	_GPIObits,2
;	.line	102; "bingo.c"	GP4 = 0x00;
	BCF	_GPIObits,4
;	.line	103; "bingo.c"	GP5 = 0x01; // Encender unidades
	BSF	_GPIObits,5
;	.line	104; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	105; "bingo.c"	GP5 = ~GP5; // Encender decenas
	BANKSEL	r0x102E
	CLRF	r0x102E
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00002_DS_
	BANKSEL	r0x102E
	INCF	r0x102E,F
_00002_DS_:
	BANKSEL	r0x102E
	COMF	r0x102E,W
	MOVWF	r0x102E
	RRF	r0x102E,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00003_DS_:
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00004_DS_:
;	.line	106; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	107; "bingo.c"	j = 0;
	BANKSEL	r0x102C
	CLRF	r0x102C
	CLRF	r0x102D
	GOTO	_00200_DS_
_00196_DS_:
;	.line	110; "bingo.c"	if (j == 0) {
	BANKSEL	r0x102D
	MOVF	r0x102D,W
	IORWF	r0x102C,W
	BTFSS	STATUS,2
	GOTO	_00173_DS_
;	.line	111; "bingo.c"	inicio = 1; // El juego ha iniciado
	MOVLW	0x01
	MOVWF	r0x1028
	CLRF	r0x1029
_00173_DS_:
;	.line	114; "bingo.c"	if (GP3 != 0) {
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00175_DS_
;	.line	116; "bingo.c"	sig_num = 0; // No se requiere el siguiente numero
	BANKSEL	r0x102E
	CLRF	r0x102E
	CLRF	r0x102F
	GOTO	_00176_DS_
_00175_DS_:
;	.line	120; "bingo.c"	sig_num = 1; // Se requiere el siguiente numero
	MOVLW	0x01
	BANKSEL	r0x102E
	MOVWF	r0x102E
	CLRF	r0x102F
_00176_DS_:
;	.line	123; "bingo.c"	if (sig_num == 1) {
	BANKSEL	r0x1030
	CLRF	r0x1030
	MOVF	r0x102E,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00280_DS_
	MOVF	r0x102F,W
	XORLW	0x00
	BTFSC	STATUS,2
	INCF	r0x1030,F
_00280_DS_:
	BANKSEL	r0x1030
	MOVF	r0x1030,W
	BTFSC	STATUS,2
	GOTO	_00190_DS_
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
;	.line	124; "bingo.c"	while (j < 10) {
	MOVF	r0x102D,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00281_DS_
	MOVLW	0x0a
	SUBWF	r0x102C,W
_00281_DS_:
	BTFSC	STATUS,0
	GOTO	_00190_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	125; "bingo.c"	for (int i = 0; i < 10; ++i) {
	BANKSEL	r0x102E
	CLRF	r0x102E
	CLRF	r0x102F
	CLRF	r0x1031
	CLRF	r0x1032
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
_00203_DS_:
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00282_DS_
	MOVLW	0x0a
	SUBWF	r0x102E,W
_00282_DS_:
	BTFSC	STATUS,0
	GOTO	_00177_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	126; "bingo.c"	arreglo[i] = -1; // Inicializar el arreglo con -1 (porque este numero no puede salir)
	BANKSEL	r0x1031
	MOVF	r0x1031,W
	ADDLW	(_main_arreglo_65537_18 + 0)
	MOVWF	r0x1033
	MOVLW	high (_main_arreglo_65537_18 + 0)
	MOVWF	r0x1034
	MOVF	r0x1032,W
	BTFSC	STATUS,0
	INCFSZ	r0x1032,W
	ADDWF	r0x1034,F
	MOVF	r0x1033,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1034
	BTFSC	r0x1034,0
	BSF	STATUS,7
	MOVLW	0xff
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	MOVLW	0xff
	MOVWF	INDF
;	.line	125; "bingo.c"	for (int i = 0; i < 10; ++i) {
	MOVLW	0x02
	BANKSEL	r0x1031
	ADDWF	r0x1031,F
	BTFSC	STATUS,0
	INCF	r0x1032,F
	INCF	r0x102E,F
	BTFSC	STATUS,2
	INCF	r0x102F,F
	GOTO	_00203_DS_
_00177_DS_:
;	.line	130; "bingo.c"	while (indice < 1) {
	BANKSEL	r0x102E
	CLRF	r0x102E
	CLRF	r0x102F
	CLRF	r0x1031
	CLRF	r0x1032
;;signed compare: left < lit(0x1=1), size=2, mask=ffff
_00183_DS_:
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00283_DS_
	MOVLW	0x01
	SUBWF	r0x102E,W
_00283_DS_:
	BTFSC	STATUS,0
	GOTO	_00185_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	131; "bingo.c"	unsigned int num_generado = generateRandomNumber();
	PAGESEL	_generateRandomNumber
	CALL	_generateRandomNumber
	PAGESEL	$
	BANKSEL	r0x1034
	MOVWF	r0x1034
	MOVF	STK00,W
	MOVWF	r0x1033
;	.line	132; "bingo.c"	int duplicado = 0;
	CLRF	r0x1035
	CLRF	r0x1036
;	.line	135; "bingo.c"	for (int i = 0; i < 10; ++i) {
	CLRF	r0x1037
	CLRF	r0x1038
	CLRF	r0x1039
	CLRF	r0x103A
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
_00206_DS_:
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00284_DS_
	MOVLW	0x0a
	SUBWF	r0x1037,W
_00284_DS_:
	BTFSC	STATUS,0
	GOTO	_00180_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	136; "bingo.c"	if (arreglo[i] == num_generado) {
	BANKSEL	r0x1039
	MOVF	r0x1039,W
	ADDLW	(_main_arreglo_65537_18 + 0)
	MOVWF	r0x103B
	MOVLW	high (_main_arreglo_65537_18 + 0)
	MOVWF	r0x103C
	MOVF	r0x103A,W
	BTFSC	STATUS,0
	INCFSZ	r0x103A,W
	ADDWF	r0x103C,F
	MOVF	r0x103B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103C
	BTFSC	r0x103C,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x103D
	MOVWF	r0x103D
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	MOVF	r0x1033,W
	XORWF	r0x103D,W
	BTFSS	STATUS,2
	GOTO	_00207_DS_
	MOVF	r0x1034,W
	XORWF	r0x103E,W
	BTFSS	STATUS,2
	GOTO	_00207_DS_
;	.line	137; "bingo.c"	duplicado = 1;
	MOVLW	0x01
	MOVWF	r0x1035
	CLRF	r0x1036
;	.line	138; "bingo.c"	break;
	GOTO	_00180_DS_
_00207_DS_:
;	.line	135; "bingo.c"	for (int i = 0; i < 10; ++i) {
	MOVLW	0x02
	BANKSEL	r0x1039
	ADDWF	r0x1039,F
	BTFSC	STATUS,0
	INCF	r0x103A,F
	INCF	r0x1037,F
	BTFSC	STATUS,2
	INCF	r0x1038,F
	GOTO	_00206_DS_
_00180_DS_:
;	.line	141; "bingo.c"	if (!duplicado) {
	BANKSEL	r0x1036
	MOVF	r0x1036,W
	IORWF	r0x1035,W
	BTFSS	STATUS,2
	GOTO	_00183_DS_
;	.line	142; "bingo.c"	arreglo[indice] = num_generado;
	MOVF	r0x1031,W
	ADDLW	(_main_arreglo_65537_18 + 0)
	MOVWF	r0x1035
	MOVLW	high (_main_arreglo_65537_18 + 0)
	MOVWF	r0x1036
	MOVF	r0x1032,W
	BTFSC	STATUS,0
	INCFSZ	r0x1032,W
	ADDWF	r0x1036,F
	MOVF	r0x1035,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1036
	BTFSC	r0x1036,0
	BSF	STATUS,7
	MOVF	r0x1033,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	r0x1034
	MOVF	r0x1034,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	143; "bingo.c"	indice++; // En este caso el numero no es duplicado, entonces se agrega
	MOVLW	0x02
	BANKSEL	r0x1031
	ADDWF	r0x1031,F
	BTFSC	STATUS,0
	INCF	r0x1032,F
	INCF	r0x102E,F
	BTFSC	STATUS,2
	INCF	r0x102F,F
	GOTO	_00183_DS_
_00185_DS_:
;	.line	146; "bingo.c"	int unidad = num_unidades(arreglo[0]);
	BANKSEL	_main_arreglo_65537_18
	MOVF	(_main_arreglo_65537_18 + 0),W
	BANKSEL	r0x102E
	MOVWF	r0x102E
	BANKSEL	_main_arreglo_65537_18
	MOVF	(_main_arreglo_65537_18 + 1),W
	BANKSEL	r0x102F
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_num_unidades
	CALL	_num_unidades
	PAGESEL	$
	BANKSEL	r0x102F
	MOVWF	r0x102F
	MOVF	STK00,W
	MOVWF	r0x102E
;	.line	147; "bingo.c"	int decena = num_decenas(arreglo[0]);
	BANKSEL	_main_arreglo_65537_18
	MOVF	(_main_arreglo_65537_18 + 0),W
	BANKSEL	r0x1031
	MOVWF	r0x1031
	BANKSEL	_main_arreglo_65537_18
	MOVF	(_main_arreglo_65537_18 + 1),W
	BANKSEL	r0x1032
	MOVWF	r0x1032
	MOVF	r0x1031,W
	MOVWF	STK00
	MOVF	r0x1032,W
	PAGESEL	_num_decenas
	CALL	_num_decenas
	PAGESEL	$
	BANKSEL	r0x1032
	MOVWF	r0x1032
	MOVF	STK00,W
;	.line	150; "bingo.c"	b3d = (decena >> 3) & 1; // Bit 3 (MSB)
	MOVWF	r0x1031
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1033
	MOVWF	r0x102A
	CLRF	r0x102B
;	.line	151; "bingo.c"	b2d = (decena >> 2) & 1; // Bit 2
	MOVF	r0x1031,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	_main_sloc0_1_0
	MOVWF	_main_sloc0_1_0
;	.line	152; "bingo.c"	b1d = (decena >> 1) & 1; // Bit 1
	BANKSEL	r0x1031
	MOVF	r0x1031,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	_main_sloc1_1_0
	MOVWF	_main_sloc1_1_0
;	.line	153; "bingo.c"	b0d = decena & 1; // Bit 0 (LSB)
	BANKSEL	r0x1031
	MOVF	r0x1031,W
	BANKSEL	_main_sloc2_1_0
	MOVWF	_main_sloc2_1_0
;	.line	156; "bingo.c"	b3u = (unidad >> 3) & 1; // Bit 3 (MSB)
	BANKSEL	r0x102E
	MOVF	r0x102E,W
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	_main_sloc3_1_0
	MOVWF	_main_sloc3_1_0
;	.line	157; "bingo.c"	b2u = (unidad >> 2) & 1; // Bit 2
	BANKSEL	r0x102E
	MOVF	r0x102E,W
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	_main_sloc4_1_0
	MOVWF	_main_sloc4_1_0
;	.line	158; "bingo.c"	b1u = (unidad >> 1) & 1; // Bit 1
	BANKSEL	r0x102E
	MOVF	r0x102E,W
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	BANKSEL	_main_sloc5_1_0
	MOVWF	_main_sloc5_1_0
;	.line	159; "bingo.c"	b0u = unidad & 1; // Bit 0 (LSB)
	BANKSEL	r0x102E
	MOVF	r0x102E,W
	BANKSEL	_main_sloc6_1_0
	MOVWF	_main_sloc6_1_0
_00190_DS_:
;	.line	163; "bingo.c"	if (sig_num == 1) {
	BANKSEL	r0x1030
	MOVF	r0x1030,W
	BTFSC	STATUS,2
	GOTO	_00192_DS_
;	.line	164; "bingo.c"	j++;
	INCF	r0x102C,F
	BTFSC	STATUS,2
	INCF	r0x102D,F
_00192_DS_:
;	.line	167; "bingo.c"	GP5 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
;	.line	168; "bingo.c"	GP0 = b0u;
	BANKSEL	_main_sloc6_1_0
	RRF	_main_sloc6_1_0,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00005_DS_:
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00006_DS_:
;	.line	169; "bingo.c"	GP1 = b1u;
	BANKSEL	_main_sloc5_1_0
	RRF	_main_sloc5_1_0,W
	BTFSC	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00007_DS_:
	BTFSS	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00008_DS_:
;	.line	170; "bingo.c"	GP2 = b2u;
	BANKSEL	_main_sloc4_1_0
	RRF	_main_sloc4_1_0,W
	BTFSC	STATUS,0
	GOTO	_00009_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00009_DS_:
	BTFSS	STATUS,0
	GOTO	_00010_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00010_DS_:
;	.line	171; "bingo.c"	GP4 = b3u;
	BANKSEL	_main_sloc3_1_0
	RRF	_main_sloc3_1_0,W
	BTFSC	STATUS,0
	GOTO	_00011_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00011_DS_:
	BTFSS	STATUS,0
	GOTO	_00012_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00012_DS_:
;	.line	172; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	175; "bingo.c"	limpiar();
	PAGESEL	_limpiar
	CALL	_limpiar
	PAGESEL	$
;	.line	178; "bingo.c"	GP5 = ~GP5; // Encender decenas
	BANKSEL	r0x102E
	CLRF	r0x102E
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00013_DS_
	BANKSEL	r0x102E
	INCF	r0x102E,F
_00013_DS_:
	BANKSEL	r0x102E
	COMF	r0x102E,W
	MOVWF	r0x102E
	RRF	r0x102E,W
	BTFSC	STATUS,0
	GOTO	_00014_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00014_DS_:
	BTFSS	STATUS,0
	GOTO	_00015_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00015_DS_:
;	.line	179; "bingo.c"	GP0 = b0d;
	BANKSEL	_main_sloc2_1_0
	RRF	_main_sloc2_1_0,W
	BTFSC	STATUS,0
	GOTO	_00016_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00016_DS_:
	BTFSS	STATUS,0
	GOTO	_00017_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00017_DS_:
;	.line	180; "bingo.c"	GP1 = b1d;
	BANKSEL	_main_sloc1_1_0
	RRF	_main_sloc1_1_0,W
	BTFSC	STATUS,0
	GOTO	_00018_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00018_DS_:
	BTFSS	STATUS,0
	GOTO	_00019_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00019_DS_:
;	.line	181; "bingo.c"	GP2 = b2d;
	BANKSEL	_main_sloc0_1_0
	RRF	_main_sloc0_1_0,W
	BTFSC	STATUS,0
	GOTO	_00020_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00020_DS_:
	BTFSS	STATUS,0
	GOTO	_00021_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00021_DS_:
;	.line	182; "bingo.c"	GP4 = b3d;
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	MOVWF	r0x102E
	RRF	r0x102E,W
	BTFSC	STATUS,0
	GOTO	_00022_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00022_DS_:
	BTFSS	STATUS,0
	GOTO	_00023_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00023_DS_:
;	.line	183; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	186; "bingo.c"	limpiar();
	PAGESEL	_limpiar
	CALL	_limpiar
	PAGESEL	$
;;signed compare: left < lit(0xA=10), size=2, mask=ffff
;	.line	188; "bingo.c"	if (j >= 10) {
	BANKSEL	r0x102D
	MOVF	r0x102D,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00285_DS_
	MOVLW	0x0a
	SUBWF	r0x102C,W
_00285_DS_:
	BTFSS	STATUS,0
	GOTO	_00200_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	189; "bingo.c"	inicio = final(inicio);
	BANKSEL	r0x1028
	MOVF	r0x1028,W
	MOVWF	STK00
	MOVF	r0x1029,W
	PAGESEL	_final
	CALL	_final
	PAGESEL	$
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	STK00,W
	MOVWF	r0x1028
;	.line	190; "bingo.c"	limpiar();
	PAGESEL	_limpiar
	CALL	_limpiar
	PAGESEL	$
	GOTO	_00200_DS_
;	.line	194; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _limpiar
;   _delay
;   _delay
;   _limpiar
;   _delay
;   _delay
;   _limpiar
;   _delay
;   _delay
;   _limpiar
;   _delay
;   _delay
;4 compiler assigned registers:
;   r0x1025
;   r0x1026
;   STK00
;   r0x1027
;; Starting pCode block
S_bingo__final	code
_final:
; 2 exit points
;	.line	46; "bingo.c"	for (q = 0; q < 3; ++q) {
	BANKSEL	r0x1025
	CLRF	r0x1025
	CLRF	r0x1026
_00154_DS_:
;	.line	47; "bingo.c"	limpiar();
	PAGESEL	_limpiar
	CALL	_limpiar
	PAGESEL	$
;	.line	49; "bingo.c"	GP5 = 0x00; // Se prende en bajo
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
;	.line	50; "bingo.c"	GP0 = 1;
	BSF	_GPIObits,0
;	.line	51; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	52; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	53; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	54; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	57; "bingo.c"	GP5 = ~GP5; // Encender decenas
	BANKSEL	r0x1027
	CLRF	r0x1027
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00024_DS_
	BANKSEL	r0x1027
	INCF	r0x1027,F
_00024_DS_:
	BANKSEL	r0x1027
	COMF	r0x1027,W
	MOVWF	r0x1027
	RRF	r0x1027,W
	BTFSC	STATUS,0
	GOTO	_00025_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00025_DS_:
	BTFSS	STATUS,0
	GOTO	_00026_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00026_DS_:
;	.line	58; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	60; "bingo.c"	limpiar();
	PAGESEL	_limpiar
	CALL	_limpiar
	PAGESEL	$
;	.line	62; "bingo.c"	GP5 = ~GP5; // Encender decenas
	BANKSEL	r0x1027
	CLRF	r0x1027
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00027_DS_
	BANKSEL	r0x1027
	INCF	r0x1027,F
_00027_DS_:
	BANKSEL	r0x1027
	COMF	r0x1027,W
	MOVWF	r0x1027
	RRF	r0x1027,W
	BTFSC	STATUS,0
	GOTO	_00028_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00028_DS_:
	BTFSS	STATUS,0
	GOTO	_00029_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00029_DS_:
;	.line	63; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	66; "bingo.c"	GP5 = ~GP5; // Encender decenas
	BANKSEL	r0x1027
	CLRF	r0x1027
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00030_DS_
	BANKSEL	r0x1027
	INCF	r0x1027,F
_00030_DS_:
	BANKSEL	r0x1027
	COMF	r0x1027,W
	MOVWF	r0x1027
	RRF	r0x1027,W
	BTFSC	STATUS,0
	GOTO	_00031_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00031_DS_:
	BTFSS	STATUS,0
	GOTO	_00032_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00032_DS_:
;	.line	67; "bingo.c"	delay(100);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	46; "bingo.c"	for (q = 0; q < 3; ++q) {
	BANKSEL	r0x1025
	INCF	r0x1025,F
	BTFSC	STATUS,2
	INCF	r0x1026,F
;;signed compare: left < lit(0x3=3), size=2, mask=ffff
	MOVF	r0x1026,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00167_DS_
	MOVLW	0x03
	SUBWF	r0x1025,W
_00167_DS_:
	BTFSS	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	71; "bingo.c"	return inicio;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
;	.line	72; "bingo.c"	}
	RETURN	
; exit point of _final

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_bingo__limpiar	code
_limpiar:
; 2 exit points
;	.line	37; "bingo.c"	GP0 = 0x00;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	38; "bingo.c"	GP1 = 0x00;
	BCF	_GPIObits,1
;	.line	39; "bingo.c"	GP2 = 0x00;
	BCF	_GPIObits,2
;	.line	40; "bingo.c"	GP4 = 0x00;
	BCF	_GPIObits,4
;	.line	41; "bingo.c"	}
	RETURN	
; exit point of _limpiar

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __moduint
;5 compiler assigned registers:
;   STK02
;   STK01
;   STK00
;   r0x101D
;   r0x101E
;; Starting pCode block
S_bingo__generateRandomNumber	code
_generateRandomNumber:
; 2 exit points
;	.line	29; "bingo.c"	counter += 0xDEADBEEF;
	MOVLW	0xef
	BANKSEL	_counter
	ADDWF	_counter,F
	MOVLW	0xbe
	BTFSC	STATUS,0
	MOVLW	0xbf
	ADDWF	(_counter + 1),F
;	.line	30; "bingo.c"	unsigned int random = (counter % 100); // Limitacion del rango entre 0 y 99
	MOVLW	0x64
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	_counter,W
	MOVWF	STK00
	MOVF	(_counter + 1),W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
;;1	MOVWF	r0x101E
;	.line	31; "bingo.c"	return random;
	MOVWF	STK00
	MOVF	r0x101D,W
;	.line	32; "bingo.c"	}
	RETURN	
; exit point of _generateRandomNumber

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __divsint
;   __divsint
;5 compiler assigned registers:
;   r0x101D
;   STK00
;   r0x101E
;   STK02
;   STK01
;; Starting pCode block
S_bingo__num_decenas	code
_num_decenas:
; 2 exit points
;	.line	22; "bingo.c"	int num_decenas(int num) {
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
	MOVWF	r0x101E
;	.line	23; "bingo.c"	int decenas = num / 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101D,W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
;	.line	24; "bingo.c"	return decenas;
	MOVWF	r0x101E
	MOVWF	STK00
	MOVF	r0x101D,W
;	.line	25; "bingo.c"	}
	RETURN	
; exit point of _num_decenas

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __modsint
;   __modsint
;5 compiler assigned registers:
;   r0x101D
;   STK00
;   r0x101E
;   STK02
;   STK01
;; Starting pCode block
S_bingo__num_unidades	code
_num_unidades:
; 2 exit points
;	.line	16; "bingo.c"	int num_unidades(int num) {
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
	MOVWF	r0x101E
;	.line	17; "bingo.c"	int unidades = num % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101D,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
;	.line	18; "bingo.c"	return unidades;
	MOVWF	r0x101E
	MOVWF	STK00
	MOVF	r0x101D,W
;	.line	19; "bingo.c"	}
	RETURN	
; exit point of _num_unidades

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x101D
;   STK00
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;; Starting pCode block
S_bingo__delay	code
_delay:
; 2 exit points
;	.line	7; "bingo.c"	void delay(unsigned int tiempo) {
	BANKSEL	r0x101D
	MOVWF	r0x101D
	MOVF	STK00,W
	MOVWF	r0x101E
;	.line	11; "bingo.c"	for(m=0;m<tiempo;m++)
	CLRF	r0x101F
	CLRF	r0x1020
_00111_DS_:
	BANKSEL	r0x101D
	MOVF	r0x101D,W
	SUBWF	r0x1020,W
	BTFSS	STATUS,2
	GOTO	_00132_DS_
	MOVF	r0x101E,W
	SUBWF	r0x101F,W
_00132_DS_:
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3307: created from rifx:0x7fff4d4f0ca0
;	.line	12; "bingo.c"	for(n=0;n<1275;n++);
	MOVLW	0xfb
	BANKSEL	r0x1021
	MOVWF	r0x1021
	MOVLW	0x04
	MOVWF	r0x1022
_00109_DS_:
	MOVLW	0xff
	BANKSEL	r0x1021
	ADDWF	r0x1021,W
	MOVWF	r0x1023
	MOVLW	0xff
	MOVWF	r0x1024
	MOVF	r0x1022,W
	BTFSC	STATUS,0
	INCFSZ	r0x1022,W
	ADDWF	r0x1024,F
	MOVF	r0x1023,W
	MOVWF	r0x1021
	MOVF	r0x1024,W
	MOVWF	r0x1022
	MOVF	r0x1024,W
	IORWF	r0x1023,W
	BTFSS	STATUS,2
	GOTO	_00109_DS_
;	.line	11; "bingo.c"	for(m=0;m<tiempo;m++)
	INCF	r0x101F,F
	BTFSC	STATUS,2
	INCF	r0x1020,F
	GOTO	_00111_DS_
_00113_DS_:
;	.line	13; "bingo.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  575+  180 =   755 instructions ( 1870 byte)

	end
