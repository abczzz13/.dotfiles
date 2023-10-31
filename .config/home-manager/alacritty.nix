{
    env = {
        "TERM" = "xterm-256color";
    };
    font = {
        normal = {
            # family = "IntelOne Mono";
            family = "MesloLGS NF";
            style = "Regular";
        };
        bold = {
            # family = "IntelOne Mono";
            family = "MesloLGS NF";
            style = "Bold";
        };
        italic = {
            # family = "IntelOne Mono";
            family = "MesloLGS NF";
            style = "Italic";
        };
        bold_italic = {
            # family = "IntelOne Mono";
            family = "MesloLGS NF";
            style = "Bold Italic";
        };
        size = 10.0;
    };

    selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
        save_to_clipboard = true;
    };

    mouse = {
        hints = {
            launcher = {
                program = "open";
            };
        modifiers = "Command";
        };
    };

    window = {
        dimensions = {
            columns = 0;
            lines = 0;
        };
        padding = {
            x = 2;
            y = 2;
        };

        dynamic_padding = false;
        decorations = "none";  #buttonless
        opacity = 0.90;
        startup_mode = "Windowed";
    };


    scrolling = {
        history = 100000;
        multiplier = 3;
        auto_scroll = false;
    };

    key_bindings = [
        # https://github.com/alacritty/alacritty/issues/62#issuecomment-347552058
        { key = "A";         mods = "Alt";       chars = "\\x1ba";                       }
        { key = "B";         mods = "Alt";       chars = "\\x1bb";                       }
        { key = "C";         mods = "Alt";       chars = "\\x1bc";                       }
        { key = "D";         mods = "Alt";       chars = "\\x1bd";                       }
        { key = "E";         mods = "Alt";       chars = "\\x1be";                       }
        { key = "F";         mods = "Alt";       chars = "\\x1bf";                       }
        { key = "G";         mods = "Alt";       chars = "\\x1bg";                       }
        { key = "H";         mods = "Alt";       chars = "\\x1bh";                       }
        { key = "I";         mods = "Alt";       chars = "\\x1bi";                       }
        { key = "J";         mods = "Alt";       chars = "\\x1bj";                       }
        { key = "K";         mods = "Alt";       chars = "\\x1bk";                       }
        { key = "L";         mods = "Alt";       chars = "\\x1bl";                       }
        { key = "M";         mods = "Alt";       chars = "\\x1bm";                       }
        { key = "N";         mods = "Alt";       chars = "\\x1bn";                       }
        { key = "O";         mods = "Alt";       chars = "\\x1bo";                       }
        { key = "P";         mods = "Alt";       chars = "\\x1bp";                       }
        { key = "Q";         mods = "Alt";       chars = "\\x1bq";                       }
        { key = "R";         mods = "Alt";       chars = "\\x1br";                       }
        { key = "S";         mods = "Alt";       chars = "\\x1bs";                       }
        { key = "T";         mods = "Alt";       chars = "\\x1bt";                       }
        { key = "U";         mods = "Alt";       chars = "\\x1bu";                       }
        { key = "V";         mods = "Alt";       chars = "\\x1bv";                       }
        { key = "W";         mods = "Alt";       chars = "\\x1bw";                       }
        { key = "X";         mods = "Alt";       chars = "\\x1bx";                       }
        { key = "Y";         mods = "Alt";       chars = "\\x1by";                       }
        { key = "Z";         mods = "Alt";       chars = "\\x1bz";                       }
        { key = "A";         mods = "Alt|Shift"; chars = "\\x1bA";                       }
        { key = "B";         mods = "Alt|Shift"; chars = "\\x1bB";                       }
        { key = "C";         mods = "Alt|Shift"; chars = "\\x1bC";                       }
        { key = "D";         mods = "Alt|Shift"; chars = "\\x1bD";                       }
        { key = "E";         mods = "Alt|Shift"; chars = "\\x1bE";                       }
        { key = "F";         mods = "Alt|Shift"; chars = "\\x1bF";                       }
        { key = "G";         mods = "Alt|Shift"; chars = "\\x1bG";                       }
        { key = "H";         mods = "Alt|Shift"; chars = "\\x1bH";                       }
        { key = "I";         mods = "Alt|Shift"; chars = "\\x1bI";                       }
        { key = "J";         mods = "Alt|Shift"; chars = "\\x1bJ";                       }
        { key = "K";         mods = "Alt|Shift"; chars = "\\x1bK";                       }
        { key = "L";         mods = "Alt|Shift"; chars = "\\x1bL";                       }
        { key = "M";         mods = "Alt|Shift"; chars = "\\x1bM";                       }
        { key = "N";         mods = "Alt|Shift"; chars = "\\x1bN";                       }
        { key = "O";         mods = "Alt|Shift"; chars = "\\x1bO";                       }
        { key = "P";         mods = "Alt|Shift"; chars = "\\x1bP";                       }
        { key = "Q";         mods = "Alt|Shift"; chars = "\\x1bQ";                       }
        { key = "R";         mods = "Alt|Shift"; chars = "\\x1bR";                       }
        { key = "S";         mods = "Alt|Shift"; chars = "\\x1bS";                       }
        { key = "T";         mods = "Alt|Shift"; chars = "\\x1bT";                       }
        { key = "U";         mods = "Alt|Shift"; chars = "\\x1bU";                       }
        { key = "V";         mods = "Alt|Shift"; chars = "\\x1bV";                       }
        { key = "W";         mods = "Alt|Shift"; chars = "\\x1bW";                       }
        { key = "X";         mods = "Alt|Shift"; chars = "\\x1bX";                       }
        { key = "Y";         mods = "Alt|Shift"; chars = "\\x1bY";                       }
        { key = "Z";         mods = "Alt|Shift"; chars = "\\x1bZ";                       }
        { key = "Key1";      mods = "Alt";       chars = "\\x1b1";                       }
        { key = "Key2";      mods = "Alt";       chars = "\\x1b2";                       }
        { key = "Key3";      mods = "Alt";       chars = "\\x1b3";                       }
        { key = "Key4";      mods = "Alt";       chars = "\\x1b4";                       }
        { key = "Key5";      mods = "Alt";       chars = "\\x1b5";                       }
        { key = "Key6";      mods = "Alt";       chars = "\\x1b6";                       }
        { key = "Key7";      mods = "Alt";       chars = "\\x1b7";                       }
        { key = "Key8";      mods = "Alt";       chars = "\\x1b8";                       }
        { key = "Key9";      mods = "Alt";       chars = "\\x1b9";                       }
        { key = "Key0";      mods = "Alt";       chars = "\\x1b0";                       }
        { key = "Space";     mods = "Control";   chars = "\\x00";                        } # Ctrl + Space
        { key = "Grave";     mods = "Alt";       chars = "\\x1b`";                       } # Alt + `
        { key = "Grave";     mods = "Alt|Shift"; chars = "\\x1b~";                       } # Alt + ~
        { key = "Period";    mods = "Alt";       chars = "\\x1b.";                       } # Alt + .
        { key = "Key8";      mods = "Alt|Shift"; chars = "\\x1b*";                       } # Alt + *
        { key = "Key3";      mods = "Alt|Shift"; chars = "\\x1b#";                       } # Alt + #
        { key = "Period";    mods = "Alt|Shift"; chars = "\\x1b>";                       } # Alt + >
        { key = "Comma";     mods = "Alt|Shift"; chars = "\\x1b<";                       } # Alt + <
        { key = "Minus";     mods = "Alt|Shift"; chars = "\\x1b_";                       } # Alt + _
        { key = "Key5";      mods = "Alt|Shift"; chars = "\\x1b%";                       } # Alt + %
        { key = "Key6";      mods = "Alt|Shift"; chars = "\\x1b^";                       } # Alt + ^
        # { key = "Backslash"; mods = "Alt";       chars = "\\x1b\\";                      } # Alt + \
        # { key = "Backslash"; mods = "Alt|Shift"; chars = "\\x1b|";                       } # Alt + |
    ];

    colors = {
        # Colors (Gruvbox Material Dark Medium)
        primary = {
            background = "0x282828";
            foreground = "0xdfbf8e";
        };
        normal = {
            black = "0x665c54";
            red = "0xea6962";
            green = "0xa9b665";
            yellow = "0xe78a4e";
            blue = "0x7daea3";
            magenta = "0xd3869b";
            cyan = "0x89b482";
            white = "0xdfbf8e";
        };
        bright = {
            black = "0x928374";
            red = "0xea6962";
            green = "0xa9b665";
            yellow = "0xe3a84e";
            blue = "0x7daea3";
            magenta = "0xd3869b";
            cyan = "0x89b482";
            white = "0xdfbf8e";
        };
    };
}
