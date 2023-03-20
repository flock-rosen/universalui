# this is a script to build UniversalUI on PowerShell with GCC

# Write-Output "TODO: CHANGE SUBSYSTEM TO WINDOWS NOT CONSOLE FOR RELEASE BUT LEAVE DEBUG??"

$MODE=$args[0]

if ($MODE -eq "-STATIC") {
    Write-Output "STATIC Building UniversalUI program..."
   g++ -DUUI_BUILD .\App\main.cpp .\Source\UniversalUI.cpp .\Source\WinHost.cpp .\Source\WinRenderer.cpp .\Source\glad.c .\Source\glad_wgl.c .\..\UniversalUI-Source\uSimpleApplication.cpp .\..\UniversalUI-Source\uDesktopApplication.cpp .\..\UniversalUI-Source\uApplication.cpp .\..\UniversalUI-Source\CoreHost.cpp .\..\UniversalUI-Source\uWindow.cpp .\..\UniversalUI-Source\CoreRenderer.cpp .\..\UniversalUI-Source\uView.cpp .\..\UniversalUI-Source\AngeloOperations.cpp -o .\Build\main.exe -Wall -g -mconsole -lglu32 -lgdi32 -lopengl32  -I.\Include -I.\..\ --static -static-libgcc -static-libstdc++
    Write-Output "DONE!"
} elseif ($MODE -eq "-DLL") {
    Write-Output "DLL Building UniversalUI library..."
    g++ -DUUI_BUILD .\Source\UniversalUI.cpp .\Source\aRenderer.cpp .\Source\glad.c .\Source\uWindowManager.cpp .\..\UniversalUI-Source\uSimpleApplication.cpp .\..\UniversalUI-Source\uWindow.cpp .\..\UniversalUI-Source\uDesktopApplication.cpp .\..\UniversalUI-Source\uApplication.cpp -shared -mconsole -o .\Build\UniversalUI.dll -Wall -lgcc -lstdc++ -lglfw3 -lgdi32 -lopengl32  -I.\Include -I.\..\ -L.\Lib --static -static-libgcc -static-libstdc++  
    Write-Output "DONE!"
} elseif ($MODE -eq "-DEBUG") {
    Write-Output "DEBUG Building UniversalUI application..."
    g++ .\App\main.cpp -o .\Build\main.exe -Wall -mconsole -I.\..\ -L.\Build -lUniversalUI.dll --static -static-libgcc -static-libstdc++
    Write-Output "DONE!"
} elseif ($MODE -eq "-RELEASE") {
    Write-Output "RELEASE Building UniversalUI application..."
    g++ .\App\main.cpp -o .\Build\main.exe -Wall -mwindows -I.\..\ -L.\Build --static -static-libgcc -static-libstdc++ -lUniversalUI 
    Write-Output "DONE!"
} else {
    Write-Output "No arguments supplied.`nHelp:`n`t-STATIC for building a program all in one`n`t-DLL for building the UniversalUI DLL`n`t-DEBUG for building a debug UniversalUI application`n`t-STANDARD for building a standard UniversalUI application.`n"
}