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
  version "0.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.5.1/memkeeper-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "0d45647396e16bd3de86c6bf3d9b6701fc8e347542806fd96eaa3714970a6021"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.5.1/memkeeper-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4526722095b8c138d237d0406d4e1c652d709845fd62fa8fddfcd0fde6791edc"
    end
  end

  def install
    bin.install "memkeeper"
  end

  test do
    assert_match "memkeeper", shell_output("#{bin}/memkeeper --version")
  end
end
