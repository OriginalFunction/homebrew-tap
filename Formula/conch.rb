# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.8/conch-1.3.8-darwin-arm64.tar.gz"
      sha256 "4d584c6d52a68c165ee70e06281c56a822c9cecdcfce307e141bca4d4ceff6c2"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.8/conch-1.3.8-darwin-amd64.tar.gz"
      sha256 "d4346a782a4e8521347f8ece64f1d1e9110bc6229156344fb384f64e5857933a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.8/conch-1.3.8-linux-amd64.tar.gz"
      sha256 "b1949989bfa40fb7ac4a180c37c1075cf22fdb460535a0b4cf4f129dc1366713"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.8/conch-1.3.8-linux-arm64.tar.gz"
      sha256 "7a867984d933741da9be416858174494f5d6f7dd6322d57b8aa1e94daa2f83e0"
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
