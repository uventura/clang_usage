export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
export ASAN_OPTIONS=detect_leaks=1

out_dir="analysis"
target="./analysis/executable"

echo "========================="
echo "     Clang Analyzer"
echo "========================="

mkdir -p $out_dir
clang --analyze $1 -o $target
rm -rf $out_dir

echo "===================================="
echo "      Using Address Sanitizer"
echo "===================================="

mkdir -p $out_dir
clang -g -fsanitize=address $1 -o $target
$target
rm -rf $out_dir

echo "<Address Sanitizer Processed>"

echo "============================================="
echo "      Using Undefined Behavior Sanitizer"
echo "============================================="

mkdir -p $out_dir
clang -g -fsanitize=undefined $1 -o $target
$target
rm -rf $out_dir

echo "<Undefined Behavior Processed>"

echo "=================================="
echo "      Using Thread Sanitizer"
echo "=================================="

mkdir -p $out_dir
clang -g -fsanitize=thread $1 -o $target
$target
rm -rf $out_dir

echo "<Thread Sanitizer Processed>"
