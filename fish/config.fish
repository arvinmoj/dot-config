if status is-interactive
    set fish_greeting
end

# Paths
set -gx PATH /usr/local/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
set -gx PATH $PATH /Users/macbook/.lmstudio/bin

# Syntax highlighting colors
set -g fish_color_command green
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_error red

# Enable autosuggestions
set -g fish_autosuggestion_enabled 1
set -g fish_autosuggestion_color 555

# History
set -U fish_history_limit 10000

# Directory navigation
abbr .. 'cd ..'
abbr ... 'cd ../..'

# Autosuggestion strategies
set -g fish_autosuggestion_strategy history completion
set -g fish_complete_path /usr/local/share/fish/vendor_completions.d $fish_complete_path

# File listing
abbr ll 'ls -alF'
abbr la 'ls -A'
abbr l 'ls -CF'

# Git
abbr gs 'git status'
abbr ga 'git add'
abbr gc 'git commit'
abbr gp 'git push'
abbr gl 'git log --graph --stat --decorate --all'
abbr gd 'git diff'

# Modern ls
if command -v eza > /dev/null
    abbr ls 'eza -l --icons=always --group-directories-first'
end

abbr tree 'tree -I ".git"'

# FIX 1: Change aliases to abbr (Fish prefers abbr)
abbr mp 'cd /Volumes/MyPartition'
abbr pd 'cd /Volumes/MyPartition/Payrad/repo'

abbr ip-scan-all 'arp -a'
function port-scan --description 'Scan for listening ports, optionally filter with a pattern'
     if test (count $argv) -gt 0
         netstat -an | grep LISTEN | grep $argv
     else
         netstat -an | grep LISTEN
     end
end

abbr gpwd 'base64 < /dev/urandom | tr -d "O0Il1+" | head -c 33; printf "\n"'

# FIX 2: Use functions for KUBECONFIG instead of aliases (they need to set variables)
function kube-mini --description 'Set kubeconfig to minikube'
    set -gx KUBECONFIG /Users/macbook/.kube/minikube
    echo "KUBECONFIG set to minikube"
end

function kube-prod --description 'Set kubeconfig to payrad-prod'
    set -gx KUBECONFIG /Users/macbook/.kube/payrad-prod
    echo "KUBECONFIG set to payrad-prod"
end

function kube-tools --description 'Set kubeconfig to payrad-tools'
    set -gx KUBECONFIG /Users/macbook/.kube/payrad-tools
    echo "KUBECONFIG set to payrad-tools"
end

function kube-stage --description 'Set kubeconfig to payrad-stage'
    set -gx KUBECONFIG /Users/macbook/.kube/payrad-stage
    echo "KUBECONFIG set to payrad-stage"
end

function kube-v2 --description 'Set kubeconfig to kube-v2'
    set -gx KUBECONFIG /Users/macbook/.kube/kube-v2
    echo "KUBECONFIG set to kube-v2"
end

function kube-v2-stage --description 'Set kubeconfig to kube-v2-stage'
    set -gx KUBECONFIG /Users/macbook/.kube/kube-v2-stage
    echo "KUBECONFIG set to kube-v2-stage"
end

function kube-v2-admin --description 'Set kubeconfig to kube-v2-admin'
    set -gx KUBECONFIG /Users/macbook/.kube/kube-v2-admin
    echo "KUBECONFIG set to kube-v2-admin"
end

# Show current kubeconfig
function kube-current --description 'Show current KUBECONFIG'
    echo "Current KUBECONFIG: $KUBECONFIG"
end

# FIX 3: Vim mode and history search
fish_vi_key_bindings

# Remove the vi-mode indicator
function fish_mode_prompt
end

# Optional: Also disable the right prompt
function fish_right_prompt
end

# FIX 4: Control+R for history search - CORRECT IMPLEMENTATION
# Remove your existing bind lines and use:

# For fzf fuzzy history search (RECOMMENDED - install fzf first)
if command -v fzf > /dev/null
    function fzf_history_search
        # Best practice: use null separators for multiline command support
        history -z | fzf --read0 --print0 --no-sort --height=40% --layout=reverse --border --query=(commandline) | read -lz result
        and commandline -- $result
        commandline -f repaint
    end

    bind -M insert \cr fzf_history_search
    bind -M default \cr fzf_history_search
else
    # Fallback to Fish's built-in history pager
    bind -M insert \cr history-pager
    bind -M default \cr history-pager
end

# FIX 5: Add these improvements:

# Better tab completion
set -g fish_pager_color_prefix normal
set -g fish_pager_color_completion normal
set -g fish_pager_color_description 555
set -g fish_pager_color_progress brcyan

# Function for better cd with ls
function cd
    builtin cd $argv
    if test $status -eq 0
        ls
    end
end

# Editor
set -gx EDITOR nvim

# Color support
set -gx CLICOLOR 1
set -gx LSCOLORS ExFxBxDxCxegedabagacad

# Load local config
if test -f ~/.config/fish/config.local.fish
    source ~/.config/fish/config.local.fish
end