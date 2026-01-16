rec {
  username = "hexfae";
  uid = 1000;
  email = "hexfae@proton.me";
  keys = {
    ${username} = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwU23h31N5cH7YmezNyhy8wYXvdJxlMk+YQJ1p8WGH1 hexfae@desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKO7j5bOF6OQgCEP2ZIeJ6VYdUInEmYCKc4fxNTluSi0 hexfae@server"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECm6LZ8DR+ASM0Du6W50Zrw41LgaBD0Q6IXm4jtDSBC hexfae@thinkpad"
    ];
    root = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKmYt2uCGGDrW9ckK1ubHf0x+ttmGwi2OHeUc5FonB+X root@desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3rgqbhUiuc5MV+niwye5UluNH/ERtBoUbrtZIixrPp root@server"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGW6UmPfAV2qVVHDqGit+OSPQd0dzmj9P0MqvYShkdVK root@thinkpad"
    ];
  };
  networking = {
    server = {
      ip = "129.151.192.240";
      port = 51820;
      endpoint = "${networking.server.ip}:${toString networking.server.port}";
      wgIp = "10.100.0.1/24";
      allowedIPs = ["10.100.0.0/24"];
      publicKey = "QXjD222mBO0VVz1ZiChRfAgeZmU3B5Az99R8N/soYk4=";
    };
    desktop = {
      ip = "10.100.0.2";
      wgIp = "${networking.desktop.ip}/24";
      allowedIPs = ["${networking.desktop.ip}/32"];
      publicKey = "ArMsMaebYbsZ1tEaW4xnyjniCOGsWPvWbaeCwCIwiHk=";
    };
    phone = {
      ip = "10.100.0.3";
      wgIp = "${networking.phone.ip}/24";
      allowedIPs = ["${networking.phone.ip}/32"];
      publicKey = "MB8cQUyUsUIlR5i2WjgtWib0PhIRNSV5vCbWxDM0fyw=";
    };
    ludd = {
      endpoint = "130.240.22.206:51820";
      wgIp = "192.168.69.17/32";
      publicKey = "CkHERo9J8Kz4UxtZRXx3JhQpb8jfxeqBxdbkMGp3piE=";
      allowedIPs = [
        "10.30.0.0/16"
        "10.10.0.0/16"
        "192.168.42.0/24"
        "10.30.104.0/21"
      ];
    };
  };
}
