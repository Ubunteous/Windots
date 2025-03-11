#SingleInstance Force
#Requires AutoHotkey v2.0

; #:win, !:alt, ^:ctrl, +:shift
; Esc::ExitApp

;;;;;;;;;;;;;
;; IMPORTS ;;
;;;;;;;;;;;;;

#INCLUDE secret\mode_SJ.ahk

;;;;;;;;;;;;;;;;;
;;   COLEMAK   ;;
;;;;;;;;;;;;;;;;;

SC02e & SC002::1
SC032 & SC002::1
SC02f & SC002::^&
SC031 & SC002::^&

SC02e & SC003::2
SC032 & SC003::2

SC02e & SC004::3
SC032 & SC004::3

SC02e & SC005::4
SC032 & SC005::4

SC02e & SC006::5
SC032 & SC006::5

SC02e & SC007::6
SC032 & SC007::6

SC02e & SC008::7
SC032 & SC008::7

SC02e & SC009::8
SC032 & SC009::8

SC02e & SC00A::9
SC032 & SC00A::9

SC02e & SC00B::0
SC032 & SC00B::0

;;;;;

SC010::q
SC02e & SC010::+q
SC02f & SC010::^q
SC031 & SC010::^q
SC032 & SC010::+q

SC011::w
SC02e & SC011::+w
SC02f & SC011::^w
SC031 & SC011::^w
SC032 & SC011::+w

SC012::f
SC02e & SC012::+f
SC02f & SC012::^f
SC031 & SC012::^f
SC032 & SC012::+f

SC013::p
SC02e & SC013::+p
SC02f & SC013::^p
SC031 & SC013::^p
SC032 & SC013::+p

SC014::b
SC02e & SC014::+b
SC02f & SC014::^b
SC031 & SC014::^b
SC032 & SC014::+b

SC015::j
SC02e & SC015::+j
SC02f & SC015::^j
SC031 & SC015::^j
SC032 & SC015::+j

SC016::l
SC02e & SC016::+l
SC02f & SC016::^l
SC031 & SC016::^l
SC032 & SC016::+l

SC017::u
SC02e & SC017::+u
SC02f & SC017::^u
SC031 & SC017::^u
SC032 & SC017::+u

SC018::y
SC02e & SC018::+y
SC02f & SC018::^y
SC031 & SC018::^y
SC032 & SC018::+y

SC019::!

+SC01B::Send(Chr(0x60)),SendInput("u") ; ù
;; Only outputs: $
;; SC02e & SC01B::^$
;; SC032 & SC01B::^$

;;;;;;;;;;

SC01E::a
SC02e & SC01E::+a
SC02f & SC01E::^a
SC031 & SC01E::^a
SC032 & SC01E::+a

SC01F::r
SC02e & SC01F::+r
SC02f & SC01F::^r
SC031 & SC01F::^r
SC032 & SC01F::+r

SC020::s
SC02e & SC020::+s
SC02f & SC020::^s
SC031 & SC020::^s
SC032 & SC020::+s

SC021::t
SC02e & SC021::+t
SC02f & SC021::^t
SC031 & SC021::^t
SC032 & SC021::+t

;SC022::g
SC02e & SC022::+g
SC02f & SC022::^g
SC031 & SC022::^g
SC032 & SC022::+g

SC023::m
SC02e & SC023::+m
SC02f & SC023::^m
SC031 & SC023::^m
SC032 & SC023::+m

SC024::n
SC02e & SC024::+n
SC02f & SC024::^n
SC031 & SC024::^n
SC032 & SC024::+n

SC025::e
SC02e & SC025::+e
SC02f & SC025::^e
SC031 & SC025::^e
SC032 & SC025::+e

SC026::i
SC02e & SC026::+i
SC02f & SC026::^i
SC031 & SC026::^i
SC032 & SC026::+i

SC027::o
SC02e & SC027::+o
SC02f & SC027::^o
SC031 & SC027::^o
SC032 & SC027::+o

SC028::backspace

+SC02B::%

;;;;;;;;;;

SC02c::z
SC02e & SC02c::+z
SC02f & SC02c::^z
SC031 & SC02c::^z
SC032 & SC02c::+z

SC02d::x
SC02e & SC02d::+x
SC02f & SC02d::^x
SC031 & SC02d::^x
SC032 & SC02d::+x

SC02e::c
; SC02e & SC02e::+c
SC02f & SC02e::^c
SC031 & SC02e::^c
SC032 & SC02e::+c

SC02f::d
SC02e & SC02f::+d
; SC02f & SC02f::^d
SC031 & SC02f::^d
SC032 & SC02f::+d

