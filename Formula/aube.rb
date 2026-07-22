class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.jdx.dev"
  url "https://github.com/jdx/aube/archive/refs/tags/v1.32.0.tar.gz"
  sha256 "b55b6bce1acdab8e2b42add8d5dfc0789e3b6adbb2c7b190470c663c23515da8"
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
