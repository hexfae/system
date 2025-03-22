{lib, ...}: {
  # my desktop motherboard (asus tuf gaming b650-e wifi) has an issue where it immediately wakes up from suspend, this fixes it
  services.udev.extraRules = lib.concatStringsSep ", " [
    ''ACTION=="add"''

    ''SUBSYSTEM=="pci"''
    ''ATTR{vendor}=="0x1022"''
    ''ATTR{device}=="0x15b6"''

    ''ATTR{power/wakeup}="disabled"''
  ];
}
