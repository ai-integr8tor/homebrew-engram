class LocalRecall < Formula
  desc "Self-hosted conversation memory for AI tools over MCP and REST"
  homepage "https://github.com/ai-integr8tor/engram"
  license "MIT"
  head "https://github.com/ai-integr8tor/engram.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/local-recall"
  end

  def caveats
    <<~EOS
      Connect an MCP-capable IDE over stdio with:
        command: local-recall
        args: mcp

      The default data file is under your user configuration directory.
      Override it with LOCAL_RECALL_DATA_PATH when needed.

      To run the loopback HTTP MCP and REST daemon:
        export LOCAL_RECALL_TOKEN="replace-with-a-long-random-token"
        local-recall serve
    EOS
  end

  test do
    request = <<~JSON
      {"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-11-25","capabilities":{},"clientInfo":{"name":"homebrew-test","version":"1"}}}
    JSON
    output = pipe_output("#{bin}/local-recall mcp", request, 0)
    assert_match '"name":"local-recall"', output
  end
end
