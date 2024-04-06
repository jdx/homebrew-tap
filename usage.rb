class Usage < Formula
  desc "Tool for CLIs"
  homepage "https://github.com/jdx/usage"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  head do
    url "https://github.com/jdx/usage.git", branch: "main"

    depends_on "rust" => :build
  end

  on_macos do
    url "https://github.com/jdx/usage/releases/download/v0.1.17/usage-universal-apple-darwin.tar.gz"
    sha256 "2f051644e60b8bc9ac28a847da82bc2320edb593c41fdb0dad0e565f8ebd2c2e"
  end

  on_linux do
    url "https://github.com/jdx/usage/archive/refs/tags/v0.1.17.tar.gz"
    sha256 "735d08fbe78e2c0390afa8ee23dfbc7cd54f4ae9355359875d7e23a01084dba6"

    depends_on "rust" => :build
  end

  def install
    if OS.mac? && !build.head?
      bin.install "usage"
    else
      system "cargo", "install", *std_cargo_args(path: "cli")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/usage --version")
  end
end
