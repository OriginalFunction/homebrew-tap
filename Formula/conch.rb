# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.1.0/conch-1.1.0-darwin-arm64.tar.gz"
      sha256 "ec5e98b41bd4d15d146221a2fdaad18e032e6d5948e03a1811c8b9425d22c562"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.1.0/conch-1.1.0-darwin-amd64.tar.gz"
      sha256 "2166785240f0340d310846ea6934ab9761d84c4a7d040cb1f04ba0c6e862f76d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.1.0/conch-1.1.0-linux-amd64.tar.gz"
      sha256 "c6bf763165434d3d8a0b7a06bafd35321606b684165de31df6196e59be26089a"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.1.0/conch-1.1.0-linux-arm64.tar.gz"
      sha256 "9df539ab67aa1e6fbb7bb355c264e668c9e5c63e2938e9209b73977a1e9b97b1"
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
