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
text_array := StrSplit(text_string, "`r`n","`t`r`n")


; Remove any empty elements in the text array
for index, value in text_array
	if (value = "")
		text_array.RemoveAt(index)


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
    sleep, 5
    Loop 10 {
        Send, {BackSpace}
        Send, {Delete}
    }
    Send, %word%
    Send, {Down}
    sleep,10
    
}
return