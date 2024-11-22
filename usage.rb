class Usage < Formula
  desc "Tool for CLIs"
  homepage "https://github.com/jdx/usage"
  url "https://github.com/jdx/usage/archive/refs/tags/v1.3.3.tar.gz"
  sha256 "5681ca5a6a398ed6673c2053b34c7088154d25b7aa7fb3363835b247d0fa4b45"
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
