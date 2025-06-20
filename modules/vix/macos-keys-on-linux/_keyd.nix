# see https://raw.githubusercontent.com/rvaiya/keyd/refs/heads/master/docs/keyd.scdoc
# see https://github.com/rvaiya/keyd/blob/master/examples/macos.conf
let

  # MacOS Command (⌘)
  mac_leftcmd = {
    tab = "swapm(altgr, G-tab)";

    # Switch directly to an open tab (e.g. Firefox, VS code)
    "1" = "A-1";
    "2" = "A-2";
    "3" = "A-3";
    "4" = "A-4";
    "5" = "A-5";
    "6" = "A-6";
    "7" = "A-7";
    "8" = "A-8";
    "9" = "A-9";

    # clipboard
    c = "C-S-c";
    v = "C-S-v";
    t = "C-S-t";
    w = "C-S-w";

    q = "A-f4";
  };

  mac_rightcmd = {
  };

  # MacOS Option (⌥

  mac_opt = { };

  # Macos Meh (⌃⌥⇧)
  mac_meh = { };

  # Hyper (⌃⌥⇧⌘)
  mac_hyper = {
    h = "left";
    j = "down";
    k = "up";
    l = "right";
  };

in
{
  main.shift = "oneshot(shift)";
  main.meta = "oneshot(meta)";
  main.control = "oneshot(control)";

  main.capslock = "overload(control, esc)";

  # Left Alt (left from spacebar) becomes MacOS Command
  main.leftalt = "overload(mac_leftcmd, oneshot(mac_leftcmd))";
  "mac_leftcmd:C" = mac_leftcmd; # Keep as Ctrl

  # Right Alt (right from spacebar) becomes MacOS Command
  main.rightalt = "overload(mac_rightcmd, oneshot(mac_rightcmd))";
  "mac_rightcmd:A" = mac_rightcmd; # Keep original Alt

  # Left Meta (two left from spacebar) becomes MacOS Option
  main.leftmeta = "overload(mac_leftopt, oneshot(mac_leftopt))";
  "mac_leftopt:M" = mac_opt; # inherit from original Meta layer

  main.rightcontrol = "overload(mac_meh, oneshot(mac_meh))";
  "mac_meh:C-A-M" = mac_meh;

  main.leftcontrol = "overload(mac_hyper, oneshot(control))";
  "mac_hyper:C-A" = mac_hyper;

}
