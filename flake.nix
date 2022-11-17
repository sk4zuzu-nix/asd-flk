{
  description = "The 'asd' flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "asd_sk4zuzu";

        dontUnpack = true;

        helm_ver = "3.10.2";
        helm_bin = fetchurl {
          url = "https://get.helm.sh/helm-v${helm_ver}-linux-amd64.tar.gz";
          sha256 = "sha256-n6hZBlzE1lAaTvxoZgipQNXoTxSR2CxglEG7/UXXDI8=";
          executable = true;
        };

        kubectl_ver = "1.24.1";
        kubectl_bin = fetchurl {
          url = "https://storage.googleapis.com/kubernetes-release/release/v${kubectl_ver}/bin/linux/amd64/kubectl";
          sha256 = "sha256-fR11gylsDF+OOvXQkoXS+12aRknphiG+fKubgT454iw=";
          executable = true;
        };

        kubectx_ver = "0.9.4";
        kubectx_bin = fetchurl {
          url = "https://github.com/ahmetb/kubectx/releases/download/v${kubectx_ver}/kubectx";
          sha256 = "sha256-pYaOmRLFvBOWchVHFRbZtwHx6+46LzlkwCLy/xqc5MA=";
          executable = true;
        };

        kubens_ver = "0.9.4";
        kubens_bin = fetchurl {
          url = "https://github.com/ahmetb/kubectx/releases/download/v${kubens_ver}/kubens";
          sha256 = "sha256-85c6xcW8ve15PozN6D33ZOUGV9vAAW5X2VAJ3gUy+Ww=";
          executable = true;
        };

        kubeps1_ver = "0.7.0";
        kubeps1_bin = fetchurl {
          url = "https://raw.githubusercontent.com/jonmosco/kube-ps1/v${kubeps1_ver}/kube-ps1.sh";
          sha256 = "sha256-yGGiyeDtqTcGo2kFOk1S+UMVTzABeoePZ+uDB1TbxxQ=";
          executable = true;
        };

        kustomize_ver = "4.5.7";
        kustomize_bin = fetchurl {
          url = "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${kustomize_ver}/kustomize_v${kustomize_ver}_linux_amd64.tar.gz";
          sha256 = "sha256-xUbHANHqz/ZjIbfUIppSwvV7yY/1NnD0rNlrXYI98EE=";
          executable = true;
        };

        packer_ver = "1.8.4";
        packer_bin = fetchurl {
          url = "https://releases.hashicorp.com/packer/${packer_ver}/packer_${packer_ver}_linux_amd64.zip";
          sha256 = "sha256-sCcnVF99dujzUKXkI/4JAnjlJ6tjcue/DlEVISuU0q8=";
          executable = true;
        };

        terraform_ver = "1.3.3";
        terraform_bin = fetchurl {
          url = "https://releases.hashicorp.com/terraform/${terraform_ver}/terraform_${terraform_ver}_linux_amd64.zip";
          sha256 = "sha256-7MKhaBvwasBFwirUm7qoZ2qNe2yFFNrPhAcQ7iy/ldc=";
          executable = true;
        };

        terragrunt_ver = "0.39.2";
        terragrunt_bin = fetchurl {
          url = "https://github.com/gruntwork-io/terragrunt/releases/download/v${terragrunt_ver}/terragrunt_linux_amd64";
          sha256 = "sha256-Jp4P/Tc8RM7AZ0f6fWYENtxz6ufpMlV4NvcHwSghg9E=";
          executable = true;
        };

        nativeBuildInputs = [ installShellFiles unzip ];

        dontPatch     = true;
        dontConfigure = true;
        dontBuild     = true;

        installPhase = ''
          install -d $out/

          tar xf $helm_bin --strip-components=1 -C $out/ linux-amd64/helm && chmod +x $out/helm

          install -m+x $kubectl_bin $out/kubectl

          install -m+x $kubectx_bin $out/kubectx

          install -m+x $kubens_bin $out/kubens

          install -m+x $kubeps1_bin $out/kube-ps1.sh

          tar xf $kustomize_bin -C $out/ kustomize && chmod +x $out/kustomize

          unzip -p $packer_bin packer > $out/packer && chmod +x $out/packer

          unzip -p $terraform_bin terraform > $out/terraform-bin && chmod +x $out/terraform-bin
          ln -s $out/terraform-bin $out/terraform

          install -m+x $terragrunt_bin $out/terragrunt
        '';

        dontFixup = true;
      };
  };
}
