# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.7/conch-1.3.7-darwin-arm64.tar.gz"
      sha256 "31c80da6dbd79d9b49c93c7c54b3022a696d29b75bae4e0ea9a0dc5b21ee5d2b"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.7/conch-1.3.7-darwin-amd64.tar.gz"
      sha256 "65019573bf76a5d21b7ab2b5338b65b6169aed207c35fbe66c2f0d238a4b4b84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.7/conch-1.3.7-linux-amd64.tar.gz"
      sha256 "db97c07c3e3171543bdf671a69822b9f2d2e3d5cd0907be18fc2c02fce9f67a3"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.7/conch-1.3.7-linux-arm64.tar.gz"
      sha256 "337231b5dddf7ba9fb4ccde47fd5125548bbdc517d78e0d36e1f0c3f70f38791"
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
