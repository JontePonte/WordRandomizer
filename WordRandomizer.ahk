#SingleInstance, force

#r::
; Cut text and put it inte text string
Clipboard:=""               ; Creal clipboard
Send, ^x                    ; Cut text with control C
ClipWait,                   ; Wait until clipboard is full
text_string := Clipboard    ; Save text variable

; Randomize the order and split the string into words for every enter
Sort, text_string, Random
text_array := StrSplit(text_string, "`r`n", " ") 

; Send words back to text dokument
for i, word in text_array {
    Send, %word%
    Send, {Enter}
    sleep,20
}
return