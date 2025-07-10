@echo off
setlocal

:: 创建临时目录
set OUTPUT_DIR="build"
mkdir "%OUTPUT_DIR%"

:: 编译程序到临时目录
go build -o "%OUTPUT_DIR%\memos.exe" bin/memos/main.go

:: 检查编译是否成功
if %ERRORLEVEL% neq 0 (
    echo 编译失败!
    rmdir /S /Q "%OUTPUT_DIR%"
    exit /b 1
)

:: 运行程序
"%OUTPUT_DIR%\memos.exe"

:: 清理临时文件（可选）
@REM rmdir /S /Q "%OUTPUT_DIR%"

endlocal