SC030::v
SC02e & SC030::+v
SC02f & SC030::^v
SC031 & SC030::^v
SC032 & SC030::+v

SC031::k
SC02e & SC031::+k
SC02f & SC031::^k
; SC031 & SC031::^k
SC032 & SC031::+k

SC032::h
SC02e & SC032::+h
SC02f & SC032::^h
SC031 & SC032::^h
; SC032 & SC032::+h

SC033::,
; <+SC033::?
SC02E & SC033::?

SC034::.
SC02E & SC034::;
<+SC034::;

SC035::/
SC02E & SC035:::
<+SC035:::

;;;;;;;;;;;;;;;;;;;;;;;
;;   HOME ROW MODS   ;;
;;;;;;;;;;;;;;;;;;;;;;;

; SC011 & SC018::LWin ; M-y launcher
; SC011 & SC018::!Space ; M-y launcher
SC011 & SC018::#y ; M-y launcher
SC011 & SC023::!m ; M-m focus-next
SC011 & SC024::!n ; M-n prev-ws
SC011 & SC026::!o ; M-i (remap o) next-ws
SC011 & SC025::#e ; M-e file explorer
SC011 & SC017::!u ; M-u

SC018 & SC02d::!c ; kill (diminish)
SC018 & SC01F::!r ; M-r move window to previous ws
SC018 & SC021::!t ; M-t move window to next ws

SC011 & SC039::!space ; toggle fullscreen
SC018 & SC039::!space ; ditto

#+Enter::#e ; terminal (powershell or wezterm)
!+Enter::#e ; ditto

;;;;;;;;;;;;;;;;;
;;   MISFIRE   ;;
;;;;;;;;;;;;;;;;;

SC038 & SC011::!w ; M-w
SC038 & SC039::!Space ; M-<SPC>
SC038 & SC056::!< ; M-<
!+SC056::!> ; M->
SC038 & SC01C::!Enter ; alt+enter
; !SC02d::!x ; M-x ; problem C-c t
SC038 & SC034::!. ; Alt-. evilnc nerd commenter
SC038 & SC02e::+c ; M-c => replaced close-window by upcase

; More Anti missfires alt+<direction> for org
SC038 & SC14B::!Left
SC038 & SC14D::!Right

#HotIf WinActive("Explorer")
; do nothing. Avoid deleting stuff by mistake
^SC02F::Return
SC031 & SC02f::Return
#HotIf
; SC010::MsgBox "The active window's class is " WinGetClass("A")

;;;;;;;;;;;;;
;;   VIM   ;;
;;;;;;;;;;;;;

vim := 0

; ;; hopefully prevent error message when no window selected by komorebi
; checkVS() {
; isInVS := false
; 	try {
; 		isInVS := WinGetTitle("A")~="Microsoft Visual Studio$"
; 	}
; 	return isInVS
; }

;; enter or leave vim normal mode with n double press or s (insert mode)
#HotIf WinGetTitle("A") and WinGetTitle("A")~="Microsoft Visual Studio$" and not vim
SC024::
{
	if (A_PriorKey = "j" and A_TimeSincePriorHotkey < 200) {
		SendInput("{BS}")
		SendInput("{Escape}")
		global vim := 1
	}
	else {
		; MsgBox("Prior: " A_PriorKey " vs " A_ThisHotkey)
		SendInput("n")
	}
}
#HotIf

#HotIf WinGetTitle("A") and WinGetTitle("A")~="Microsoft Visual Studio$" and vim
SC023::SC14B ; left
^SC023::^m
SC024::SC150 ; down
^SC024::^n
SC025::SC148 ; up
^SC025::^e
SC026::SC14D ; right
^SC026::^i

; C-l => C-M l
^SC016::^!l
SC02F & SC016::^!l

SC020::global vim := 0 ; s => oral od 
SC031::^x ; r => C-x
^SC031::k ; r => C-x
SC013::^v ; p => C-v
^SC013::p ; p => C-v
SC017::^z ; u => C-z
^SC017::u ; u => C-z
#HotIf

;;;;;;;;;;;;;;
;;   MISC   ;;
;;;;;;;;;;;;;;

; Ctrl+Windows+<direction> (send to worspace)
#^SC14B::^!Left
#^SC15B::^!Right

; Shift+Space
; SC02f & SC039::^Space

; swap win and alt
SC15B::LAlt
SC038::LWin

; set CapsLock to Control key
sc03a::control

; Quit
;^Esc::Suspend
;+Esc::Run "komorebic stop"
;!Esc::Run "komorebic start"
; sc029::run("komorebic stop"), Suspend()

