git clone https://github.com/fusetools/fuselibs-public project
cd project
build.bat
powershell -Command "Invoke-WebRequest http://downloads.fdossena.com/geth.php?r=mesa-latest -OutFile mesa.zip"
powershell -Command "Expand-Archive mesa.zip mesa"
powershell -Command "Get-ChildItem -Path Source -Recurse -Include *Test.unoproj | Select-Object -ExpandProperty DirectoryName | Foreach-Object { $buildDir = Join-Path $_ build\Test\DotNet; New-Item -Force -ItemType directory -Path $buildDir | Out-Null; Copy-Item -Path mesa\opengl32.dll -Destination (Join-Path $buildDir opengl32.dll) }"
