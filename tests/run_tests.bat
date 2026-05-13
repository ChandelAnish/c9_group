@echo off
echo Compiling ECU Simulator...
cd ..
gcc -Wall -Wextra -pedantic -std=c99 -Iinclude -o ecu_sim.exe src/main.c src/input.c src/mode.c src/control.c src/fault.c src/state.c src/log.c
if %errorlevel% neq 0 (
    echo Compilation failed!
    exit /b %errorlevel%
)
echo Compilation successful.
cd tests
python test_runner.py
pause
