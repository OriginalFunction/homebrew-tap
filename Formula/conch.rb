# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.1/conch-1.3.1-darwin-arm64.tar.gz"
      sha256 "17a1e62e8f31fe5f7656afa21d55e60408c80f96d782ba17c978bdf106b24ab7"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.1/conch-1.3.1-darwin-amd64.tar.gz"
      sha256 "e5b2c41f0899dba1fe0b523481feea69aacfaf8440e72f692980a00725f3235a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.1/conch-1.3.1-linux-amd64.tar.gz"
      sha256 "47f7a2758b64f4faa7a13350f70239c0d8652ffc768605b2c21ba8557684761d"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.1/conch-1.3.1-linux-arm64.tar.gz"
      sha256 "ddcabd31824f2d6a0ed715f2bb3898a23bd40dacdeb9dbb59f1f910c984bc89c"
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
