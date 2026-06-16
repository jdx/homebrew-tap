class Aube < Formula
  desc "Fast Node.js package manager"
  homepage "https://aube.jdx.dev"
  url "https://github.com/jdx/aube/archive/refs/tags/v1.21.0.tar.gz"
  sha256 "040823555a3301c2b719f808143525d4f98708a9a38c3f7f675ce5e9b725342f"
  license "MIT"
  head "https://github.com/jdx/aube.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "usage" => :build
  depends_on "node" => :test

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/aube")
    generate_completions_from_executable(bin/"aube", "completion")
  end

  test do
    system bin/"aube", "init", "--bare"
    system bin/"aube", "add", "cowsay"
    assert_path_exists testpath/"node_modules/cowsay"
    assert_match "< moo >", shell_output("#{bin}/aubx cowsay moo")
  end
end
