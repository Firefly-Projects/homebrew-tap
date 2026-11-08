# Rendered by cargo xtask render-formula from the SHA256SUMS of the release it names. The next
# release replaces it, so a change belongs in packaging/homebrew/htmlspec.rb.in.
class Htmlspec < Formula
  desc "Validate, format, and archive specifications kept as HTML documents"
  homepage "https://github.com/Firefly-Projects/htmlspec"
  # Homebrew reads the version from the tarball addresses below. The binary embeds Mermaid, Vega,
  # Vega-Lite, and Vega-Embed, and the libraries bundled inside them, whose licenses are the
  # license field of crates/htmlspec-assets/Cargo.toml, with every text in THIRD-PARTY-LICENSES.
  # It is built from Rust crates, whose licenses CRATE-LICENSES credits and holds the texts of.
  # This is the two joined, and cargo xtask crate-notices --check refuses any other set.
  license all_of: ["MIT", "BSD-3-Clause", "ISC", "Apache-2.0", "Unlicense", "Zlib", "Unicode-3.0", "MIT-0", "MPL-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.1/htmlspec-1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "1f49ed155c95672e4e9aaf4002dd16faa7b22fa79e4101a1a417fbb78b0d94f7"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.1/htmlspec-1.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "01513bf80ac698eb0e76276a57b67745409761dd80b928ac34e77db529a5a2ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.1/htmlspec-1.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "50ca685b64647d530403e807c1af984341f83b9937d705877655dc7b61dde649"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.1/htmlspec-1.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38baefd75d2eb9e48d426ab4abb41b5fe0e08a908c65015c159a2699c01e6a00"
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
