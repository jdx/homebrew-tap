class Aube < Formula
  desc "Fast Node.js package manager that drops into existing projects"
  homepage "https://aube.sh"
  url "https://github.com/aubepkg/aube/archive/refs/tags/v2.8.5.tar.gz"
  sha256 "07033565137d75bf7aaced18761e00bab58a0d146a4db1b5f80ebeb4aedf82de"
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
