{
  inputs,
  cell,
}: {
  default = {
    commands = [
      {
        name = "jupyenv";
        command = ''
          nix run .\#x86_64-linux.kernels.packages.jupyterlab -- --ip $1 --port $2
        '';
        help = "jupyterlab <IP> <PORT> <juliaPackageDir> | Example: jupyterlab 10.220.170.112 8888";
      }
      {
        command = ''
          ${inputs.cells.kernels.packages.jupyenv}/bin/jupyter "$@"
        '';
        name = "jupyter";
      }
    ];
  };
}
