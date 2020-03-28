@ECHO OFF
REM Copyright 2020 Google LLC
REM
REM Licensed under the Apache License, Version 2.0 (the "License");
REM you may not use this file except in compliance with the License.
REM You may obtain a copy of the License at
REM
REM      https://www.apache.org/licenses/LICENSE-2.0
REM
REM Unless required by applicable law or agreed to in writing, software
REM distributed under the License is distributed on an "AS IS" BASIS,
REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM See the License for the specific language governing permissions and
REM limitations under the License.

SETLOCAL enabledelayedexpansion

SET VSWHERE_PATH="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
for /f "usebackq tokens=*" %%i in (`%VSWHERE_PATH% -latest -property installationPath`) do (
  SET VSINSTALL_PATH=%%i
)
SET VCVARS_PATH="%VSINSTALL_PATH%\VC\Auxiliary\Build\vcvarsall.bat"
CALL %VCVARS_PATH% %MSVC_ARCH%

cmake %*

EXIT /B %ERRORLEVEL%
