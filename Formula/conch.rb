# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.2/conch-1.2.2-darwin-arm64.tar.gz"
      sha256 "6142a41c08b740aa7ebcdfea03f49e28375bb4caa468a25dc1094573d73fa5f4"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.2/conch-1.2.2-darwin-amd64.tar.gz"
      sha256 "71cdd090e3f077cb657b4d7ac68de98c7c7e4e8fc40cdf86523f244abfc5e000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.2/conch-1.2.2-linux-amd64.tar.gz"
      sha256 "67924a4de508f5af442ca9267a28371cfc6e7fe0b4a248cbfb790b1753d7d06a"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.2/conch-1.2.2-linux-arm64.tar.gz"
      sha256 "bba1612a9df73aecf6e11a09e885a64860bab67fc26fcfe33e1b4f9094d0d8e9"
    end
  end

  def install
    bin.install "conch"
    bin.install "conchd"
  end

  service do
    run [opt_bin/"conchd", "--localhost"]
    keep_alive true
    working_dir var
    log_path var/"log/conchd.log"
    error_log_path var/"log/conchd.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/conch --version")
    assert_match version.to_s, shell_output("#{bin}/conchd --version")
  end
end
