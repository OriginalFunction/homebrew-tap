# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.0/conch-1.3.0-darwin-arm64.tar.gz"
      sha256 "4af3a9a6862eabb16464dc95841743c1a24ddb796afaff757a11ef12d4d588de"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.0/conch-1.3.0-darwin-amd64.tar.gz"
      sha256 "bcab4c8753871f16d13da0f1be55e25e9ca7c05792d6bed159b211ac53f55e37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.0/conch-1.3.0-linux-amd64.tar.gz"
      sha256 "11a720f201655c9c6f337f28cf5f456292ecf8351ea3574ac818ecc2c23bf9e1"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.0/conch-1.3.0-linux-arm64.tar.gz"
      sha256 "49a78fa6a1dead199624e81686a4eddfc28c57ccd446651b3b9a24b117b67fac"
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
