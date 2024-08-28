class Usage < Formula
  desc "Tool for CLIs"
  homepage "https://github.com/jdx/usage"
  url "https://github.com/jdx/usage/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "0d83f635e5ba75f09f16c8481d3bae644e48b077cc6aba36898b1500d030b346"
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
