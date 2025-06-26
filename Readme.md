# 🖥️ Sway Minimal Configuration

**A sleek, minimal, and efficient configuration for the Sway tiling window manager.**

This repository provides a complete, plug-and-play setup for a modern Wayland desktop environment, built around Sway. It includes curated configurations for essential tools like Rofi, Waybar, and Swaylock, ensuring a cohesive and beautiful user experience out of the box.

![License](https://img.shields.io/badge/license-MIT-blue.svg)![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)



---

## ✨ Features

*   **Minimalist Design**: A clean, distraction-free aesthetic that prioritizes content.
*   **Lightweight & Fast**: Optimized for performance on a wide range of hardware.
*   **Integrated Tooling**: Pre-configured Rofi, Waybar, and Swaylock for a seamless workflow.
*   **Sensible Keybindings**: Intuitive shortcuts for window management, application launching, and system controls.
*   **Easy Customization**: Well-organized and commented files make personalization simple.
*   **Beginner Friendly**: Get a fully functional tiling window manager running in minutes.

## 📋 Table of Contents

*   [Prerequisites](#-prerequisites)
*   [Installation](#-installation)
*   [Keybindings](#️-keybindings)
*   [Customization](#-customization)
*   [Repository Structure](#-repository-structure)
*   [Additional Resources](#-additional-resources)

## 🧰 Prerequisites

Before you begin, ensure you have the necessary packages installed on your system. The primary components of this setup are:

*   **`sway`**: The tiling Wayland compositor.
*   **`waybar`**: A highly customizable Wayland status bar.
*   **`rofi`**: A powerful window switcher, application launcher, and dmenu replacement.
*   **`swaylock-effects`**: A screen locker for Wayland with added visual effects.
*   **`alacritty`**: A fast, GPU-accelerated terminal emulator.
*   **`noto-fonts-emoji`**: For proper emoji rendering.
*   **`git`**: For cloning this repository.

### Package Installation

> [!NOTE]
> Package names may differ slightly across Linux distributions.

#### **Arch Linux / Arch-based**
```bash
sudo pacman -S sway waybar rofi
```

#### **Ubuntu / Debian**
```bash
sudo apt install sway waybar rofi
```

#### **Fedora**
```bash
sudo dnf install sway waybar rofi
```

## 🚀 Installation

Follow these simple steps to install the configuration.

1.  **Clone the Repository**
    Open a terminal and clone this repository to your local machine.
    ```bash
    git clone https://github.com/Ajaybalajiprasad/sway.git
    cd sway
    ```

2.  **Copy Configuration Files**
    This command will copy the configuration directories into your user's `.config` directory.
    ```bash
    cp -r ./* ~/.config/
    ```
    > [!WARNING]
    > This will overwrite any existing configurations you have for these applications. Back up your files if necessary!

3.  **Launch Sway**
    Log out of your current desktop session. From your display manager (like GDM or LightDM), select "Sway" and log in. Alternatively, you can start Sway from a TTY by running:
    ```bash
    sway
    ```
You should now be greeted with your new, fully configured Sway desktop!

---

## ⌨️ Keybindings

This configuration uses the **`Super`** key (Windows key) as the primary modifier (`$mod`). Navigation is based on Vim keys, but arrow keys are also supported.

### Application & Utility Shortcuts

| Key Combination | Action |
| :--- | :--- |
| `$mod + T` | Open a new terminal (`foot`) |
| `$mod + D` | Open application launcher (Rofi) |
| `$mod + Shift + D` | Open run command launcher (Rofi) |
| `$mod + Tab` | Show window switcher (Rofi) |
| `$mod + Shift + E` | Open file manager (`thunar`) |
| `$mod + Shift + F` | Launch Firefox |
| `$mod + Shift + B` | Launch Brave Browser |
| `$mod + Shift + V` | Show clipboard history (Wofi) |

### System & Session Control

| Key Combination | Action |
| :--- | :--- |
| `$mod + Q` | Kill the focused window |
| `$mod + Shift + C` | Reload Sway configuration |
| `$mod + Ctrl + L` | Lock the screen and suspend the system |
| `$mod + Ctrl + U` | Shut down the system immediately |

### Window & Layout Management

| Key Combination | Action |
| :--- | :--- |
| `$mod + H/J/K/L` | Change focused window (left/down/up/right) |
| `$mod + Arrow Keys` | Change focused window |
| `$mod + Shift + H/J/K/L` | Move focused window |
| `$mod + Shift + Arrow Keys`| Move focused window |
| `$mod + F` | Toggle fullscreen for focused window |
| `$mod + Shift + Space` | Toggle floating for focused window |
| `$mod + Space` | Switch focus between tiling and floating windows |
| `$mod + R` | Enter resize mode (use arrows or HJKL to resize) |

### Layout Styles

| Key Combination | Action |
| :--- | :--- |
| `$mod + E` | Toggle between horizontal and vertical split |
| `$mod + B` | Set layout to split horizontally |
| `$mod + V` | Set layout to split vertically |
| `$mod + S` | Set layout to stacking |
| `$mod + W` | Set layout to tabbed |

### Workspace Management

| Key Combination | Action |
| :--- | :--- |
| `$mod + 1-9, 0` | Switch to workspace 1-10 |
| `$mod + Shift + 1-9, 0` | Move focused window to workspace 1-10 |
| `$mod + Minus` | Show/hide the scratchpad |
| `$mod + Shift + Minus` | Move focused window to the scratchpad |

### Hardware & Media Controls

| Key Combination | Action |
| :--- | :--- |
| `PrintScreen` | Take a fullscreen screenshot |
| `Shift + PrintScreen` | Take a screenshot of a selected area |
| `$mod + Shift + R` | Start a screen recording |
| `Volume Keys` | Adjust system audio volume |
| `Brightness Keys` | Adjust screen brightness |

## 🎨 Customization

The configuration is designed to be easily modified. All files are located in your `~/.config` directory.

*   **Sway (`~/.config/sway/config`)**: The main control file. Change keybindings, startup applications, window rules, and output settings here.

*   **Waybar (`~/.config/waybar/`)**:
    *   `config`: Add, remove, or re-arrange modules on your status bar.
    *   `style.css`: Change colors, fonts, and spacing using CSS.

*   **Rofi (`~/.config/rofi/`)**: 
    * `theme.rasi`: Modify this file to change the theme, layout, and behavior of the Rofi launcher.
    * `config.rasi`: Default configuration for rasi include theme.rasi here.

*   **Swaylock (`~/.config/swaylock/config`)**: Adjust the appearance of your lock screen.

## 📁 Repository Structure

```
.
├── rofi/
│   └── config.rasi      # Rofi theme and behavior configuration
|   └── theme.rasi       # styles and theme for rofi
├── sway/
│   └── config           # Main Sway compositor configuration
├── swaylock/
│   └── config           # Swaylock screen locker settings
└── waybar/
    ├── config           # Waybar module layout and settings
    └── style.css        # CSS styling for Waybar's appearance
```

## 📚 Additional Resources

For more in-depth documentation, refer to the official project pages:

*   [Sway Official Website & Wiki](https://swaywm.org/)
*   [Waybar GitHub Repository](https://github.com/Alexays/Waybar)
*   [Rofi GitHub Repository](https://github.com/davatorium/rofi)

---

Congrats you're an sway user now !! 

updated by `@ajaybalajiprasad`
