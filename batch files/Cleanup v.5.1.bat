*********START CODE************

@ECHO OFF

del C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items*.* /Q pause

del /s /f /q C:\Windows\Prefetch\*.*

del /s /f /q C:\Windows\Temp\*.*

del /s /f /q %USERPROFILE%\appdata\local\temp\*.*


/Below command to Show the folder after deleted files

Explorer %userprofile%\Recent

Explorer C:\Windows\Prefetch

Explorer C:\Windows\Temp

Explorer %USERPROFILE%\appdata\local\temp


*********END CODE************