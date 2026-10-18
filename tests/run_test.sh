#!/usr/bin/env bash
set -u
set -o pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
APP="$PROJECT_DIR/build/app"
export LC_ALL=C
make -C "$PROJECT_DIR" || exit 1
[[ -x "$APP" ]] || { printf 'Brak pliku: %s\n' "$APP" >&2; exit 1; }
passed=0
failed=0
for dir in "$SCRIPT_DIR"/*/; do
    [[ -f "$dir/input.txt" && -f "$dir/expected.txt" ]] || continue
    printf '[SCENARIO] %s\n' "$(basename "$dir")"
    "$APP" < "$dir/input.txt" > "$dir/actual.txt" 2> "$dir/stderr.txt"
    status=$?
    if diff -u "$dir/expected.txt" "$dir/actual.txt"; then
        if (( status < 128 )); then
            printf '[PASS]\n'
            passed=$((passed + 1))
        else
            printf '[FAIL] Program terminated: %d\n' "$status"
            failed=$((failed + 1))
        fi
    else
        printf '[FAIL] exit code: %d\n' "$status"
        failed=$((failed + 1))
    fi
    if [[ -s "$dir/stderr.txt" ]]; then
        printf '[STDERR]\n'
        cat "$dir/stderr.txt"
    fi
    printf '==========\n'
done
total=$((passed + failed))
printf '\n[SCENARIOS PASS] %d/%d\n' "$passed" "$total"
printf '[SCENARIOS FAIL] %d/%d\n' "$failed" "$total"
(( total > 0 && failed == 0 ))
