#!/usr/bin/env bash

cd $(dirname $0)

USRLOCAL_BIN=/usr/local/bin
export PATH=$USRLOCAL_BIN:$PATH

__LOG_COLOR_GREEN='\033[38;5;46m'    # 256 green
__LOG_COLOR_YELLOW='\033[38;5;226m'  # 256 yellow
__LOG_COLOR_RED='\033[38;5;196m'     # 256 red
__LOG_COLOR_RESET='\033[39m'         # reset

pr_info()
{
    echo -e "${__LOG_COLOR_GREEN}[Info] $(date '+%Y-%m-%d %H:%M:%S') - $1${__LOG_COLOR_RESET}"
}

pr_warn()
{
    echo -e "${__LOG_COLOR_YELLOW}[Warn] $(date '+%Y-%m-%d %H:%M:%S') - $1${__LOG_COLOR_RESET}"
}

pr_err()
{
    echo -e "${__LOG_COLOR_RED}[Err] $(date '+%Y-%m-%d %H:%M:%S') - $1${__LOG_COLOR_RESET}"
}

# https://github.com/BurntSushi/ripgrep
install_ripgrep()
{
    local version="14.1.1"
    local filename="ripgrep-${version}-x86_64-unknown-linux-musl"
    local filetarball="ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz"
    local exename="rg"
    local bindir=""

    if command -v ${exename} >/dev/null 2>&1; then
        return 0
    fi

    [ -d /bin ] && bindir="/bin"
    [ -d /usr/bin ] && bindir="/usr/bin"
    [ -d /usr/local/bin ] && bindir="/usr/local/bin"

    if [ -z "$bindir" ]; then
        pr_warn "${FUNCNAME[0]} binary directory not found"
        return 1
    fi

    if [ ! -e "${filetarball}" ]; then
        wget https://github.com/BurntSushi/ripgrep/releases/download/${version}/${filetarball}
    fi
    tar -xf ${filetarball} --strip-components 1 --directory=${bindir} ${filename}/${exename}

    chmod +x ${bindir}/${exename}

    if ! command -v ${exename} >/dev/null 2>&1; then
        pr_warn "${FUNCNAME[0]} failed"
        return 1
    fi
}

# https://github.com/astral-sh/uv
install_uv() {

    local version="0.7.3"
    local filename="uv-x86_64-unknown-linux-musl"
    local filetarball="uv-x86_64-unknown-linux-musl.tar.gz"
    local exename="uv"
    local exename2="uvx"
    local bindir=""

    if command -v ${exename} >/dev/null 2>&1; then
        return 0
    fi

    [ -d /bin ] && bindir="/bin"
    [ -d /usr/bin ] && bindir="/usr/bin"
    [ -d /usr/local/bin ] && bindir="/usr/local/bin"

    if [ -z "$bindir" ]; then
        pr_warn "${FUNCNAME[0]} binary directory not found"
        return 1
    fi

    if [ ! -e "${filetarball}" ]; then
        wget https://github.com/astral-sh/uv/releases/download/${version}/${filetarball}
    fi
    tar -xf ${filetarball} --strip-components 1 --directory=${bindir} ${filename}/${exename}
    tar -xf ${filetarball} --strip-components 1 --directory=${bindir} ${filename}/${exename2}

    chmod +x ${bindir}/${exename}

    if ! command -v ${exename} >/dev/null 2>&1; then
        pr_warn "${FUNCNAME[0]} failed"
        return 1
    fi
}

