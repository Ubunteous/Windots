#SingleInstance Force
#Requires AutoHotkey v2.0

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
	A_Clipboard := selected_text	   ; Remet le texte s lectionn  dans le presse-papiers
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

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

F13::^F3
; F14::Send "^m^m" ;; C-m C-m. was F3
; ^F14::Send "^m^o" ;; C is pressed by the user

F14::Send "{LButton}^{SC023}^{SC023}{LControl}" ;; "^m^m" ;; C-m C-m. was F3
^F14::Send "{LButton}^{SC023}^{SC027}{LControl}" ;; C is pressed by the user

F15::Komorebic("cycle-workspace next")
F16::Komorebic("cycle-workspace previous")
^F15::Komorebic("cycle-move-to-workspace next")
^F16::Komorebic("cycle-move-to-workspace previous")
+F16::ENTER

F17::
{
	static isActive := false

	if (!isActive) {
	Send "!{Tab}"

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
	if (GetKeyState("F17", "P")) {
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
F21::^F21 ;; sync solution explorer with active document

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

SendTabSafely()
{
	if (GetKeyState("F22", "P")) {
		Send "{Tab}"
	} else {
		SetTimer SendTabSafely, 0
		Send "{Alt Up}"
	}
}

^F22::F5

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
;     Send "{Blind}{Shift Down}" ; R active Shift si n cessaire
; 	Sleep "50"
; 	Send "!{F12}"
; 	KeyWait "Shift"
;     Send "{Esc}" ; Envoie la touche  chap une fois Shift rel ch
; }
