{ config, lib, pkgs, ... }:
{
	imports =
		[ 
		./hardware-configuration.nix
    ./packages.nix
		];
	boot = {
    tmp.cleanOnBoot = true;
		loader = {
			systemd-boot.enable = true;
			systemd-boot.editor = false;
			efi.canTouchEfiVariables = true;
			efi.efiSysMountPoint = "/boot";
      timeout = 0;
		};
	};

	networking = {
		hostName = "VoxNixOS"; 
		networkmanager.enable = true;  

		firewall = {
			enable = true;
			allowedTCPPorts = [];	
			allowedUDPPorts = [];	
		};	
	};

	hardware = {
		graphics.enable = true;
		nvidia = {
			modesetting.enable = true;
			powerManagement.enable = false;
			powerManagement.finegrained = false;
			open = true;
			nvidiaSettings = true;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};
	};

	security.rtkit.enable = true;
	services = {
		printing.enable = true;
		flatpak.enable = true;
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			jack.enable = true;
			pulse.enable = true;
			wireplumber.enable = true;

			extraConfig.pipewire."92-low-latency" = {
				context.properties = {
					default.clock.rate = 48000;
					default.clock.quantum = 32;
					default.clock.min.quantum = 32;
					default.clock.max.quantum = 32;
				};
			};
		};
		xserver = {
      enable = true;
			videoDrivers = ["nvidia"];
			xkb.layout = "fr";

      windowManager.awesome.enable = true;

			displayManager.gdm = {
				enable = true;
        #      wayland = true;
			};
		};

	};

	time.timeZone = "Europe/Paris";

	console = {
		font = "Lat2-Terminus16";
		useXkbConfig = true; 
	};

	users.users.voxa = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "input" ]; 
    shell = pkgs.zsh;
	};

	nixpkgs.config.allowUnfree = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs;[
        xdg-desktop-portal-gtk
        #xdg-desktop-portal-wlr
      ];
    };
  };
	
	environment = {
		sessionVariables = {
			GBM_BACKEND = "nvidia-drm";
			__GLX_VENDOR_LIBRARY_NAME = "nvidia";
			LIBVA_DRIVER_NAME = "nvidia";
			__GL_GSYNC_ALLOWED = "1";
			__GL_VRR_ALLOWED = "0";
      /* NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      WLR_DRM_NO_ATOMIC = "1"; */
		};
	};

	fonts.packages = with pkgs;[
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		font-awesome
		liberation_ttf
		fira-code
		fira-code-symbols
		(nerdfonts.override {fonts = ["FiraCode"];})
	];

	programs = {
		nix-ld.enable = true;
    zsh.enable = true;

		/* hyprland = { 
			enable = true;
      xwayland.enable = true;
		}; */
	};

	nix.settings.experimental-features =["nix-command" "flakes"];
	system.stateVersion = "24.05"; 
}

