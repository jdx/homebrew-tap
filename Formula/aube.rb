class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.jdx.dev"
  url "https://github.com/jdx/aube/archive/refs/tags/v1.40.0.tar.gz"
  sha256 "a836796d9e72ac8af6ad31172572a2f7919cb2481cd318a65e5e3e1052b5c429"
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
