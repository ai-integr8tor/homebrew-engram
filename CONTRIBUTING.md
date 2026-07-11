# Contributing

Keep this tap focused on building and validating Local Recall releases.

- Change product behavior in `ai-integr8tor/engram`, not in the Formula.
- Preserve the `head` build when adding stable release URLs.
- Verify source archive checksums before updating a stable version.
- Run `brew audit --strict --online local-recall` and `brew test local-recall` on macOS.
- Preserve `NOTICE.md` and historical Git attribution.
