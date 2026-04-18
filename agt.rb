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
  url "https://registry.npmjs.org/@integrity-labs/agt-cli/-/agt-cli-0.10.12.tgz"
  # sha256 updated by publish-cli.sh after npm publish
  sha256 "c8d82c2eeec5ac2c00912f6b5a550a4fca0a3669f3339342e18b8c7512919190"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    # acpx is an npm dependency — available via node_modules/.bin/
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agt --version")
  end
end
