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
  version "0.5.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.5.3/memkeeper-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "ce1a751891c02a6316ba908575f90887457456a3ca1c9ce7f1232626ca5f30b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.5.3/memkeeper-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "626a5178850fe349d14babc4e1319de57482391ca86fac7633d5a462958e1a87"
    end
  end

  def install
    bin.install "memkeeper"
  end

  test do
    assert_match "memkeeper", shell_output("#{bin}/memkeeper --version")
  end
end
