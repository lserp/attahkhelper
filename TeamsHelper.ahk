/*
All of this is working under specific assumptions:
- You are working with the Preview version of Teams (April 2020, this will be updated as Teams moves forward)
- You are the only presenter in the Teams meeting

IMPORTANT: this script is making use of mouse positions to implement its functionality, so it's highly depending on your setup. It will break from setup to setup. BUT, the principles and the functionalities are there, youjust need to spend a couple of minutes adapting it to your own setup. To do so, do the following:
- Fire up Windows Spy (included with Autohotkey)
- Record the mouse positions (in pixels) corresponding to where you want the click to happen (like where is the "Show Participants" button, for example)
- Modify the pixel reference in the DLLCall directive for the hotkeys below. I'm sure there are less jenky way of doing it, so please contribute :)
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
DllCall("SetCursorPos", "int", 2994, "int", -2010) 
MouseClick
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
DllCall("SetCursorPos", "int", 2870, "int", -2010) 
MouseClick
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
DllCall("SetCursorPos", "int", 3506, "int", -2010) 
MouseClick
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
DllCall("SetCursorPos", "int", 3506, "int", -2010) 
MouseClick
Sleep, 1000
Send {Tab}{Down}`r
WinActivate, ahk_id %active_id%
return