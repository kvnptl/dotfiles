
# Basic
alias vi="gvim"
alias py="python3"

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

# git
alias st='git status'
alias br='git branch -a'

# lock from PC
#alias lock="gnome-screensaver-command -a"

# ROS
alias sourceme="source devel/setup.bash"

# b-it-bots
# BELOW alias is for mir_object_recognition package
# alias launch_recognition="roslaunch mir_object_recognition multimodal_object_recognition.launch"
# alias event_in="rostopic pub -1 /mir_perception/multimodal_object_recognition/event_in std_msgs/String \"data: \'e_start'\""
# alias play_bag="rosbag play -l -q ~/work/b_it_bot_work/2d_object_detection/b_it_bot_dataset/bagfiles/2022-04-26-15-37-47.bag"
# alias play_bag_2="rosbag play -l -q ~/work/b_it_bot_work/2d_object_detection/b_it_bot_dataset/summer_competition_22_dataset/bagfiles_ss22_dataset_local_competition/2022-08-31-10-06-58.bag"
alias bitbots="cd ~/work/b_it_bots/b_it_bots_ws"
alias yb2="ssh -X robocup@192.168.1.114"
alias yb4="ssh -X robocup@192.168.1.142"
alias yb3="ssh -X robocup@192.168.1.116"
alias youbot_export="export ROS_MASTER_URI=http://192.168.1.114:11311"
alias yb2_eth="ssh -X robocup@192.168.1.138"
alias anylabel="conda activate anylabeling && anylabeling"

# to access at-work lab PC from home
alias tuni_hbrs_vpn='tmux new -A -s uni_hbrs_vpn'
alias uni_work_station_access="sudo openvpn ~/Documents/HBRS_vpn/client.conf"
alias work_lab_cluster="ssh -X kpatel2s@10.20.118.78"
alias work_lab_cluster-folders="sshfs kpatel2s@10.20.118.78:/home/kpatel2s/kpatel2s /home/kvnptl/HBRS/cloud_drive_mounts/uni_hbrs_work_lab_gpu"
alias work_lab_cluster-folders-datasets="sshfs kpatel2s@10.20.118.78:/srv/disk1/datasets/kpatel2s_datasets /home/kvnptl/HBRS/cloud_drive_mounts/uni_hbrs_work_lab_gpu_datasets"
