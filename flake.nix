{
  description = "The 'asd' flake";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "asd_sk4zuzu";

        dontUnpack = true;

        cilium_ver = "0.7";
        cilium_bin = fetchurl {
          url = "https://github.com/cilium/cilium-cli/releases/download/v${cilium_ver}/cilium-linux-amd64.tar.gz";
          sha256 = "sha256-A5GHhRvF/BPcjMfqCQ5j7s5S6mTo4WSXxJ29VX9v5Ks=";
          executable = true;
        };

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

        hubble_ver = "0.8.0";
        hubble_bin = fetchurl {
          url = "https://github.com/cilium/hubble/releases/download/v${hubble_ver}/hubble-linux-amd64.tar.gz";
          sha256 = "sha256-URe/wK/I8sI5IOy/9oCi+DeFhQ4DXI0OQZWNUGVwewc=";
          executable = true;
        };

        k9s_ver = "0.24.14";
        k9s_bin = fetchurl {
          url = "https://github.com/derailed/k9s/releases/download/v${k9s_ver}/k9s_Linux_x86_64.tar.gz";
          sha256 = "sha256-PW17t03W5axh6Eatfq8aTQTE5Z8bGHamnVbIQVlF8vs=";
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

        terraform_ver = "0.14.11";
        terraform_bin = fetchurl {
          url = "https://releases.hashicorp.com/terraform/${terraform_ver}/terraform_${terraform_ver}_linux_amd64.zip";
          sha256 = "sha256-PeewHA9zgY2Si9VsoQn9qSwwnZi2ttQVWLGNZOIuGrU=";
          executable = true;
        };

        terraform_docs_ver = "0.14.1";
        terraform_docs_bin = fetchurl {
          url = "https://github.com/terraform-docs/terraform-docs/releases/download/v${terraform_docs_ver}/terraform-docs-v${terraform_docs_ver}-linux-amd64.tar.gz";
          sha256 = "sha256-xdwCH6CaH/m5ezG1C49e9jJoOEzkKahwVh60dfmJSbs=";
          executable = true;
        };

        terragrunt_ver = "0.28.15";
        terragrunt_bin = fetchurl {
          url = "https://github.com/gruntwork-io/terragrunt/releases/download/v${terragrunt_ver}/terragrunt_linux_amd64";
          sha256 = "sha256-tjXidqsThYgQ87NaF5ZM1SFesRGKsxDcXD4oM1m6DfQ=";
          executable = true;
        };

        vault_ver = "1.6.2";
        vault_bin = fetchurl {
          url = "https://releases.hashicorp.com/vault/${vault_ver}/vault_${vault_ver}_linux_amd64.zip";
          sha256 = "sha256-pH0gI0rFSV5oYurM12mxnbQokfqCqzg3LT4EWZdHUeU=";
          executable = true;
        };

        velero_ver = "1.5.3";
        velero_bin = fetchurl {
          url = "https://github.com/vmware-tanzu/velero/releases/download/v${velero_ver}/velero-v${velero_ver}-linux-amd64.tar.gz";
          sha256 = "sha256-scpvRlWtRP6HwqOEQhs1IlvYqzlkyQJ0152HqZ17cZs=";
          executable = true;
        };

        virtctl_ver = "0.43.0";
        virtctl_bin = fetchurl {
          url = "https://github.com/kubevirt/kubevirt/releases/download/v${virtctl_ver}/virtctl-v${virtctl_ver}-linux-amd64";
          sha256 = "sha256-+aNepgkJQ8A8+7oBtAetkWSQjsyZfj2UQXH/lwGYm/U=";
          executable = true;
        };

        nativeBuildInputs = [ installShellFiles unzip ];

        dontPatch     = true;
        dontConfigure = true;
        dontBuild     = true;

        installPhase = ''
          install -d $out/

          tar xf $cilium_bin -C $out/ cilium && chmod +x $out/cilium

          tar xf $helm_bin --strip-components=1 -C $out/ linux-amd64/helm && chmod +x $out/helm

          install -m+x $helmfile_bin $out/helmfile

          tar xf $hubble_bin -C $out/ hubble && chmod +x $out/hubble

          tar xf $k9s_bin -C $out/ k9s && chmod +x $out/k9s

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

          tar xf $terraform_docs_bin -C $out/ terraform-docs && chmod +x $out/terraform-docs

          install -m+x $terragrunt_bin $out/terragrunt

          unzip -p $vault_bin vault > $out/vault && chmod +x $out/vault

          tar xf $velero_bin --strip-components=1 -C $out/ velero-v${velero_ver}-linux-amd64/velero && chmod +x $out/velero

          install -m+x $virtctl_bin $out/virtctl
        '';

        dontFixup = true;
      };
  };
}
