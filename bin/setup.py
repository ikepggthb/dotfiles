import os
import platform


OS_NAME = platform.system()

class DotfileConfig:
    def __init__(self, src, dist, os=None):
        self.src = src
        self.dist = dist
        self.os_list = os or []

    def install(self):
        for src_path, dist_path in zip(self.src, self.dist):
            src_path_absolute = os.path.abspath(os.path.expanduser(src_path))
            dist_path_absolute = os.path.abspath(os.path.expanduser(dist_path))

            if os.path.exists(dist_path_absolute) or os.path.islink(dist_path_absolute):
                os.remove(dist_path_absolute)
                print(f"remove {dist_path_absolute}")
            os.symlink(src_path_absolute, dist_path_absolute)
            print(f"{src_path_absolute} -> {dist_path_absolute}")


# Neovim
neovim_setting = DotfileConfig(
        src=["./nvim"],
        dist=["~/.config/nvim"],
        os=["Linux"])

# i3wm
i3wm_setting = DotfileConfig(
        src=["./i3"],
        dist=["~/.config/i3"],
        os=["Linux"])


# kvantum
kvantum_setting = DotfileConfig(
        src=["./Kvantum"],
        dist=["~/.config/Kvantum"],
        os=["Linux"]
        )

# mozc
mozc_setting = DotfileConfig(
        src=["./mozc"],
        dist=["~/.config/mozc"],
        os=["Linux"]
        )

# rofi
rofi_setting = DotfileConfig(
        src=["./rofi"],
        dist=["~/.config/rofi"],
        os=["Linux"]
        )


# alacritty
class AlacrittyConfig(DotfileConfig):
    def __init__(self):
        super().__init__(
                src=[],
                dist=[],
                os=["Windows", "Linux"])

    def install(self):
        OS_NAME = platform.system()
        if OS_NAME == "Linux":
            self.src = ["./alacritty"]
            self.dist = ["~/.config/alacritty"]
        if OS_NAME == "Windows":
            self.src = ["./alacritty/alacritty.yml"]
            self.dist = ["%APPDATA%\\alacritty\\alacritty.yml"]
        super().install()


alacritty_setting = AlacrittyConfig()

# qt6ct
qt6ct_setting = DotfileConfig(
        src=["./qt6ct"],
        dist=["~/.config/qt6ct"],
        os=["Linux"]
        )

# qt5ct
qt5ct_setting = DotfileConfig(
        src=["./qt5ct"],
        dist=["~/.config/qt5ct"],
        os=["Linux"]
        )

# picom
picom_setting = DotfileConfig(
        src=["./picom"],
        dist=["~/.config/picom"],
        os=["Linux"]
        )

# fcitx5
fcitx5_setting = DotfileConfig(
        src=["./fcitx5"],
        dist=["~/.config/fcitx5"],
        os=["Linux"]
        )

# polybar
polybar_setting = DotfileConfig(
        src=["./polybar"],
        dist=["~/.config/polybar"],
        os=["Linux"]
        )

# starship
starship_setting = DotfileConfig(
        src=["./starship/starship.toml"],
        dist=["~/.config/starship.toml"],
        os=["Linux"]
        )


dotfile_configs = [neovim_setting, i3wm_setting, kvantum_setting, mozc_setting, rofi_setting, alacritty_setting, qt6ct_setting, qt5ct_setting, picom_setting, fcitx5_setting, polybar_setting, starship_setting]


def main():
    for config in dotfile_configs:
        if OS_NAME in config.os_list:
            config.install()


if __name__ == "__main__":
    main()
