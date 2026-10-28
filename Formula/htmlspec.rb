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
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.2.1/htmlspec-1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "26cc573f4805dfc16822d82732e2def2bebeb487e0fbc7b049f48c7a6d82be1d"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.2.1/htmlspec-1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "5e81d4f634ca2f0ad427882b6453675930d87d84367f1b338519140bd6598f8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.2.1/htmlspec-1.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "24b197afcdb7f3871b08adb65926cbbeb8b58513f63e1cf359a42e37c4f739ef"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.2.1/htmlspec-1.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e957be147e7c772feeb5368839a5252d8708b0bfb05253ea66e11241477ca8a8"
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
