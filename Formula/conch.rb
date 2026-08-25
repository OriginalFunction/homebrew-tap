# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.0/conch-1.2.0-darwin-arm64.tar.gz"
      sha256 "608b3f6c9b4dc8242c3809dc4b02b282ac0ecd3e5dd021f225a44e754e9e3dd8"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.0/conch-1.2.0-darwin-amd64.tar.gz"
      sha256 "cdff505d84923614ed791bdc869efffba8fd9b7bd12099e393ec80bb3aea7757"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.0/conch-1.2.0-linux-amd64.tar.gz"
      sha256 "573d5b0c5503696d519edcd7d37c1f2d484240537271625b956bd38082116dfb"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.2.0/conch-1.2.0-linux-arm64.tar.gz"
      sha256 "db91c0f3c5775543d3a05da5963fbe22062c8a84a3b75143354a0058bbbc391a"
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
