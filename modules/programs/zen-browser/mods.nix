{
  flake.modules.homeManager.zen-browser = {config, ...}: {
    # TODO: it appears that mods do not follow the configPath option, so they get placed in /home/hexfae/.zen instead of /home/hexfae/.config/zen
    #   programs.zen-browser.profiles.${config.constants.username}.mods = [
    #     "bc25808c-a012-4c0d-ad9a-aa86be616019" # sleek border https://zen-browser.app/mods/bc25808c-a012-4c0d-ad9a-aa86be616019/
    #     "a6335949-4465-4b71-926c-4a52d34bc9c0" # better find bar https://zen-browser.app/mods/a6335949-4465-4b71-926c-4a52d34bc9c0/
    #     "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # better unloaded tabs https://zen-browser.app/mods/f7c71d9a-bce2-420f-ae44-a64bd92975ab/
    #     "ae051a40-3e3a-429a-a6f4-199a28b18a75" # only reset on hover https://zen-browser.app/mods/ae051a40-3e3a-429a-a6f4-199a28b18a75/
    #     "72f8f48d-86b9-4487-acea-eb4977b18f21" # better ctrltab panel https://zen-browser.app/mods/72f8f48d-86b9-4487-acea-eb4977b18f21/
    #     "664c54f9-d97d-410b-a479-23dd8a08a628" # better tab indicators https://zen-browser.app/mods/664c54f9-d97d-410b-a479-23dd8a08a628
    #     "2317fd93-c3ed-4f37-b55a-304c1816819e" # audio indicator enhanced https://zen-browser.app/mods/2317fd93-c3ed-4f37-b55a-304c1816819e/
    #     "79dde383-4fe7-404a-a8e6-9be440022542" # tidy popup https://zen-browser.app/mods/79dde383-4fe7-404a-a8e6-9be440022542/
    #     "c8d9e6e6-e702-4e15-8972-3596e57cf398" # zen back forward https://zen-browser.app/mods/c8d9e6e6-e702-4e15-8972-3596e57cf398/
    #     "20e8cc78-3dac-4db0-81a4-814672fb50af" # left side glance buttons https://zen-browser.app/mods/20e8cc78-3dac-4db0-81a4-814672fb50af/
    #     "f4866f39-cfd6-4498-ab92-54213b8279dc" # animations plus https://zen-browser.app/mods/f4866f39-cfd6-4498-ab92-54213b8279dc/
    #     "81fcd6b3-f014-4796-988f-6c3cb3874db8" # zen context menu https://zen-browser.app/mods/81fcd6b3-f014-4796-988f-6c3cb3874db8/
    #     "6f11c932-b992-433e-8c80-56a613cc511e" # left close button https://zen-browser.app/mods/6f11c932-b992-433e-8c80-56a613cc511e/
    #     "599a1599-e6ab-4749-ab22-de533860de2c" # pimp your pip https://zen-browser.app/mods/599a1599-e6ab-4749-ab22-de533860de2c/
    #   ];
  };
}
