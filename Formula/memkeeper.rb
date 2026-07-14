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
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.3.0/memkeeper-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f1bfa316be0e7dc9fbd8b2fce180edde68008380f1d020834b43cddfd58cbfae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/teflon07/memkeeper/releases/download/v0.3.0/memkeeper-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "639dd518ccd14e9ea17d30885052dab44fcd0697ad3cb2841713fe2439ae6f4c"
    end
  end

  def install
    bin.install "memkeeper"
  end

  test do
    assert_match "memkeeper", shell_output("#{bin}/memkeeper --version")
  end
end
