# NSE26-392: submitted versions

| Folder | File | Content | Source |
|---|---|---|---|
| 01_original_submission | NSE26-392_original_submission.pdf | manuscript as first submitted | `paper_updated.tex` at commit 2547311 |
| 02_revision_1 | NSE26-392_R1_marked.pdf | revised manuscript with changes marked (Reviewer 1 blue, Reviewer 2 red, authors green) | `paper_updated.tex` at commit 0d51507 |
| 02_revision_1 | NSE26-392_R1_clean.pdf | revised manuscript, clean copy | same source, built with `\markedfalse` |
| 02_revision_1 | NSE26-392_R1_response_to_reviewers.pdf | point-by-point response to the reviewers | `response_to_reviewers.tex` at commit 0d51507 |

The PDF of the original submission was rebuilt from the sources of commit 2547311, the last commit before the revision. It matches the page references quoted by the reviewers (bootstrap analysis on page 15, Bernoulli argument on page 12, typo in the Fig. 2 caption).

The revision PDFs are produced by `build_revision.sh`.
