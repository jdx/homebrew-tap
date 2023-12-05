class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdx/rtx"
  license "MIT"
  version "2023.12.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.8/rtx-v2023.12.8-macos-x64.tar.xz"
      sha256 "52a7904bb7d8829ea4003fc8d5b8d5185e8a65cee732f3b06f617b3dad7984a5"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v2023.12.8/rtx-v2023.12.8-macos-arm64.tar.xz"
      sha256 "c3b3615c7d2858bece65264f9f836ce189af4ff39f2ab744e60a32f339aa99f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v2023.12.8/rtx-v2023.12.8-linux-arm64.tar.xz"
      sha256 "0ae0c661753e65f789bb52b04ba05b84312555b386969b04be4cba25bd6ef039"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v2023.12.8/rtx-v2023.12.8-linux-x64.tar.xz"
      sha256 "e101ea1cab50d82ab09fe5164bdef90e1978749cceac9cf8e187623fe36ee8cb"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
    lib.mkpath
    touch lib/".disable-self-update"
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "node@20.0.0"
    assert_match "v20.0.0", shell_output("#{bin}/rtx exec node@20.0.0 -- node -v")
  end
end
