#SingleInstance, force

#r::
Clipboard:=""
Send, ^x
ClipWait,
text_string := Clipboard
MsgBox, ,,%text_string%,
return