# https://github.com/zellij-org/zellij
__config_zellij() {
    local configdir="${HOME}/.config/zellij"
    local configfile=${configdir}/config.kdl

    [ ! -d ${configdir} ] && mkdir -p ${configdir}

cat > ${configfile} << EOF
keybinds clear-defaults=true {
    locked {
        bind "Ctrl g" { SwitchToMode "normal"; }
    }
    pane {
        bind "left" { MoveFocus "left"; }
        bind "down" { MoveFocus "down"; }
        bind "up" { MoveFocus "up"; }
        bind "right" { MoveFocus "right"; }
        bind "c" { SwitchToMode "renamepane"; PaneNameInput 0; }
        bind "d" { NewPane "down"; SwitchToMode "locked"; }
        bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "locked"; }
        bind "f" { ToggleFocusFullscreen; SwitchToMode "locked"; }
        bind "h" { MoveFocus "left"; }
        bind "i" { TogglePanePinned; SwitchToMode "locked"; }
        bind "j" { MoveFocus "down"; }
        bind "k" { MoveFocus "up"; }
        bind "l" { MoveFocus "right"; }
        bind "n" { NewPane; SwitchToMode "locked"; }
        bind "p" { SwitchToMode "normal"; }
        bind "r" { NewPane "right"; SwitchToMode "locked"; }
        bind "w" { ToggleFloatingPanes; SwitchToMode "locked"; }
        bind "x" { CloseFocus; SwitchToMode "locked"; }
        bind "z" { TogglePaneFrames; SwitchToMode "locked"; }
        bind "tab" { SwitchFocus; }
    }
    tab {
        bind "left" { GoToPreviousTab; }
        bind "down" { GoToNextTab; }
        bind "up" { GoToPreviousTab; }
        bind "right" { GoToNextTab; }
        bind "1" { GoToTab 1; SwitchToMode "locked"; }
        bind "2" { GoToTab 2; SwitchToMode "locked"; }
        bind "3" { GoToTab 3; SwitchToMode "locked"; }
        bind "4" { GoToTab 4; SwitchToMode "locked"; }
        bind "5" { GoToTab 5; SwitchToMode "locked"; }
        bind "6" { GoToTab 6; SwitchToMode "locked"; }
        bind "7" { GoToTab 7; SwitchToMode "locked"; }
        bind "8" { GoToTab 8; SwitchToMode "locked"; }
        bind "9" { GoToTab 9; SwitchToMode "locked"; }
        bind "[" { BreakPaneLeft; SwitchToMode "locked"; }
        bind "]" { BreakPaneRight; SwitchToMode "locked"; }
        bind "b" { BreakPane; SwitchToMode "locked"; }
        bind "h" { GoToPreviousTab; }
        bind "j" { GoToNextTab; }
        bind "k" { GoToPreviousTab; }
        bind "l" { GoToNextTab; }
        bind "n" { NewTab; SwitchToMode "locked"; }
        bind "r" { SwitchToMode "renametab"; TabNameInput 0; }
        bind "s" { ToggleActiveSyncTab; SwitchToMode "locked"; }
        bind "t" { SwitchToMode "normal"; }
        bind "x" { CloseTab; SwitchToMode "locked"; }
        bind "tab" { ToggleTab; }
    }
    resize {
        bind "left" { Resize "Increase left"; }
        bind "down" { Resize "Increase down"; }
        bind "up" { Resize "Increase up"; }
        bind "right" { Resize "Increase right"; }
        bind "+" { Resize "Increase"; }
        bind "-" { Resize "Decrease"; }
        bind "=" { Resize "Increase"; }
        bind "H" { Resize "Decrease left"; }
        bind "J" { Resize "Decrease down"; }
        bind "K" { Resize "Decrease up"; }
        bind "L" { Resize "Decrease right"; }
        bind "h" { Resize "Increase left"; }
        bind "j" { Resize "Increase down"; }
        bind "k" { Resize "Increase up"; }
        bind "l" { Resize "Increase right"; }
        bind "r" { SwitchToMode "normal"; }
    }
    move {
        bind "left" { MovePane "left"; }
        bind "down" { MovePane "down"; }
        bind "up" { MovePane "up"; }
        bind "right" { MovePane "right"; }
        bind "h" { MovePane "left"; }
        bind "j" { MovePane "down"; }
        bind "k" { MovePane "up"; }
        bind "l" { MovePane "right"; }
        bind "m" { SwitchToMode "normal"; }
        bind "n" { MovePane; }
        bind "p" { MovePaneBackwards; }
        bind "tab" { MovePane; }
    }
    scroll {
        bind "Alt left" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
        bind "Alt down" { MoveFocus "down"; SwitchToMode "locked"; }
        bind "Alt up" { MoveFocus "up"; SwitchToMode "locked"; }
        bind "Alt right" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
        bind "e" { EditScrollback; SwitchToMode "locked"; }
        bind "f" { SwitchToMode "entersearch"; SearchInput 0; }
        bind "Alt h" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
        bind "Alt j" { MoveFocus "down"; SwitchToMode "locked"; }
        bind "Alt k" { MoveFocus "up"; SwitchToMode "locked"; }
        bind "Alt l" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
        bind "s" { SwitchToMode "normal"; }
    }
    search {
        bind "c" { SearchToggleOption "CaseSensitivity"; }
        bind "n" { Search "down"; }
        bind "o" { SearchToggleOption "WholeWord"; }
        bind "p" { Search "up"; }
        bind "w" { SearchToggleOption "Wrap"; }
    }
    session {
        bind "a" {
            LaunchOrFocusPlugin "zellij:about" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
        bind "c" {
            LaunchOrFocusPlugin "configuration" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
        bind "d" { Detach; }
        bind "o" { SwitchToMode "normal"; }
        bind "p" {
            LaunchOrFocusPlugin "plugin-manager" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
        bind "w" {
            LaunchOrFocusPlugin "session-manager" {
                floating true
                move_to_focused_tab true
            }
            SwitchToMode "locked"
        }
    }
    shared_among "normal" "locked" {
        bind "Alt left" { MoveFocusOrTab "left"; }
        bind "Alt down" { MoveFocus "down"; }
        bind "Alt up" { MoveFocus "up"; }
        bind "Alt right" { MoveFocusOrTab "right"; }
        bind "Alt +" { Resize "Increase"; }
        bind "Alt -" { Resize "Decrease"; }
        bind "Alt =" { Resize "Increase"; }
        bind "Alt [" { PreviousSwapLayout; }
        bind "Alt ]" { NextSwapLayout; }
        bind "Alt f" { ToggleFloatingPanes; }
        bind "Alt h" { MoveFocusOrTab "left"; }
        bind "Alt i" { MoveTab "left"; }
        bind "Alt j" { MoveFocus "down"; }
        bind "Alt k" { MoveFocus "up"; }
        bind "Alt l" { MoveFocusOrTab "right"; }
        bind "Alt n" { NewPane; }
        bind "Alt o" { MoveTab "right"; }
    }
    shared_except "locked" "renametab" "renamepane" {
        bind "Ctrl g" { SwitchToMode "locked"; }
        bind "Ctrl q" { Quit; }
    }
    shared_except "locked" "entersearch" {
        bind "enter" { SwitchToMode "locked"; }
    }
    shared_except "locked" "entersearch" "renametab" "renamepane" {
        bind "esc" { SwitchToMode "locked"; }
    }
    shared_except "locked" "entersearch" "renametab" "renamepane" "move" {
        bind "m" { SwitchToMode "move"; }
    }
    shared_except "locked" "entersearch" "search" "renametab" "renamepane" "session" {
        bind "o" { SwitchToMode "session"; }
    }
    shared_except "locked" "tab" "entersearch" "renametab" "renamepane" {
        bind "t" { SwitchToMode "tab"; }
    }
    shared_except "locked" "tab" "scroll" "entersearch" "renametab" "renamepane" {
        bind "s" { SwitchToMode "scroll"; }
    }
    shared_among "normal" "resize" "tab" "scroll" "prompt" "tmux" {
        bind "p" { SwitchToMode "pane"; }
    }
    shared_except "locked" "resize" "pane" "tab" "entersearch" "renametab" "renamepane" {
        bind "r" { SwitchToMode "resize"; }
    }
    shared_among "scroll" "search" {
        bind "PageDown" { PageScrollDown; }
        bind "PageUp" { PageScrollUp; }
        bind "left" { PageScrollUp; }
        bind "down" { ScrollDown; }
        bind "up" { ScrollUp; }
        bind "right" { PageScrollDown; }
        bind "Ctrl b" { PageScrollUp; }
        bind "Ctrl c" { ScrollToBottom; SwitchToMode "locked"; }
        bind "d" { HalfPageScrollDown; }
        bind "Ctrl f" { PageScrollDown; }
        bind "h" { PageScrollUp; }
        bind "j" { ScrollDown; }
        bind "k" { ScrollUp; }
        bind "l" { PageScrollDown; }
        bind "u" { HalfPageScrollUp; }
    }
    entersearch {
        bind "Ctrl c" { SwitchToMode "scroll"; }
        bind "esc" { SwitchToMode "scroll"; }
        bind "enter" { SwitchToMode "search"; }
    }
    renametab {
        bind "esc" { UndoRenameTab; SwitchToMode "tab"; }
    }
    shared_among "renametab" "renamepane" {
        bind "Ctrl c" { SwitchToMode "locked"; }
    }
    renamepane {
        bind "esc" { UndoRenamePane; SwitchToMode "pane"; }
    }
}

default_mode "locked"
mouse_mode false
pane_frames false
EOF
}
install_zellij() {
    local version="v0.42.2"
    local filetarball="zellij-x86_64-unknown-linux-musl.tar.gz"
    local exename="zellij"
    local bindir=""
    if command -v ${exename} >/dev/null 2>&1; then
        return 0
    fi

    [ -d /bin ] && bindir="/bin"
    [ -d /usr/bin ] && bindir="/usr/bin"
    [ -d /usr/local/bin ] && bindir="/usr/local/bin"

    if [ -z "$bindir" ]; then
        pr_warn "${FUNCNAME[0]} binary directory not found"
        return 1
    fi

    if [ ! -e "${filetarball}" ]; then
        wget https://github.com/zellij-org/zellij/releases/download/${version}/${filetarball}
    fi
    tar -xf ${filetarball} --directory=${bindir}

    chmod +x ${bindir}/${exename}

    if ! command -v ${exename} >/dev/null 2>&1; then
        pr_warn "${FUNCNAME[0]} failed"
        return 1
    fi
    __config_zellij
}

__download_neovim()
{
    local version="v0.11.1"
    local neovim_name="nvim-linux-x86_64"
    local neovim_tarball="${neovim_name}.tar.gz"
    local neovim_url="https://github.com/neovim/neovim/releases/download/${version}/${neovim_tarball}"
    if [ -e "$neovim_tarball" ]; then
        return 0
    fi

    if command -v mwget >/dev/null 2>&1; then
        mwget -n 10 $neovim_url
    else
        if command -v wget >/dev/null 2>&1; then
            wget $neovim_url
        else
            pr_err "wget: command not found"
            return 1
        fi
    fi

    if [ $? -ne 0 ] || [ ! -e "$neovim_tarball" ]; then
        pr_err "get stable neovim error"
        return 1
    fi
}
__check_neovim_conflict()
{
    local neovim_name="nvim-linux-x86_64"
    local neovim_tarball="${neovim_name}.tar.gz"
    local tempfile=$(mktemp -t temp.XXXXXX)
    local _line=""
    local _ok="false"
    local is_conflict=0
    if [ ! -e "$neovim_tarball" ]; then
        pr_err "$neovim_tarball not found"
        rm -f $tempfile
        return 1
    fi

    tar -tf $neovim_tarball > $tempfile
    if [ $? -ne 0 ]; then
        pr_err "$neovim_tarball decompression failed"
        rm -f $tempfile
        return 1
    fi

    sed -i "s#^${neovim_name}#/usr#g" $tempfile
    sed -i '/.*\/$/d' $tempfile

    while read _line; do
        if [ -n "$_line" ] && [ -e "$_line" ] ; then
            echo -e "\033[33m- [Warn] file $_line conflict\033[0m"
            is_conflict=1
        fi

        if [ x"$_line" == x"/usr/bin/nvim" ]; then
            _ok="true"
        fi
    done  < $tempfile

    rm -f $tempfile

    if [ x"$_ok" != x"true" ]; then
        pr_err "$neovim_tarball seems not be complete"
        return 1
    fi

    return $is_conflict
}

install_neovim() {
    local exename="nvim"
    local neovim_name="nvim-linux-x86_64"
    local neovim_tarball="${neovim_name}.tar.gz"

    if command -v ${exename} >/dev/null 2>&1; then
        return 0
    fi
    __download_neovim || return 1
    __check_neovim_conflict || return 1
    tar -xf $neovim_tarball --strip-components 1 -C /usr/ || return 1
}

[ ! -d $USRLOCAL_BIN ] && mkdir -p $USRLOCAL_BIN

pushd $USRLOCAL_BIN
    install_ripgrep
    install_uv
    install_zellij
    # install_neovim // Required GLIBC_2.34 later
popd

exit 0
