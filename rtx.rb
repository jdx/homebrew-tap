class Rtx < Formula
  desc "Multi-language runtime manager"
  homepage "https://github.com/jdxcode/rtx"
  license "MIT"
  version "1.28.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.5/rtx-brew-v1.28.5-macos-x64.tar.xz"
      sha256 "8b93a0fe8b7a7fcfdd9c2459f0522c8f2c1813496cd12acb6f815724456f8ddb"
    end
    if Hardware::CPU.arm?
      url "https://rtx.pub/v1.28.5/rtx-brew-v1.28.5-macos-arm64.tar.xz"
      sha256 "748f02c6c466e0be9994699628725645b8af60448a1f92e50a4a6ebf5725111e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://rtx.pub/v1.28.5/rtx-brew-v1.28.5-linux-arm64.tar.xz"
      sha256 "ab13d9e0c17c0ba3e2866aca1889e68cfcf29d33aecd6e6ea3966dbb804b485b"
    end
    if Hardware::CPU.intel?
      url "https://rtx.pub/v1.28.5/rtx-brew-v1.28.5-linux-x64.tar.xz"
      sha256 "f484cbd2d18e08dc4d7980af5d5b14674f3fcd2bc01f2790ba64da02d4c71b85"
    end
  end

  def install
    bin.install "bin/rtx"
    man1.install "man/man1/rtx.1"
    generate_completions_from_executable(bin/"rtx", "completion")
  end

  test do
    system "#{bin}/rtx --version"
    system "#{bin}/rtx", "install", "nodejs@18.13.0"
    assert_match "v18.13.0", shell_output("#{bin}/rtx exec nodejs@18.13.0 -- node -v")
  end
end
