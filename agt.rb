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
  url "https://registry.npmjs.org/@integrity-labs/agt-cli/-/agt-cli-0.7.11.tgz"
  # sha256 — update after publishing to npm
  sha256 "c2e98114a9041408f81dc908c7357cc23ef051596e392521f010056f7837adc9"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    # Ensure acpx is available for persistent agent sessions
    system "npm", "install", "-g", "acpx@latest" unless which("acpx")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agt --version")
  end
end
