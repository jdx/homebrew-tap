class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.jdx.dev"
  url "https://github.com/jdx/aube/archive/refs/tags/v1.29.1.tar.gz"
  sha256 "310e4d6213efc9b1b513348a16720ee9b65fa99ce9601b3d4756e3ef4a4ca875"
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
