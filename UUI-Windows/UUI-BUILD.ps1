# this is a script to build Universal UI on PowerShell with GCC

Write-Output "TODO: CHANGE SUBSYSTEM TO WINDOWS NOT CONSOLE FOR RELEASE BUT LEAVE DEBUG??"

$MODE=$args[0]

if ($MODE -eq "-STATIC") {
    Write-Output "STATIC Building UniversalUI program..."
   g++ .\app\main.cpp .\source\glad.c -o .\build\main.exe -Wall -g -mwindows --static -static-libgcc -static-libstdc++ -lglfw3 -lgdi32 -lopengl32  -I.\include -I.\..\ -L.\lib
    Write-Output "DONE!"
} elseif ($MODE -eq "-DLL") {
    Write-Output "DLL Building UniversalUI library..."
    g++ -DUUI_BUILD .\source\UniversalUI.cpp .\source\glad.c -shared -mconsole -o .\build\UniversalUI.dll -Wall -lgcc -lstdc++ -lglfw3 -lgdi32 -lopengl32  -I.\include -I.\..\ -L.\lib --static -static-libgcc -static-libstdc++
    Write-Output "DONE!"
} elseif ($MODE -eq "-DEBUG") {
    Write-Output "DEBUG Building UniversalUI application..."
    g++ .\app\main.cpp -o .\build\main.exe -Wall -mconsole -I.\..\ -L.\build -lUniversalUI
    Write-Output "DONE!"
} else {
    Write-Output "No arguments supplied.`nHelp:`n`t-STATIC for building a program all in one`n`t-DLL for building the UniversalUI DLL`n`t-DEBUG for building a debug UniversalUI application`n`t-STANDARD for building a standard UniversalUI application.`n"
}