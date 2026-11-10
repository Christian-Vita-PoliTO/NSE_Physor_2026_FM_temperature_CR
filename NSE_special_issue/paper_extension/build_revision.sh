#!/bin/bash
# Builds the three files required for the NSE26-392 revision, in build/:
#   paper_updated.pdf          revised manuscript, changes highlighted (marked)
#   paper_clean.pdf            clean copy (\markedfalse)
#   response_to_reviewers.pdf  point-by-point response (reads numbers from the marked .aux)
set -e
cd "$(dirname "$0")"
mkdir -p build
echo "[1/3] marked manuscript"
tectonic -X compile paper_updated.tex --outdir build --keep-intermediates --keep-logs > build/marked.out 2>&1 || { tail -20 build/marked.out; exit 1; }
echo "[2/3] clean manuscript"
sed 's/^\\newif\\ifmarked \\markedtrue/\\newif\\ifmarked \\markedfalse/' paper_updated.tex > paper_clean.tex
grep -q 'markedfalse' paper_clean.tex || { echo "switch to clean version not found"; rm -f paper_clean.tex; exit 1; }
tectonic -X compile paper_clean.tex --outdir build --keep-logs > build/clean.out 2>&1 || { tail -20 build/clean.out; rm -f paper_clean.tex; exit 1; }
rm -f paper_clean.tex
echo "[3/3] response letter"
tectonic -X compile response_to_reviewers.tex --outdir build --keep-logs > build/letter.out 2>&1 || { tail -20 build/letter.out; exit 1; }
for f in paper_updated paper_clean response_to_reviewers; do
  n=$(grep -cE 'Reference .* undefined|Citation .* undefined' build/$f.log 2>/dev/null || true)
  printf "  %-26s %s  (unresolved refs/cites in log: %s)\n" "$f.pdf" "$(ls -lh build/$f.pdf | awk '{print $5}')" "${n:-n/a}"
done
