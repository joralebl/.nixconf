{lib, ...}: {
  # programs.starship = {
    # enable = true;
    # enableZshIntegration = true;
	
    # settings = {
    #   buf = {
    #     format = "(with [$symbol($version )]($style))";
    #   };
    #
    #   bun = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   c = {
    #     format = "(via [$symbol($version(-$name) )]($style))";
    #   };
    #
    #   cmake = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   cobol = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   crystal = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   daml = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   dart = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   deno = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   dotnet = {
    #     format = "(via [$symbol($version )(🎯 $tfm )]($style))";
    #   };
    #
    #   elixir = {
    #     format = "(via [$symbol($version \(OTP $otp_version\) )]($style))";
    #   };
    #
    #   elm = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   erlang = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   fennel = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   gleam = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   golang = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   haskell = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   helm = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   java = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   julia = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   kotlin = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   lua = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   nim = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   nodejs = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   ocaml = {
    #     format = "(via [$symbol($version )(\($switch_indicator$switch_name\) )]($style))";
    #   };
    #
    #   opa = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   package = {
    #     format = "(is [$symbol$version]($style))";
    #   };
    #
    #   perl = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   php = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   purescript = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   python = {
    #     format = "(via [\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style))";
    #   };
    #
    #   quarto = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   raku = {
    #     format = "(via [$symbol($version-$vm_version )]($style))";
    #   };
    #
    #   red = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   rlang = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   ruby = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   rust = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   scala = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   swift = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   typst = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   vagrant = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   vlang = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    #
    #   zig = {
    #     format = "(via [$symbol($version )]($style))";
    #   };
    # };
    /*
       settings = {
      ""$schema"" = "https://starship.rs/config-schema.json";

      format = lib.concatstrings [
    		"[ ](color_red)"
    		"$os"
    		"$username"
    		"[ ](bg:color_orange fg:color_red)"
    		"$directory"
    		"[ ](fg:color_orange bg:color_aqua)"
    		"$git_branch"
    		"$git_status"
    		"[ ](fg:color_aqua bg:color_blue)"
    		"$c"
    		"$rust"
    		"$golang"
    		"$nodejs"
    		"$php"
    		"$java"
    		"$kotlin"
    		"$haskell"
    		"$python"
    		"[ ](fg:color_blue bg:color_bg3)"
    		"$docker_context"
    		"$conda"
    		"[ ](fg:color_bg3 bg:color_bg1)"
    		"$time"
    		"[ ](fg:color_bg1)"
    		"$line_break$character"
      ];

    format = lib.concatStrings [
    		"(with [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version(-$name) )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style)"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )(🎯 $tfm )]($style))"
    		"(via [$symbol($version \(OTP $otp_version\) )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )(\($switch_indicator$switch_name\) )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(is [$symbol$version]($style) )"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [\${symbol}\${pyenv_prefix}(\${version} )(\($virtualenv\) )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version-$vm_version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    		"(via [$symbol($version )]($style))"
    	];

      palette = "kanagawa";

      palettes.kanagawa = {
    		color_fg0 = "#dcd7ba";  # light text color
    		color_fg1 = "#2a2a37";
    		color_bg1 = "#2a2a37";  # slightly lighter dark background (reverted)
    			color_bg3 = "#363646";  # kept as is
    		color_blue = "#5d87c7";
    		color_aqua = "#4d7b72";
    		color_green = "#98bb6c";
    		color_orange = "#e46826";  # darker orange for better contrast
    		color_purple = "#957fb8";
    		color_red = "#d84141";  # kept the brighter red
    		color_yellow = "#e6c384";
    	};

      os = {
    		disabled = false;
    		style = "bg:color_red fg:color_fg0";
    		symbols = {
    			windows = "󰍲";
    			ubuntu = "󰕈";
    			suse = "";
    			raspbian = "󰐿";
    			mint = "󰣭";
    			macos = "󰀵";
    			manjaro = "";
    			linux = "󰌽";
    			gentoo = "󰣨";
    			fedora = "󰣛";
    			alpine = "";
    			amazon = "";
    			android = "";
    			arch = "󰣇";
    			artix = "󰣇";
    			endeavouros = "";
    			centos = "";
    			debian = "󰣚";
    			redhat = "󱄛";
    			redhatenterprise = "󱄛";
    			pop = "";
    		};
      };

      username = {
    		show_always = true;
    		style_user = "bg:color_red fg:color_fg0";
    		style_root = "bg:color_red fg:color_fg0";
    		format = "[ $user ]($style)";
      };

      directory = {
    		style = "fg:color_fg0 bg:color_orange";
    		format = "[ $path ]($style)";
    		truncation_length = 3;
    		truncation_symbol = "…/";
    		substitutions = {
    	  	documents = "󰈙 ";
    	  	downloads = " ";
    	  	music = "󰝚 ";
    	  	pictures = " ";
    	  	developer = "󰲋 ";
    		};
      };

      git_branch = {
    		symbol = "";
    		style = "bg:color_aqua";
    		format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)";
      };

      git_status = {
    		style = "bg:color_aqua";
    		format = "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)";
      };

    	nodejs = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      c = {
    		symbol = " ";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      rust = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      golang = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      php = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

    	java = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    	};

      kotlin = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      haskell = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      python = {
    		symbol = "";
    		style = "bg:color_blue";
    		format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    	};

    	docker_context = {
    		symbol = "";
    		style = "bg:color_bg3";
    		format = "[[ $symbol( $context) ](fg:#7E9CD8 bg:color_bg3)]($style)";
      };

      conda = {
    		style = "bg:color_bg3";
    		format = "[[ $symbol( $environment) ](fg:#7E9CD8 bg:color_bg3)]($style)";
      };

      time = {
    		disabled = false;
    		time_format = "%R";
    		style = "bg:color_bg1";
    		format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      line_break.disabled = false;

      character = {
    		disabled = false;
    		success_symbol = "[>](bold fg:color_green)";
    		error_symbol = "[>](bold fg:color_red)";
    		vimcmd_symbol = "[<](bold fg:color_green)";
    		vimcmd_replace_one_symbol = "[<](bold fg:color_purple)";
    		vimcmd_replace_symbol = "[<](bold fg:color_purple)";
    		vimcmd_visual_symbol = "[<](bold fg:color_yellow)";
      };
    };
    */
  # };
}
