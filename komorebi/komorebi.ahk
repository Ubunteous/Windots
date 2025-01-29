#Requires AutoHotkey v2.0.2

#SingleInstance Force
; #:win, !:alt, ^:ctrl, +:shift

; M-y rofi => !y::Send {LWin} (alt+y)
; M-! power menu => #y::ControlSend, ,!{F4},ahk_class Progman
; M-print flameshot => default in windows
; M-S-c show split keyboard layout pix
; M-q reload wm config => komorebic reload-configuration
; M-<num> go to workspace n => focus workspace <target>
; M-return promote (toggle) => promote/promote-focus
; M-<space> toggle fullscreen => toggle-maximize

; M-l/v rotslave => cycle-stack <direction>
; M-t (toggle tiling) => retile
; M-tab toggle workspace => focus-last-workspace
; Try cycle-send-to-workspace <direction>

; M-<dir> ou uni, switch in/to group => cycle-workspace <direction>
; M-C-<dir> switch to and move => move/send-workspace <target>

; M-(S)-m focus down/up => try either
; + promote-window <direction>
; + cycle-focus/move
; + move/focus <direction>
; + focus-stack-window <target>
; =====
; Emacs major bindings
; M-w (kill-ring-save) M-y (kill-ring)
; M-u (upcase) M-c (capitalise) M-l (lowercase)
; M-s / M-g (consult)
; M-n (tempel complete)
; M-o (ace-window)
; M-x (execute-extended-command)

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

;; open/close main tools
!e::run "explorer"
!+Enter::run "powershell" ; "wezterm"
!^c::Komorebic("minimize")
!c::Komorebic("close")

#HotIf WinActive("Emacs")
!c:: ; nothing. Required as Not WinActive("") does not work
#HotIf
; a::MsgBox "The active window's class is " WinGetClass("A")

!Enter::Komorebic("promote")
!Space::Komorebic("toggle-maximize")

!m::Komorebic("cycle-focus next")
!u::Komorebic("toggle-maximize"), Komorebic("cycle-focus next"), Komorebic("toggle-maximize")
!+m::Komorebic("cycle-focus previous")

; M-<dir> ou uni, switch in/to group => cycle-workspace <direction>
; M-C-<dir> switch to and move => move/send-workspace <target>

!Left::Komorebic("cycle-workspace previous")
!Right::Komorebic("cycle-workspace next")
!n::Komorebic("cycle-workspace previous")
!o::Komorebic("cycle-workspace next")

^!Left::Komorebic("cycle-move-to-workspace previous")
^!Right::Komorebic("cycle-move-to-workspace next")
!r::Komorebic("cycle-move-to-workspace previous") ; run "explorer" ; Komorebic("cycle-move-to-workspace previous")
!t::Komorebic("cycle-move-to-workspace next") ; run "explorer" ; Komorebic("cycle-move-to-workspace next")

; Workspaces
!+1::Komorebic("focus-workspace 0")
!+2::Komorebic("focus-workspace 1")
!+3::Komorebic("focus-workspace 2")
!+4::Komorebic("focus-workspace 3")

; Move windows across workspaces
!+^1::Komorebic("move-to-workspace 0")
!+^2::Komorebic("move-to-workspace 1")
!+^3::Komorebic("move-to-workspace 2")
!+^4::Komorebic("move-to-workspace 3")

; #HotIf WinActive("MozillaWindowClass")
; a::MsgBox "The active window's class is " WinGetTitle("A")
; #HotIf
; a::MsgBox "The active window's class is " WinGetTitle("A")

OpenAllApps() {
  Komorebic("focus-workspace 1")
  run "Firefox"
  WinWait "ahk_class MozillaWindowClass", ,10
  sleep 1000
  Komorebic("focus-workspace 2")
  run "Sourcetree"
  WinWait "Sourcetree", ,10
  Komorebic("focus-workspace 3")
  run "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv"
}


sc04e::OpenAllApps

;;;;;;;;;;;;;;
;; DEFAULTS ;;
;;;;;;;;;;;;;;

;; Focus windows
; !h::Komorebic("focus left")
; !j::Komorebic("focus down")
; !k::Komorebic("focus up")
; !l::Komorebic("focus right")

; !+[::Komorebic("cycle-focus previous")
; !+]::Komorebic("cycle-focus next")

; ; Move windows
; !+h::Komorebic("move left")
; !+j::Komorebic("move down")
; !+k::Komorebic("move up")
; !+l::Komorebic("move right")

; ; Stack windows
; !Left::Komorebic("stack left")
; !Down::Komorebic("stack down")
; !Up::Komorebic("stack up")
; !Right::Komorebic("stack right")
; !;::Komorebic("unstack")
; ![::Komorebic("cycle-stack previous")
; !]::Komorebic("cycle-stack next")

; ; Resize
; !=::Komorebic("resize-axis horizontal increase")
; !-::Komorebic("resize-axis horizontal decrease")
; !+=::Komorebic("resize-axis vertical increase")
; !+_::Komorebic("resize-axis vertical decrease")

; ; Manipulate windows
; !t::Komorebic("toggle-float")
; !f::Komorebic("toggle-monocle")

; ; Window manager options
; !+r::Komorebic("retile")
; !p::Komorebic("toggle-pause")