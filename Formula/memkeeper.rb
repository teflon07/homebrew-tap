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
  version "0.2.13"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.2.13/memkeeper-v0.2.13-aarch64-apple-darwin.tar.gz"
      sha256 "a3569fff9b444ddcce8b234099513e47de5c6fdecf22c021a42dbcfd03692f5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.2.13/memkeeper-v0.2.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abd474cd2658984f8ee63071707cf8ab78952806f7ef9ad6da0ec8a581a40407"
    end
  end

  def install
    bin.install "memkeeper"
  end

  test do
    assert_match "memkeeper", shell_output("#{bin}/memkeeper --version")
  end
end
