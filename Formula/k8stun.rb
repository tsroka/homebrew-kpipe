# typed: false
# frozen_string_literal: true

class K8stun < Formula
  desc "Kubernetes Userspace Network Tunnel - transparent access to K8s services"
  homepage "https://github.com/tsroka/k8stun"
  version "0.1.0-alpha"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/tsroka/k8stun/releases/download/v#{version}/k8stun-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "37998eefe169e520ed32ec714c3d69807ba00c4f99153a7c462a1f440d88cffa"
    end
  end

  def install
    bin.install "k8stun"
  end

  def caveats
    <<~EOS
      k8stun requires root privileges to create TUN devices and modify routing.
      
      To use k8stun, run:
        sudo k8stun --namespaces default

      For more options, see:
        k8stun --help
    EOS
  end

  test do
    assert_match "k8stun", shell_output("#{bin}/k8stun --version")
  end
end

