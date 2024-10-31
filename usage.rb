class Usage < Formula
  desc "Tool for CLIs"
  homepage "https://github.com/jdx/usage"
  url "https://github.com/jdx/usage/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "ae51fe6258979c5b3c383a284da9203e245f08e3c746b2f01372fd58a3835eb0"
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
