$env:ASAN_SYMBOLIZER_PATH = "C:\Program Files\LLVM\bin\llvm-symbolizer.exe"

$file = $args[0]
mkdir -Force analysis | out-null

Write-Host "========================"
Write-Host "     Clang Analyzer"
Write-Host "========================"

clang $file --analyze -o .\analysis\$file.exe

Remove-Item -Recurse -Force -Confirm:$false analysis
mkdir -Force analysis | out-null

Write-Host "================================="
Write-Host "     Using Address Sanitizer"
Write-Host "================================="
clang $file -g -fsanitize=address -o .\analysis\$file.exe | out-null
& .\analysis\$file.exe

Write-Host "<Address Sanitizer Processed>"

Remove-Item -Recurse -Force -Confirm:$false analysis
mkdir -Force analysis | out-null

Write-Host "============================================="
Write-Host "     Using Undefined Behavior Sanitizer"
Write-Host "============================================="

clang $file -g -fsanitize=undefined -o .\analysis\$file.exe | out-null
$undef = & .\analysis\$file.exe

Write-Host "<Undefined Behavior Sanitizer Processed>"

Remove-Item -Recurse -Force -Confirm:$false analysis
