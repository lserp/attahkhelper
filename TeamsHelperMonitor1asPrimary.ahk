/*
All of this is working under specific assumptions:
- You are working with the Preview version of Teams (April 2020, this will be updated as Teams moves forward)
- You are the only presenter in the Teams meeting
- Your primary screen is the screen where Teams is running
*/

;General Variables
#HotkeyInterval 200

/*
===============================================================================
HOTKEY: CTRL + SHIFT + M
DESCRIPTION: mutes your microphone when Teams is not the application in focus
MEMORY CUE: M as in Mute
*/

^+m::
WinGet, active_id, ID, A
WinActivate, ahk_exe Teams.exe
Send ^+m
WinActivate, ahk_id %active_id%
return

/*
===============================================================================
HOTKEY: CTRL + SHIFT + V
DESCRIPTION: activates your webcam when Teams is not the application in focus
MEMORY CUE: V as in Video
*/

^+v::
WinGet, active_id, ID, A
WinActivate, ahk_exe Teams.exe
Send ^+o
WinActivate, ahk_id %active_id%
return

/*
===============================================================================
HOTKEY: CTRL + SHIFT + Q
DESCRIPTION: activates the chat window in the Teams meeting you're presenting
MEMORY CUE: Q as in Questions
*/
 
^+q::
WinActivate, ahk_exe Teams.exe
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
CoordMode, Mouse, Relative
MouseClick left, 2390, 145,,0
WinActivate, ahk_id %active_id%
return

/*
===============================================================================
HOTKEY: CTRL + SHIFT + S
DESCRIPTION: mutes all the participants in the Teams meeting you're presenting
MEMORY CUE: S as in Shut up
*/

; ^+s::
; WinActivate, ahk_exe Teams.exe
; WinGet, active_id, ID, A
; WinMaximize, ahk_id %active_id%
; DllCall("SetCursorPos", "int", 3708, "int", -1654) 
; MouseClick
; WinActivate, ahk_id %active_id%
; return


/*
===============================================================================
HOTKEY: CTRL + SHIFT + P
DESCRIPTION: activates the roster panel in the Teams meeting you're presenting
MEMORY CUE: P as in Participants
*/
^+p::
WinActivate, ahk_exe Teams.exe
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
CoordMode, Mouse, Relative
MouseClick left, 2290, 145,,0
WinActivate, ahk_id %active_id%
return


/*
===============================================================================
HOTKEY: CTRL + SHIFT + 1
DESCRIPTION: Kick off Screen 1 sharing
MEMORY CUE: 1 as in Screen 1
*/
^+1::
WinActivate, ahk_exe Teams.exe
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
CoordMode, Mouse, Relative
MouseClick left, 2910, 145,,0
Sleep, 1000
Send {Tab}`r
WinActivate, ahk_id %active_id%
return


/*
===============================================================================
HOTKEY: CTRL + SHIFT +  2
DESCRIPTION: Kick off Screen 2 sharing
MEMORY CUE: 2 as in Screen 2
*/
^+2::
WinActivate, ahk_exe Teams.exe
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
CoordMode, Mouse, Relative
MouseClick left, 2910, 145,,0
Sleep, 1000
Send {Tab}{Down}`r
WinActivate, ahk_id %active_id%
return

/*
===============================================================================
HOTKEY: CTRL + SHIFT +  X
DESCRIPTION: Stop Screen Sharing (WORKS ONLY IF MONITOR 1 IS YOUR SCREEN SHARING MONITOR)
MEMORY CUE: X as in eXit
*/
^+x::
WinActivate, ahk_exe Teams.exe
WinGet, active_id, ID, A
Send ^+{Space}
CoordMode, Mouse, Screen
MouseClick left, 2100, 50,,0
WinActivate, ahk_id %active_id%
WinMaximize, ahk_id %active_id%
return


/*
===============================================================================
HOTKEY: CTRL + SHIFT +  A
DESCRIPTION: Include System Audio
MEMORY CUE: A as in Audio
*/
^+a::
WinActivate, ahk_exe Teams.exe
WinGet, active_id, ID, A
Send ^+{Space}
CoordMode, Mouse, Screen
MouseClick left, 1900, 50,,0
return