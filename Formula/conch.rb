# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.3/conch-1.3.3-darwin-arm64.tar.gz"
      sha256 "350267caa6c66347c97c75e001e00edab4cc19509b58c842da8cee67e652b7e9"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.3/conch-1.3.3-darwin-amd64.tar.gz"
      sha256 "6d2e0cc9b145ec5f76e128e20a6028426cef2c18b03cebcfc5d6501862cefe98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.3/conch-1.3.3-linux-amd64.tar.gz"
      sha256 "b62c8a78696c89711320623c5013481c9ba39825ed5031d9738eebf8bee01479"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.3/conch-1.3.3-linux-arm64.tar.gz"
      sha256 "c8265c90a6893d2dc19c4db2e2d5c4c822c4d055bdbc0ba1051c3ec9e7501ca4"
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
