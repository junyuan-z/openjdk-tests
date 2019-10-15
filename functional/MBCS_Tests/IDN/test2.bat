@echo off
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem      https://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

SETLOCAL
SET PWD=%~dp0
SET CLASSPATH=%PWD%\IDN.jar
SET OUTPUT="output"
call %PWD%\set_variable.bat

for %%i in (%PWD%\win_%2_*_txt) do (
    %JAVA_BIN%\java Main2 %1 %2 %3 %4 %%i
    copy /b %OUTPUT% + toAscii.txt + toUnicode.txt %OUTPUT% > NUL 2>&1
)

%JAVA_BIN%\java Main %1 %2 %3 %4 

fc %PWD%\expected_Windows_%2.txt %OUTPUT% > fc.out 2>&1
exit %errorlevel%
