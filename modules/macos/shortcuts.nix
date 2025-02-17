{}: {
  system.defaults = {
    CustomUserPreferences = {

      # Keyboard Shortcuts
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # Spotlight Search
          "64" = {
            enabled = false;
            value = {
              parameters = [ 32 49 1048576 ];
              type = "standard";
            };
          };
          # Finder Search
          "65" = {
            enabled = false;
            value = {
              parameters = [ 32 49 1048576 ];
              type = "standard";
            };
          };
          # Not sure, but keeps poping up
          # "98" = {
          #   enabled = true;
          #   value = {
          #     parameters = [ 47 44 1179648 ];
          #     type = "standard";
          #   };
          # };
        };
      };

      # Windows and Tabs
      # need to reset app for changes to take place
      NSGlobalDomain = {
        NSUserKeyEquivalents = {
          # Window Tiles
          "Left" = "^$h";
          "Right" = "^$l";
          "Fill" = "^$k";
          "Left &amp; Right" = "^$y";
          "Right &amp; Left" = "^$o";

          # Window Screens
          "Move to Built-in Retina Display" = "^$i";
          "Move to DELL U2719D" = "^$i";

          # Window Splits
          "Select Split Above" = "~k";
          "Select Split Bellow" = "~j";
          "Select Split Left" = "~h";
          "Select Split Right" = "~l";
          "Zoom Split" = "@$\\U21a9";

          # Tabs
          "Show Next Tab" = "~i";
          "Select Next Tab" = "~i";
          "Show Previous Tab" = "~u";
          "Select Previous Tab" = "~u";
        };
      };
    };
  };
}
