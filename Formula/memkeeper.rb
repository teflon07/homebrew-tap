# Homebrew formula for memkeeper — install into a tap repo:
#   teflon07/homebrew-tap → Formula/memkeeper.rb
# Then: brew install teflon07/tap/memkeeper
#
# Installs the prebuilt, self-contained release binary (semantic ONNX bundled).
# Run `memkeeper pull-models` after install for on-device semantic search.
# Bump `version` + both sha256 values on each release (or automate from the
# release's .sha256 assets).
class Memkeeper < Formula
  desc "Local-first memory for AI agents: on-device hybrid retrieval over one SQLite file"
  homepage "https://github.com/teflon07/memkeeper"
  version "0.2.9"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.2.9/memkeeper-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "3555235ae44a306aadef27d6336c4239fdfd04dba86ea78338729c295ac2f6fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.2.9/memkeeper-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8d9eadb7ae4194107a9183c2a81d3dca60a508786af6121e468f6d9176a14e5"
    end
  end

  def install
    bin.install "memkeeper"
  end

  test do
    assert_match "memkeeper", shell_output("#{bin}/memkeeper --version")
  end
end
