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
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.2/htmlspec-1.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "81cbc4277073befee58eaead84001c4e23c97603a1b9ce773fa9727bbd145842"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.2/htmlspec-1.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "43a18d51f204c89bb33263baca834315bcba402d0baa593cf7bcfeb5b40ef108"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.2/htmlspec-1.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3ef9d01e50f1871f463a2a5ae40be7e028851ef7356693e3b22c98214f04a96a"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.2/htmlspec-1.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7f26bf66222e4edd70859490bd1cb77d730be8682e78c26feb575ca6cad612be"
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
