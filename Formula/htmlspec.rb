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
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.4.0/htmlspec-1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "640036158d308075adac337d5a3ce6d256b4659bf5c136ba4a45d028dc44f92e"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.4.0/htmlspec-1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "ac0ef5fa8ffa7c7f4586130255ba89fec3d6f4852a17449fa254392087501902"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.4.0/htmlspec-1.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8f89db43015c6dedec483f25a6257c0f7dfb72a8d022c01d308303e6e01a4a3b"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.4.0/htmlspec-1.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a65e8b15f7989ec6f3e8fde2d48c3ef022cc307238f470ca98e0d946d28091d"
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