;;;;;;;;;;;
;; MOUSE ;;
;;;;;;;;;;;

; General
+WheelUp::^y
+WheelDown::^z

+XButton2::!Up
+XButton1::!Down

^Up::PgUp
^Down::PgDn

#InputLevel 1
Esc::
{
	global tabCount := 1  
	Send "{Blind}{Esc}"  
}

Ctrl & XButton2::
{
	Send "^k"
	Sleep "50"
	Send "^n"
}

+!^F1::
{
	if WinExist("ahk_exe devenv.exe")
	{
		if WinActive("ahk_exe devenv.exe")
			{
				 Send "{Alt Down}"
				 Send "{Tab}"
				 Send "{Alt Up}"
			}
		else
			WinActivate ; Use the window found by WinExist.
	}
}

^+x::
{
	old_clipboard := A_Clipboard	; Sauvegarde l'intégralité du presse-papiers
	Send "^x"						; Copie la sélection actuelle
	Sleep "100"
	ClipWait
	selected_text := A_Clipboard	   ; Stocke le texte sélectionné
	A_Clipboard := old_clipboard	   ; Remet l'ancien contenu
	Sleep "100"
	ClipWait
	Send "^v"						; Colle l'ancien contenu
	Sleep "100"
	ClipWait
	A_Clipboard := selected_text	   ; Remet le texte sélectionné dans le presse-papiers
	ClipWait
}

;;;;;;;;;;;;;;;;
;; MOUSE SIDE ;;
;;;;;;;;;;;;;;;;

; + 1 => F13 => C-<F3>
; + 2 => F14 => F3
; + 3 (free) => F15 => F20
; + 4 (free) => F16 => Enter
; + 5 => F17 => F18
; + 6 (free) => F18 => F21
; + 7 => F19 => F23
; + 8 => F20 => S-F12
; + 9 => F21 => F22
; + 10 => F22 => F19

F13::^F3
F14::F3
; F15::free
F16::ENTER ;; free

F17::
{
	static isActive := false
		
	if (!isActive) {
	Send "^{Tab}"

		isActive := true
		Send "{Ctrl Down}"
		SetTimer SendCtrlTabSafely, 400
	}
		
	KeyWait "F17"
		
	if (isActive) {
		SetTimer SendCtrlTabSafely, 0
		Send "{Ctrl Up}"
		isActive := false
	}
}

SendCtrlTabSafely()
{
	if (GetKeyState("F18", "P")) {
		Send "{Tab}"
	} else {
		SetTimer SendCtrlTabSafely, 0
		Send "{Ctrl Up}"
	}
}

global tabCount := 1

!^+F18::
{
	Send "{Ctrl down}"
	global tabCount
	Loop tabCount
	{
		Sleep "20"
		Send "{Tab}"
		Sleep "20"
	}
	tabCount++	
	Send "{Ctrl up}"
}

F20::+F12

F21::
{
	static isActive := false
		
	if (!isActive) {
	Send "!{Tab}"

		isActive := true
		Send "{Alt Down}"
		SetTimer SendTabSafely, 400
	}
		
	KeyWait "F21"
		
	if (isActive) {
		SetTimer SendTabSafely, 0
		Send "{Alt Up}"
		isActive := false
	}
}

SendTabSafely()
{
	if (GetKeyState("F21", "P")) {
		Send "{Tab}"
	} else {
		SetTimer SendTabSafely, 0
		Send "{Alt Up}"
	}
}

^F21::F5

F22::
{
	static isActive := false
		
	if (!isActive) {
	Send "!{Tab}"

		isActive := true
		Send "{Alt Down}"
		SetTimer SendTabSafely, 400
	}
		
	KeyWait "F22"
		
	if (isActive) {
		SetTimer SendTabSafely, 0
		Send "{Alt Up}"
		isActive := false
	}
}

;;;;;;;;;;;;;;;;;
;; MOUSE FRONT ;;
;;;;;;;;;;;;;;;;;

F23::F10 ;; free

F24::
{
	Click
	Sleep "50"
	Send "{F12}"
}
^F24::
{
	Click
	Sleep "50"
	Send "+{F12}"
}

; +F24::
; {
; 	Send "{Blind}{Shift Up}" ; Relache temporairement Shift
; 	Sleep "50"
;     Click ; Effectue un clic sans Shift actif
;     Send "{Blind}{Shift Down}" ; Réactive Shift si nécessaire
; 	Sleep "50"
; 	Send "!{F12}"
; 	KeyWait "Shift"
;     Send "{Esc}" ; Envoie la touche Échap une fois Shift relâché
; }