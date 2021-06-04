{
  description = "The 'asd' flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "asd_sk4zuzu";

        dontUnpack = true;

        helm_ver = "3.5.3";
        helm_bin = fetchurl {
          url = "https://get.helm.sh/helm-v${helm_ver}-linux-amd64.tar.gz";
          sha256 = "sha256-JWoVWHdiV/uh/8UBPZd4cu1wwJ2Gcs0z1KCr7jv6uqc=";
          executable = true;
        };

        helmfile_ver = "0.138.7";
        helmfile_bin = fetchurl {
          url = "https://github.com/roboll/helmfile/releases/download/v${helmfile_ver}/helmfile_linux_amd64";
          sha256 = "sha256-KuReKArsIK9CGfNeD4sHRLzt1lGmR8tq8fSlCmFoG7M=";
          executable = true;
        };

        kops_ver = "1.18.1";
        kops_bin = fetchurl {
          url = "https://github.com/kubernetes/kops/releases/download/v${kops_ver}/kops-linux-amd64";
          sha256 = "sha256-xtvIH/bBtJKEvP9TxQhcPKtj3+Hs4uusjfGsp59Jsps=";
          executable = true;
        };

        kubecom_ver = "0.7.6";
        kubecom_bin = fetchurl {
          url = "https://github.com/AnatolyRugalev/kube-commander/releases/download/${kubecom_ver}/kubecom_${kubecom_ver}_linux_amd64";
          sha256 = "sha256-JDBmYhlfNPPsPD5txV57hAX+xK5av7MjhRJgOtM7ud0=";
          executable = true;
        };

        kubectl_ver = "1.18.9";
        kubectl_bin = fetchurl {
          url = "https://storage.googleapis.com/kubernetes-release/release/v${kubectl_ver}/bin/linux/amd64/kubectl";
          sha256 = "sha256-XppSXdfjE34sss+rRysWjGRz6CooYX4NmvsCFxH6+Ig=";
          executable = true;
        };

        kubectx_ver = "0.9.3";
        kubectx_bin = fetchurl {
          url = "https://github.com/ahmetb/kubectx/releases/download/v${kubectx_ver}/kubectx";
          sha256 = "sha256-pYaOmRLFvBOWchVHFRbZtwHx6+46LzlkwCLy/xqc5MA=";
          executable = true;
        };

        kubens_ver = "0.9.3";
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

        packer_ver = "1.7.2";
        packer_bin = fetchurl {
          url = "https://releases.hashicorp.com/packer/${packer_ver}/packer_${packer_ver}_linux_amd64.zip";
          sha256 = "sha256-0f+tue6zWt7JVHgE5Ide4rRjp33Nrwv2xkFx41L5L+M=";
          executable = true;
        };

        rclone_ver = "1.55.0";
        rclone_bin = fetchurl {
          url = "https://github.com/rclone/rclone/releases/download/v${rclone_ver}/rclone-v${rclone_ver}-linux-amd64.zip";
          sha256 = "sha256-exp7ctlUceVNdeZ8STjMxk6mfKRzpm87B1no5c6oB/Q=";
          executable = true;
        };

        restic_ver = "0.12.0";
        restic_bin = fetchurl {
          url = "https://github.com/restic/restic/releases/download/v${restic_ver}/restic_${restic_ver}_linux_amd64.bz2";
          sha256 = "sha256-6Q88JX5ixWgtGmVGZ9ZzC3BdAAanocKGVTH0/fEhulM=";
          executable = true;
        };

        terraform_ver = "0.14.9";
        terraform_bin = fetchurl {
          url = "https://releases.hashicorp.com/terraform/${terraform_ver}/terraform_${terraform_ver}_linux_amd64.zip";
          sha256 = "sha256-49o15KyW0rk7rYaGz79VW3yb+rHHEXuC3hv26wpFhBU=";
          executable = true;
        };

        terragrunt_ver = "0.28.15";
        terragrunt_bin = fetchurl {
          url = "https://github.com/gruntwork-io/terragrunt/releases/download/v${terragrunt_ver}/terragrunt_linux_amd64";
          sha256 = "sha256-tjXidqsThYgQ87NaF5ZM1SFesRGKsxDcXD4oM1m6DfQ=";
          executable = true;
        };

        velero_ver = "1.5.3";
        velero_bin = fetchurl {
          url = "https://github.com/vmware-tanzu/velero/releases/download/v${velero_ver}/velero-v${velero_ver}-linux-amd64.tar.gz";
          sha256 = "sha256-scpvRlWtRP6HwqOEQhs1IlvYqzlkyQJ0152HqZ17cZs=";
          executable = true;
        };

        nativeBuildInputs = [ installShellFiles unzip ];

        dontPatch     = true;
        dontConfigure = true;
        dontBuild     = true;

        installPhase = ''
          install -d $out/

          tar xf $helm_bin --strip-components=1 -C $out/ linux-amd64/helm && chmod +x $out/helm

          install -m+x $helmfile_bin $out/helmfile

          install -m+x $kops_bin $out/kops

          install -m+x $kubecom_bin $out/kubecom

          install -m+x $kubectl_bin $out/kubectl

          install -m+x $kubectx_bin $out/kubectx

          install -m+x $kubens_bin $out/kubens

          install -m+x $kubeps1_bin $out/kube-ps1.sh

          unzip -p $packer_bin packer > $out/packer && chmod +x $out/packer

          unzip -p $rclone_bin rclone-v${rclone_ver}-linux-amd64/rclone > $out/rclone && chmod +x $out/rclone

          bzcat $restic_bin > $out/restic && chmod +x $out/restic

          unzip -p $terraform_bin terraform > $out/terraform && chmod +x $out/terraform

          install -m+x $terragrunt_bin $out/terragrunt

          tar xf $velero_bin --strip-components=1 -C $out/ velero-v${velero_ver}-linux-amd64/velero && chmod +x $out/velero
        '';

        dontFixup = true;
      };
  };
}
