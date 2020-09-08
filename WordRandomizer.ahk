#SingleInstance, force

#r::
KeyWait, #, L
sleep, 1000
; Cut text and put it inte text string
Clipboard:=""               ; Creal clipboard
Send, ^c                    ; Copy text with control C
ClipWait,                   ; Wait until clipboard is full
text_string := Clipboard    ; Save text variable

; Randomize the order and split the string into words for every enter
Sort, text_string, Random
text_array := StrSplit(text_string, "`r`n", " " "`n" "")

; Send words back to text dokument
Send, {LCtrl Down}
Send, {LShift Down}
Send, {LAlt Down}
Send, t
sleep, 20
Send, s
sleep, 20
Send, {LCtrl Up}
Send, {Shift Up}
Send, {LAlt Up}

for i, word in text_array {
    ; if (%word% != ""){
    ;     a := 1
    ; }
    ; else {
    ;     Continue
    ; }
    sleep, 10
    Loop 10 {
        Send, {BackSpace}
        Send, {Delete}
    }
    Send, %word%
    Send, {Down}
    sleep,20
}
return