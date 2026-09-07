# Generated from packaging/homebrew/conch.rb.in by scripts/release-artifacts.sh.
# Checksums are SHA-256 of release tarballs, not hand-edited.
class Conch < Formula
  desc "Floor-controlled message bus for AI agents"
  homepage "https://github.com/OriginalFunction/Conch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.2/conch-1.3.2-darwin-arm64.tar.gz"
      sha256 "51bdfac4eea22a5ed00329d3350c518d2deab313d4c529277f81e4b71567af62"
    end
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.2/conch-1.3.2-darwin-amd64.tar.gz"
      sha256 "d3cf25639217f6dbc2365bc8bda032b0cc51c2519c2f09a568487d2ae11472a8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.2/conch-1.3.2-linux-amd64.tar.gz"
      sha256 "fb28abfbf70ecd2b1049be2eec5c9d28b3132fbb56063b10a04492ddd6232f54"
    end
    on_arm do
      url "https://github.com/OriginalFunction/Conch/releases/download/v1.3.2/conch-1.3.2-linux-arm64.tar.gz"
      sha256 "87d77b234ea02fc1991fafb4d7e36a442b7606556336a7bd91fd105891701649"
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
