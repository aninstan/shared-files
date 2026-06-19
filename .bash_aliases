# =======================================
# NAVIGATION SHORTCUTS
# =======================================

alias ..='cd ..'            # Move up one directory
alias ...='cd ../..'        # Move up two directories
alias ....='cd ../../..'    # Move up three directories

alias c='clear'             # Clear terminal output

# =======================================
# LINUX UTILS
# =======================================

# Directory and path shortcuts
mkcd() { 
    mkdir -p "$1" && cd "$1"
}

winhome() { 
    cd "/mnt/c/Users/$1"
}
alias symlink='ln -s'						 # Symlink

sdir() {							 # Searches directories
    if [ -z "$1" ]; then
        echo "Usage: sdir <directory-name>"
        return 1
    fi
    find ~ -type d -name "$1" -printf '%p\n'
}

search() {							 # Searches files and directories
    if [ -z "$1" ]; then
        echo "Usage: search <pattern>"
        return 1
    fi
    find ~ -name "*$1*" -printf '%p\n'
}

# System and process utilities
alias update='sudo apt update && sudo apt upgrade -y'    # Update & upgrade system packages
alias ports='ss -tulpn'                                  # List all open ports with status
alias psg='ps aux | grep -i'                             # Search running processes by keyword
alias src='. ~/.bashrc'					 # Reload source
alias macsrc='source ~/.zshrc'                           # Reload on mac/zsh

# Dos2unix all files in folder
alias d2u='dos2unix'
alias d2ud="find . -type f -exec dos2unix {} +"		

# Overrides for basic commands
alias ls='ls -l'
alias lsa='ls -la'

# Mac specifics
alias copy='pbcopy <'

alias brewi='brew install'
alias brewic='brew install --cask'
alias brewupg='brew upgrade --greedy'

alias brewu='brew uninstall'
alias brewuc='brew uninstall --cask'
alias brewc='brew cleanup'

# =======================================
# GIT SHORTCUTS
# =======================================

# Basic git operations
alias gpl='git pull origin'                         # Pull latest changes from remote
alias gps='git push'				    # Push changes
alias gsh='git stash'                               # Stash current changes
alias ga='git add'                                  # Stage a specific file
alias gaa='git add .'                               # Stage all changes
alias gchb='git checkout -b'                        # Create and switch to a new branch
alias gch='git checkout'                            # Switch branches

gcm() {
    if [ $# -eq 0 ]; then
        echo "Usage: gcm <commit message>"
        return 1
    fi
    git commit -m "$*"
}

# Status, log, and branch management
alias gst='git status'                              # Show git status
alias gco='git checkout'                            # Checkout branch (duplicate of gch)
alias gl='git log --oneline --graph --decorate --all'  # Pretty log graph
alias gb='git branch'                               # List local branches
alias gpo='git push origin'                         # Push a branch to origin
alias gplr='git pull --rebase'                      # Pull with rebase to avoid merge commits

# Functions for advanced git workflow
gcb() {                                             # Create branch and push to remote
    if [ -z "$1" ]; then
        echo "Usage: gcb <branch-name>"
        return 1
    fi
    git checkout -b "$1"			    # Create and switch to branch
    git push -u origin "$1"			    # Push and set upstream
}

gpsh() {                                            # Push current branch to remote
    branch=$(git rev-parse --abbrev-ref HEAD)       # Get current branch name
    git push -u origin "$branch"                    # Push and set upstream
}

# =======================================
# DOCKER SHORTCUTS
# =======================================

# Docker Compose commands
alias dcu='docker compose up'                     # Start services defined in docker-compose
alias dcd='docker compose down'                   # Stop and remove services
alias dcuro='docker compose up --remove-orphans'
alias dcdv='docker compose down -v'

# Container management
alias dst='docker start'                          # Start a stopped container
alias dss='docker stop'                           # Stop a running container
alias dkl='docker kill'                           # Kill a container immediately
alias dla='docker ps -a'                          # List all containers

# General Docker commands
alias dps='docker ps'                             # Show running containers
alias dpsa='docker ps -a'                         # Show all containers
alias dim='docker images'                         # List Docker images
alias drm='docker rm'                             # Remove a container
alias drmi='docker rmi'                           # Remove an image
alias dlogs='docker logs -f'                      # Follow container logs
alias dclean='docker system prune -af'            # Remove all unused data

# Docker exec function
dexec() {                                        # Enter container shell
    if [ -z "$1" ]; then
        echo "Usage: dexec <container> [shell]"
        return 1
    fi
    docker exec -it "$1" "${2:-bash}"            # Default to bash if shell not provided
}

dcuf() {
    docker compose -f "$1" up "${@:2}"
}

dcdf() {
    docker compose -f "$1" down "${@:2}"
}

dcdfv() {
    docker compose -f "$1" down -v --remove-orphans "${@:2}"
}

# =======================================
# MAVEN SHORTCUTS
# =======================================

alias mcli='mvn clean install'                   # Clean and install dependencies + build project
alias mclc='mvn clean compile'                   # Clean and compile project
alias mclean='mvn spotless:apply'                # Apply code formatting (Spotless plugin)
alias mpkg='mvn clean package'                   # Clean and package the project

# =======================================
# QUARKUS (MAVEN) SHORTCUTS
# =======================================

alias qur='./mvnw quarkus:run'                   # Run Quarkus application
alias qud='./mvnw quarkus:dev'                   # Start Quarkus in dev mode
alias qudd='./mvnw quarkus:dev -Ddebug'          # Start Quarkus dev mode with debug enabled

# =======================================
# PYTHON
# =======================================

alias venv=‘python3 -m venv .venv’		# Create venv
alias avenv='source .venv/bin/Activate'		# Activate venv
alias req=‘pip install -r requirements.txt’	# Install requirements

# =======================================
# LIST COMMANDS
# =======================================

listc() {                                         # Search aliases/functions by keyword
    if [ -z "$1" ]; then
        echo "Usage: listc <keyword>"
        return 1
    fi
    grep -i --color=auto "$1" ~/.bash_aliases
}

# =======================================
# KUBERNETES / RANCHER
# =======================================

alias k='kubectl'				# Kubectl shortcut
alias ks='k9s'					# Start k9s

alias rdsd='rdctl shutdown'			# Shutdown rancher desktop
alias rdrs='rdctl reset'			# Reset kubernetes and containers
