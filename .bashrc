# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# <<< Below commands added by user Kevin Patel >>>


alias vi="gvim"
alias py="python3"
alias launch_recognition="roslaunch mir_object_recognition multimodal_object_recognition.launch"
alias event_in="rostopic pub -1 /mir_perception/multimodal_object_recognition/event_in std_msgs/String \"data: \'e_start'\""
alias play_bag="rosbag play -l ~/work/b_it_bot_work/2d_object_detection/b_it_bot_dataset/bagfiles/2022-04-26-15-37-47.bag"

# source bashrc
alias sb='source $HOME/.bashrc'

# colorise ls command
alias ls='ls --color=auto'

# colorise tree command
alias tree='tree -C'

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# colorise grep commands
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# combine cd and ls functions
function cdls(){
    cd "$@" && ls
}


# parent directories aliases
alias ..='cdls ..'
alias ...='cdls ../..'
alias ....='cdls ../../..'
alias .....='cdls ../../../..'


# tmux alias
alias troscore='tmux new -A -s roscore'
alias tbringup='tmux new -A -s bringup'
alias tplanning_bringup='tmux new -A -s planning_bringup'
alias tskynet='tmux new -A -s skynet'
alias tmisc='tmux new -A -s misc'
alias tls='tmux ls'




#ROS 1 and ROS 2 environment setup

source /opt/ros/noetic/setup.bash

#source ~/ros2_foxy/install/local_setup.bash


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kvnptl/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kvnptl/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kvnptl/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kvnptl/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# For b-it-bot lab
#export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/home/kvnptl/work/youBot_from_scratch/src/youbot_driver:\ /home/kvnptl/work/youBot_from_scratch/src/youbot_applications
alias sourceme="source devel/setup.bash"
#alias my_ros_melodic_docker="sudo docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --mount type=bind,source="/home/kvnptl/work/docker_volumes/my_ros_melodic_image/home/.",target=/home --name="kevin_ros_melodic_container" my_ros_melodic_image"

alias bitbots="cd ~/work/b_it_bots_ws"
source ~/work/b_it_bots_ws/devel/setup.bash

# For Udemy ROS course
#alias udemy="cd ~/work/ros_udemy_course/catkin_ws"
#source ~/work/ros_udemy_course/catkin_ws/devel/setup.bash
#export TURTLEBOT3_MODEL=waffle

#export ROBOT=youbot-brsu-4
#export ROBOT_ENV=brsu-c025-sim

#HEART-MET project
alias heartmet="cd ~/work/heart_met_competition/heart_met_ws"

## connect to HSR robot
alias hsr_export_ros="export ROS_MASTER_URI=http://192.168.50.201:11311 && export ROS_IP=192.168.50.52"
#export ROBOT=youbot-brsu-4
#export ROBOT_ENV=brsu-c025-sim

# connect to youBot with fixed camera mount
alias ybr2="ssh -X robocup@192.168.1.114"
alias ybr4="ssh -X robocup@192.168.1.142"
alias youbot_export="export ROS_MASTER_URI=http://192.168.1.114:11311"

# lock from PC
#alias lock="gnome-screensaver-command -a"

# to access at-work lab PC from home
alias uni_work_station_access="ssh -L 32025:10.20.118.78:32025 kpatel2s@home.inf.h-brs.de"

# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt


