# Rendered by scripts/render-formula from the SHA256SUMS of the release it names. The next
# release replaces it, so a change belongs in packaging/homebrew/htmlspec.rb.in.
class Htmlspec < Formula
  desc "Validate, format, and archive specifications kept as HTML documents"
  homepage "https://github.com/Firefly-Projects/htmlspec"
  # Homebrew reads the version from the tarball addresses below. The binary embeds Mermaid, Vega,
  # Vega-Lite, and Vega-Embed, and the libraries bundled inside them, whose licenses are the
  # license field of crates/htmlspec-assets/Cargo.toml, with every text in THIRD-PARTY-LICENSES.
  # It is built from Rust crates, whose licenses CRATE-LICENSES credits and holds the texts of.
  # This is the two joined, and scripts/render-formula refuses any other set.
  license all_of: ["MIT", "BSD-3-Clause", "ISC", "Apache-2.0", "Unlicense", "Zlib", "Unicode-3.0", "MIT-0", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.1.0/htmlspec-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e2a3242cfe033270720872424c9ca109213f1b49058a8719b3028c5d85ec8b04"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.1.0/htmlspec-1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5999e988c7e724e087f7b278aae4faa9e125abc3733f9e864e4b38e56f592271"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.1.0/htmlspec-1.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "28412b2056546328fa733cf4e7fc76db47c565191533cd98447c1d9d93606360"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.1.0/htmlspec-1.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5dadea5949471dae42d861bb2348b4251cecefde43feda94ffec846a2a0612f4"
    end
  end

  def install
    bin.install "htmlspec"
    prefix.install "LICENSE", "THIRD-PARTY-LICENSES", "CRATE-LICENSES"
  end

  test do
    assert_match "htmlspec #{version} (", shell_output("#{bin}/htmlspec --version")
  end
end
