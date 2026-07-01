class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.jdx.dev"
  url "https://github.com/jdx/aube/archive/refs/tags/v1.25.2.tar.gz"
  sha256 "d9118c1fd98d667f4bd8f63a6701816b0c0fe2f680e29e6d9246ffce634c649a"
  license "MIT"

  depends_on "rust" => :build
  depends_on "usage" => :build
  depends_on "cmake" => :build
  depends_on "pkgconf" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/aube")
    generate_completions_from_executable(bin/"aube", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aube --version")
    assert_match "Usage:", shell_output("#{bin}/aube --help")
  end
end
