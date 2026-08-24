# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.0.1/conch-1.0.1-darwin-arm64.tar.gz"
      sha256 "43d372265e137aecb4f13db824761df130d9c6b3662e8481fb90ac2e8ef90562"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.0.1/conch-1.0.1-darwin-amd64.tar.gz"
      sha256 "5ef7c3484a9022a5a1424fe19c8a29b9c985d1ae91bda79f090dd6f1f008d8cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.0.1/conch-1.0.1-linux-amd64.tar.gz"
      sha256 "cebb06075b052cecee2aeb951edf5abe2fe0bd4c02f27fbb748f785cf9fb19eb"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.0.1/conch-1.0.1-linux-arm64.tar.gz"
      sha256 "1f863010f1a41e01a345a825713b6f382bec5cdd4671ae1017207f86cb7a2aaf"
    end
  end

  def install
    bin.install "conch"
    bin.install "conchd"
  end

  service do
    run [opt_bin/"conchd", "--localhost"]
    keep_alive false
    working_dir var
    log_path var/"log/conchd.log"
    error_log_path var/"log/conchd.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/conch --version")
    assert_match version.to_s, shell_output("#{bin}/conchd --version")
  end
end
