{lib, ...}: {
  home-manager.users.hexfae.programs.starship.enable = true;
  home-manager.users.hexfae.programs.starship.settings.character.success_symbol = "[❯](green)";
  home-manager.users.hexfae.programs.starship.settings.character.error_symbol = "[❯](green)";
  home-manager.users.hexfae.programs.starship.settings.cmd_duration.min_time = 1000;
  home-manager.users.hexfae.programs.starship.settings.cmd_duration.format = "in [$duration](bold yellow) ";
  home-manager.users.hexfae.programs.starship.settings.directory.read_only = " ";
  home-manager.users.hexfae.programs.starship.settings.directory.style = "bold white";
  home-manager.users.hexfae.programs.starship.settings.directory.read_only_style = "bold yellow";
  home-manager.users.hexfae.programs.starship.settings.directory.truncation_length = 8;
  home-manager.users.hexfae.programs.starship.settings.directory.truncation_symbol = "…/";
  home-manager.users.hexfae.programs.starship.settings.username.format = "[\\[](bold red)[$user](bold yellow)";
  home-manager.users.hexfae.programs.starship.settings.username.disabled = false;
  home-manager.users.hexfae.programs.starship.settings.username.show_always = true;
  home-manager.users.hexfae.programs.starship.settings.hostname.ssh_only = false;
  home-manager.users.hexfae.programs.starship.settings.hostname.format = "[@](bold green)[$hostname](bold blue)[\\]](bold purple) ";
  home-manager.users.hexfae.programs.starship.settings.hostname.trim_at = ".companyname.com";
  home-manager.users.hexfae.programs.starship.settings.hostname.disabled = false;
  home-manager.users.hexfae.programs.starship.settings.time.disabled = false;
  home-manager.users.hexfae.programs.starship.settings.time.format = "[\\[$time\\]](bold white)";
  home-manager.users.hexfae.programs.starship.settings.time.time_format = "%T";
  home-manager.users.hexfae.programs.starship.settings.time.utc_time_offset = "+1";
  home-manager.users.hexfae.programs.starship.settings.aws.symbol = "  ";
  home-manager.users.hexfae.programs.starship.settings.conda.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.dart.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.docker_context.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.elixir.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.elm.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.git_branch.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.golang.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.hg_branch.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.java.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.julia.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.memory_usage.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.nim.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.nix_shell.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.package.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.perl.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.php.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.python.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.ruby.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.rust.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.scala.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.shlvl.symbol = " ";
  home-manager.users.hexfae.programs.starship.settings.swift.symbol = "ﯣ ";
  home-manager.users.hexfae.programs.starship.settings.format = lib.concatStrings [
    "$username"
    "$hostname"
    "$shlvl"
    "$kubernetes"
    "$directory"
    "$vcsh"
    "$git_branch"
    "$git_commit"
    "$git_state"
    "$git_metrics"
    "$git_status"
    "$hg_branch"
    "$docker_context"
    "$package"
    "$cmake"
    "$dart"
    "$deno"
    "$dotnet"
    "$elixir"
    "$elm"
    "$erlang"
    "$golang"
    "$helm"
    "$java"
    "$julia"
    "$kotlin"
    "$nim"
    "$nodejs"
    "$ocaml"
    "$perl"
    "$php"
    "$purescript"
    "$python"
    "$red"
    "$ruby"
    "$rust"
    "$scala"
    "$swift"
    "$terraform"
    "$vlang"
    "$vagrant"
    "$zig"
    "$nix_shell"
    "$conda"
    "$memory_usage"
    "$aws"
    "$gcloud"
    "$openstack"
    "$env_var"
    "$crystal"
    "$custom"
    "$cmd_duration"
    "$time"
    "$line_break"
    "$lua"
    "$jobs"
    "$battery"
    "$status"
    "$shell"
    "$character"
  ];
}
