class Usage < Formula
  desc "Tool for CLIs"
  homepage "https://github.com/jdx/usage"
  url "https://github.com/jdx/usage/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6dcc93dff6511f52a44b79e9c9e7192aca2b288c55a7ab00e560fb5800fe4586"
  license "MIT"
  head "https://github.com/jdx/usage.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/usage --version")
  end
end
