# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.6/conch-1.3.6-darwin-arm64.tar.gz"
      sha256 "975b719c8af618f9890feb7ea45db1a638d617e43ea2ff086f00fe1d21917b36"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.6/conch-1.3.6-darwin-amd64.tar.gz"
      sha256 "b4e9499a986626efca7e1248ed25e937e1b8e9e1143ae7366d0ab1129a8097cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.6/conch-1.3.6-linux-amd64.tar.gz"
      sha256 "d837a7315f58515e51e3098394ba16894be27b85ae151716a5bb3b4e5a6f3eb0"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.6/conch-1.3.6-linux-arm64.tar.gz"
      sha256 "61226546b719da0ce0c3f106f2ab325c617e9756ce2df699cee0bda70e9d48b9"
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
