# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.5/conch-1.3.5-darwin-arm64.tar.gz"
      sha256 "b3628951d0e7ddb8b3956bbd4b6b054ca08bf3e3bb76f34859134c912f5d6ed5"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.5/conch-1.3.5-darwin-amd64.tar.gz"
      sha256 "3af8936a4819fda166fcf484feef450b0ece99ea04266aa1b30149104ff25703"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.5/conch-1.3.5-linux-amd64.tar.gz"
      sha256 "499edcadabccf49008396afe134faf4d69d49d91fed6b648da0b8034e58668ed"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.5/conch-1.3.5-linux-arm64.tar.gz"
      sha256 "7062d5f69ff85e93a6c3e54ada925cb3338f0830521e5ad5d5288ea1599204c3"
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
