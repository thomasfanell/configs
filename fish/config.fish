if status is-interactive
    # Commands to run in interactive sessions can go here
end

if command -q "starship"
    starship init fish | source
end

#
# Conditional configuration based on OS
#
set os_name (uname)

switch $os_name
    case "Linux"
    case "Darwin"
        if command -q "brew"
            fish_add_path /opt/homebrew/bin
        end
end

#
# Set colors
#
set -U fish_color_command "#76bf7d" --bold
set -U fish_color_param "#f1f9f2"
set -U fish_color_comment "#8F908F"
set -U fish_color_error "#ec696a" --bold
set -U fish_color_warning "#e7ec69" --bold
set -U fish_color_operator white --bold
set -U fish_color_redirection white --bold
set -U fish_color_quote "#efc89b"
set -U fish_color_autosuggestion "#c1ddfb"
set -U fish_color_cancel "#000000" --bold --background="#ec696a"
set -U fish_color_normal white
#set -U fish_color_cwd 'green'
#set -U fish_color_cwd_root 'red'
#set -U fish_color_end 'red'
#set -U fish_color_escape 'cyan'
#set -U fish_color_history_current 'cyan'
#set -U fish_color_host 'normal'
#set -U fish_color_match 'brblue'
#set -U fish_color_param 'yellow'
#set -U fish_color_search_match --background='yellow' 'black'
#set -U fish_color_selection --background='brblack' 'white'
#set -U fish_color_status 'red'
#set -U fish_color_user 'normal'
#set -U fish_color_valid_path 'cyan'

