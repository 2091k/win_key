@echo off

title 删除此电脑系统快捷文件夹 - 管理员模式
color 0A

echo ==============================================
echo  警告：该脚本仅删除"此电脑"中的快捷入口，不删除实际文件！
echo.
echo  按任意键开始执行（直接关闭窗口可终止操作）
echo ==============================================
pause > nul

echo.
echo 正在删除注册表中的快捷入口项...

:: 1. 删除当前用户注册表中的对应项（无需管理员也可部分生效）
:: 3D对象
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f > nul 2>&1
:: 视频（你修改后的CLSID）
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f > nul 2>&1
:: 图片
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24AD3AD4-A569-4530-98E1-AB02F9417AA8}" /f > nul 2>&1
:: 文档（你修改后的CLSID）
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f > nul 2>&1
:: 音乐
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3DFDF296-DBEC-4FB4-81D1-6A3438BCF4DE}" /f > nul 2>&1
:: 下载（你修改后的CLSID）
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f > nul 2>&1
:: 桌面
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f > nul 2>&1

:: 2. 删除本地机器注册表中的对应项（需要管理员权限，确保完全删除）
:: 3D对象
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f > nul 2>&1
:: 视频（你修改后的CLSID）
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f > nul 2>&1
:: 图片
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24AD3AD4-A569-4530-98E1-AB02F9417AA8}" /f > nul 2>&1
:: 文档（你修改后的CLSID）
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f > nul 2>&1
:: 音乐
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3DFDF296-DBEC-4FB4-81D1-6A3438BCF4DE}" /f > nul 2>&1
:: 下载（你修改后的CLSID）
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f > nul 2>&1
:: 桌面
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f > nul 2>&1

echo 注册表项删除完成，正在重启资源管理器使修改生效...
:: 终止当前资源管理器进程并重启
taskkill /f /im explorer.exe > nul 2>&1
start explorer.exe

echo.
echo ==============================================
echo  操作执行完成！
echo  1. 打开"此电脑"即可查看快捷文件夹是否已消失
echo  2. 实际文件仍保存在 C:\Users\你的用户名\ 目录下
echo ==============================================
pause > nul