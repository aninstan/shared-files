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
alias mkcd='mkdir -p "$1" && cd "$1"'      # Make and enter a directory
alias home='cd ~'                          # Go to home directory
alias winhome='cd /mnt/c/Users/"$1"'       # Go to Windows home directory
alias symlink='ln -s'			   # Symlink

# System and process utilities
alias update='sudo apt update && sudo apt upgrade -y'    # Update & upgrade system packages
alias ports='ss -tulpn'                                  # List all open ports with status
alias psg='ps aux | grep -i'                             # Search running processes by keyword

# =======================================
# GIT SHORTCUTS
# =======================================

# Basic git operations
alias gpl='git pull origin'                         # Pull latest changes from remote
alias gps='git push'				    # Push changes
alias gsh='git stash'                               # Stash current changes
alias ga='git add'                                  # Stage a specific file
alias gaa='git add .'                               # Stage all changes
alias gcm='git commit -m "$*"'                      # Commit with a message
alias gchb='git checkout -b'                        # Create and switch to a new branch
alias gch='git checkout'                            # Switch branches

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
    git checkout -b "$1"'			    # Create and switch to branch
    git push -u origin "$1"'			    # Push and set upstream
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
# LIST COMMANDS
# =======================================

listc() {                                         # Search aliases/functions by keyword
    if [ -z "$1" ]; then
        echo "Usage: listc <keyword>"
        return 1
    fi
    grep -i --color=auto "$1" ~/.bash_aliases
}
