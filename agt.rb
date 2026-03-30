# Homebrew formula for agt — Augmented CLI
# Deploy to: https://github.com/integrity-labs/homebrew-tap
#
# Usage:
#   brew tap integrity-labs/tap
#   brew install integrity-labs/tap/agt
#
# Or in one command:
#   brew install integrity-labs/tap/agt

class Agt < Formula
  desc "Augmented CLI — agent provisioning and management"
  homepage "https://github.com/Integrity-Labs/brandninja-monorepo"
  # URL follows npm's public tarball pattern: @scope/name/-/name-version.tgz
  # Update version and sha256 on each release
  url "https://registry.npmjs.org/@integrity-labs/agt-cli/-/agt-cli-0.7.12.tgz"
  # sha256 — update after publishing to npm
  sha256 "cfd2032ff7c458e93c2fc0c10273e40a6f728fd68ba11efc6116b768dc28d0a2"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    # acpx is an npm dependency — available via node_modules/.bin/
    # The CLI resolves it automatically via getAcpxBin()
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agt --version")
  end
end
