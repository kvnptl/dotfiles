alias hello="echo Hello, Kevin!"

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

# For ROS
alias sourceme="source devel/setup.bash"

# connect to HSR robot
alias hsr_export_ros="export ROS_MASTER_URI=http://192.168.50.201:11311 && export ROS_IP=192.168.50.52"

# connect to youBot with fixed camera mount
alias ybr2="ssh -X robocup@192.168.1.114"
alias ybr4="ssh -X robocup@192.168.1.142"
alias youbot_export="export ROS_MASTER_URI=http://192.168.1.114:11311"

# lock from PC
#alias lock="gnome-screensaver-command -a"

# to access at-work lab PC from home
alias uni_work_station_access="ssh -L 32025:10.20.118.78:32025 kpatel2s@home.inf.h-brs.de"

# Git
alias st="git status"

#alias my_ros_melodic_docker="sudo docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --mount type=bind,source="/home/kvnptl/work/docker_volumes/my_ros_melodic_image/home/.",target=/home --name="kevin_ros_melodic_container" my_ros_melodic_image"
