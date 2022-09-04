class ChimSource < Formula
  desc "Cross-platform binary fetcher/runner"
  homepage "https://chim.sh"
  url "https://github.com/jdxcode/chim/archive/v0.1.0-beta.1.tar.gz"
  sha256 "a035ac5d1898a0c810d4459f6aa5dab0e3e70fc7c7ff2c0eee2f430d9c8034d9"
  license "MIT"
  version "0.0.0-test20"
  head "https://github.com/jdxcode/chim/.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  # on_macos do
  #   if Hardware::CPU.intel?
  #     url "https://github.com/chimpw/chim/releases/download/v0.0.0-test20/chim_0.0.0-test20_Darwin_x86_64.tar.gz"
  #     sha256 "27883a30ee3bd98d8847bda05ebc9f9a3c79a33257e24252affed8e782d2b369"

  #     def install
  #       bin.install "chim"
  #     end
  #   end
  #   if Hardware::CPU.arm?
  #     url "https://github.com/chimpw/chim/releases/download/v0.0.0-test20/chim_0.0.0-test20_Darwin_arm64.tar.gz"
  #     sha256 "2efd9d00c338a875c36623c06b836f1e282dc3c778a4c125511e07e0a608df55"

  #     def install
  #       bin.install "chim"
  #     end
  #   end
  # end

  # on_linux do
  #   if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
  #     url "https://github.com/chimpw/chim/releases/download/v0.0.0-test20/chim_0.0.0-test20_Linux_arm64.tar.gz"
  #     sha256 "b27bb95e463cfc785eb7c91d47e678672798407bf92f635426ca83ac425b98e0"

  #     def install
  #       bin.install "chim"
  #     end
  #   end
  #   if Hardware::CPU.intel?
  #     url "https://github.com/chimpw/chim/releases/download/v0.0.0-test20/chim_0.0.0-test20_Linux_x86_64.tar.gz"
  #     sha256 "edccde520ca0e87de6889dc80b08f737285483add4b275c4127970597540abef"

  #     def install
  #       bin.install "chim"
  #     end
  #   end
  # end

  test do
    system "#{bin}/chim --version"
  end
end
