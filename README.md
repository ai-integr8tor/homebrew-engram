# Homebrew tap for Local Recall

This tap builds the self-hosted [Local Recall core](https://github.com/ai-integr8tor/engram) for macOS. It installs one native Go binary and does not require a hosted account, API subscription, Node.js, or vendor telemetry.

## Install from the current main branch

Until the first tagged release is published:

```bash
brew tap ai-integr8tor/engram
brew install --HEAD local-recall
```

## Use it with any MCP-capable IDE

Configure a local stdio server with:

```text
command: local-recall
args: mcp
```

Optional environment variables:

```bash
export LOCAL_RECALL_DATA_PATH="$HOME/.local/share/local-recall/memory.json"
export LOCAL_RECALL_WORKSPACE="personal"
```

To run the authenticated HTTP MCP and REST daemon:

```bash
export LOCAL_RECALL_TOKEN="replace-with-a-long-random-token"
local-recall serve
```

The daemon binds to `127.0.0.1:8787` by default.

## Packaging boundary

This repository should contain only Homebrew packaging and release checks. Product behavior belongs in `ai-integr8tor/engram`. After a `v0.1.0` core release exists, add a stable source archive and checksum while retaining the `head` build.

See `NOTICE.md` for imported-history attribution.
