# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.4/conch-1.3.4-darwin-arm64.tar.gz"
      sha256 "d0fd22b064f80b4695f9c2330c56d973f92b4179b360ee7c04f4654be6b6ab6d"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.4/conch-1.3.4-darwin-amd64.tar.gz"
      sha256 "455d398ca750fb5df2c274b6c383c1d71dd06f80bc60c9b7c154ff7d28e53ea2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.4/conch-1.3.4-linux-amd64.tar.gz"
      sha256 "128955c03d5261c7dd9b0b02bd731a74cda7735369340d3f8dc2335e3aca5b04"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.4/conch-1.3.4-linux-arm64.tar.gz"
      sha256 "d67e820d94216abc3f72433b9149d2b8ca546ccc84e0cbe32f05cb8a261c5cc6"
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
