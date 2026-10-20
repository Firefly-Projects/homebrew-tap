# Rendered by scripts/render-formula from the SHA256SUMS of the release it names. The next
# release replaces it, so a change belongs in packaging/homebrew/htmlspec.rb.in.
class Htmlspec < Formula
  desc "Validate, format, and archive specifications kept as HTML documents"
  homepage "https://github.com/Firefly-Projects/htmlspec"
  # Homebrew reads the version from the tarball addresses below. The binary embeds Mermaid, Vega,
  # Vega-Lite, and Vega-Embed, and the libraries bundled inside them; this is the license field
  # of crates/htmlspec-assets/Cargo.toml, and THIRD-PARTY-LICENSES holds every text.
  license all_of: ["MIT", "BSD-3-Clause", "ISC", "Apache-2.0", "Unlicense"]

  on_macos do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.0.0/htmlspec-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "79c65fc755512ade19067b18626ddf001103e4f9b0bef66f047a424300047302"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.0.0/htmlspec-1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b906483d328f5e2288b8c03ec2c075134d415f435d83f914ab2e304429c9b93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.0.0/htmlspec-1.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1cdb8192e1f40704db0ddd419514a5c4242828f231ff6ceb6c05fbf0e76c3b35"
    end
    on_intel do
      url "https://github.com/Firefly-Projects/htmlspec/releases/download/v1.0.0/htmlspec-1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d51ed010fe182983c0a9b25d2ac2e8ef35e5bd850d569265dda101c496dc5e97"
    end
  end

  def install
    bin.install "htmlspec"
    prefix.install "LICENSE", "THIRD-PARTY-LICENSES"
  end

  test do
    assert_match "htmlspec #{version} (", shell_output("#{bin}/htmlspec --version")
  end
end
