{
  description = "The 'asd' flake";

  inputs.nixpkgs.url = "git+file:./nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "asd_sk4zuzu";

        dontUnpack = true;

        clusterctl_ver = "1.8.3";
        clusterctl_bin = fetchurl {
          url = "https://github.com/kubernetes-sigs/cluster-api/releases/download/v${clusterctl_ver}/clusterctl-linux-amd64";
          sha256 = "sha256-iYAfeQT7upAbftx5WTK0CnWsp+8l2JEbESJMlme5bx0=";
          executable = true;
        };

        ctlptl_ver = "0.8.33";
        ctlptl_bin = fetchurl {
          url = "https://github.com/tilt-dev/ctlptl/releases/download/v${ctlptl_ver}/ctlptl.${ctlptl_ver}.linux.x86_64.tar.gz";
          sha256 = "sha256-4fcpeg1Lab2NN32SH7BWaajJ/XbYDcFUT4Pqp5VS20A=";
          executable = true;
        };

        helm_ver = "3.16.1";
        helm_bin = fetchurl {
          url = "https://get.helm.sh/helm-v${helm_ver}-linux-amd64.tar.gz";
          sha256 = "sha256-iqZRJsgeCGsCsRQQBsijGM3uxS3wgWkxO8x/M/KLNvc=";
          executable = true;
        };

        kind_ver = "0.24.0";
        kind_bin = fetchurl {
          url = "https://github.com/kubernetes-sigs/kind/releases/download/v${kind_ver}/kind-linux-amd64";
          sha256 = "sha256-/oFQWb9+OWAdeolVEPLGgJkOqQLltO/ou4RLvKrllJQ=";
          executable = true;
        };

        kubebuilder_ver = "4.2.0";
        kubebuilder_bin = fetchurl {
          url = "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${kubebuilder_ver}/kubebuilder_linux_amd64";
          sha256 = "sha256-7ogjIjfSsbqwiT/BjigkmyJVYPkQ1oO/9af1GYYUxxU=";
          executable = true;
        };

        kubectl_ver = "1.31.0";
        kubectl_bin = fetchurl {
          url = "https://storage.googleapis.com/kubernetes-release/release/v${kubectl_ver}/bin/linux/amd64/kubectl";
          sha256 = "sha256-4LJWPkcbvyV3fWntuUuLcCxPxG72JgDbYtykqPDKXvU=";
          executable = true;
        };

        kubectx_ver = "0.9.5";
        kubectx_bin = fetchurl {
          url = "https://github.com/ahmetb/kubectx/releases/download/v${kubectx_ver}/kubectx";
          sha256 = "sha256-pYaOmRLFvBOWchVHFRbZtwHx6+46LzlkwCLy/xqc5MA=";
          executable = true;
        };

        kubens_ver = "0.9.5";
        kubens_bin = fetchurl {
          url = "https://github.com/ahmetb/kubectx/releases/download/v${kubens_ver}/kubens";
          sha256 = "sha256-85c6xcW8ve15PozN6D33ZOUGV9vAAW5X2VAJ3gUy+Ww=";
          executable = true;
        };

        kubeps1_ver = "0.9.0";
        kubeps1_bin = fetchurl {
          url = "https://raw.githubusercontent.com/jonmosco/kube-ps1/v${kubeps1_ver}/kube-ps1.sh";
          sha256 = "sha256-NrvyNT90WO58J6iiVaSLzNRxmFp3z30hZfwIX7IWbS8=";
          executable = true;
        };

        kustomize_ver = "5.4.3";
        kustomize_bin = fetchurl {
          url = "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${kustomize_ver}/kustomize_v${kustomize_ver}_linux_amd64.tar.gz";
          sha256 = "sha256-xfZsIOoAsPazsA9Gv6R9l/q/lNXp6FZauRV8j6AL9Qg=";
          executable = true;
        };

        packer_ver = "1.11.2";
        packer_bin = fetchurl {
          url = "https://releases.hashicorp.com/packer/${packer_ver}/packer_${packer_ver}_linux_amd64.zip";
          sha256 = "sha256-pehf7H2inE2NS6MY2Mf3vqh7Y/nUkCsWlwukn8gJVow=";
          executable = true;
        };

        terraform_ver = "1.9.5";
        terraform_bin = fetchurl {
          url = "https://releases.hashicorp.com/terraform/${terraform_ver}/terraform_${terraform_ver}_linux_amd64.zip";
          sha256 = "sha256-GKsAFtnhYooulyJzJisqaxBFaQpXK9u5l4Wkpr51QHo=";
          executable = true;
        };

        terragrunt_ver = "0.67.4";
        terragrunt_bin = fetchurl {
          url = "https://github.com/gruntwork-io/terragrunt/releases/download/v${terragrunt_ver}/terragrunt_linux_amd64";
          sha256 = "sha256-+UCXetWK7QXIQxQcnKcRXWT4xY8kyU4wsLNoprkigx0=";
          executable = true;
        };

        tfplugindocs_ver = "0.19.4";
        tfplugindocs_bin = fetchurl {
          url = "https://github.com/hashicorp/terraform-plugin-docs/releases/download/v${tfplugindocs_ver}/tfplugindocs_${tfplugindocs_ver}_linux_amd64.zip";
          sha256 = "sha256-pmebXUwT7nzuZzEzo/kiTpULsHL7iuKVtkLOhXzcG00=";
          executable = true;
        };

        tilt_ver = "0.33.20";
        tilt_bin = fetchurl {
          url = "https://github.com/tilt-dev/tilt/releases/download/v${tilt_ver}/tilt.${tilt_ver}.linux-alpine.x86_64.tar.gz";
          sha256 = "sha256-Vav6x8vg9NXXseKBMx5JCuF8xiE5N8JGSLmeWmNDsOY=";
          executable = true;
        };

        nativeBuildInputs = [ installShellFiles unzip ];

        dontPatch     = true;
        dontConfigure = true;
        dontBuild     = true;

        installPhase = ''
          install -d $out/

          install -m+x $clusterctl_bin $out/clusterctl

          tar xf $ctlptl_bin -C $out/ ctlptl && chmod +x $out/ctlptl

          tar xf $helm_bin --strip-components=1 -C $out/ linux-amd64/helm && chmod +x $out/helm

          install -m+x $kind_bin $out/kind

          install -m+x $kubebuilder_bin $out/kubebuilder

          install -m+x $kubectl_bin $out/kubectl

          install -m+x $kubectx_bin $out/kubectx

          install -m+x $kubens_bin $out/kubens

          install -m+x $kubeps1_bin $out/kube-ps1.sh

          tar xf $kustomize_bin -C $out/ kustomize && chmod +x $out/kustomize

          unzip -p $packer_bin packer > $out/packer && chmod +x $out/packer

          unzip -p $terraform_bin terraform > $out/terraform && chmod +x $out/terraform

          install -m+x $terragrunt_bin $out/terragrunt

          unzip -p $tfplugindocs_bin tfplugindocs > $out/tfplugindocs && chmod +x $out/tfplugindocs

          tar xf $tilt_bin -C $out/ tilt && chmod +x $out/tilt
        '';

        dontFixup = true;
      };
  };
}
