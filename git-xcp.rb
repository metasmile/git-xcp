class GitXcp < Formula
  desc "Git plugin for versioning workflow of real-world Xcode project."
  homepage "https://github.com/metasmile/git-xcp"
  url "https://github.com/metasmile/git-xcp/archive/1.0.tar.gz"
  version "1.0"
  sha256 "0742c6c6583a8853ec14fbff4e341eb82c3e4ad35154ec38a1454399ed47e7f3"
  head "https://github.com/metasmile/git-xcp.git"
  bottle :unneeded
  depends_on :x11
  
  def install
    system "make", "prefix=#{prefix}", "install"
  end
  
  test do
      assert_equal GitXcp.version.to_s,
        shell_output("#{bin}/git-xcp -v").chomp
    end
end
