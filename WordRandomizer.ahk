#SingleInstance, force

#r::
Clipboard:=""               ; Creal clipboard
Send, ^x                    ; Cut text with control C
ClipWait,                   ; Wait until clipboard is full
text_string := Clipboard    ; Save text variable
text_array := StrSplit(text_string, "`r`n", " ")
for i, word in text_array {
    MsgBox, ,,%word%,
    sleep,100
}
return