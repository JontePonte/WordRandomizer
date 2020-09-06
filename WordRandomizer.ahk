#SingleInstance, force

#r::
Clipboard:=""               ; Creal clipboard
Send, ^x                    ; Cut text with control C
ClipWait,                   ; Wait until clipboard is full
text_string := Clipboard    ; Save text variable

text_array := StrSplit(text_string, "`r`n", " ") ; Split the string into words for every enter
for i, word in text_array {
    Send, %word%
    Send, {Enter}
    sleep,100
}
return