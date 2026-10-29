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
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.0/htmlspec-1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "45233c33a8232923424879e6604733833b6dcd860eec62bb9aae7c1755cd9d92"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.0/htmlspec-1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "81660fa1c6fb8c251f27e92d03636faab922391ca243fa5729c70c4d98bd8283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.0/htmlspec-1.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3802923130b5d04684ba1c8f1ea64eb323392574882d6993b6703f8edfd54d30"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.3.0/htmlspec-1.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f5780126f7f33a2238094b4e211ab13dc26b52c7c0e9a44c8222b7dacc652911"
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
