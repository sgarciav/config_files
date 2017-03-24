## tinwhistle box ~/.bash_aliases file for user
# User specific aliases and functions

# start from home directory
cd ~

# source bashrc 
alias runbashrc='source ~/.bashrc'

# Clear the terminal
alias cls='clear'

# view the ROS package ros environment variable
alias ros_pack_path='echo $ROS_PACKAGE_PATH'

# remove directory
alias rmdir='rm -rf'

# source setup bash for building catkin workspaces
alias srcSetup='source devel/setup.bash'

# run different ROS visualization programs (eg. rviz, rqt_graph, rqt_console, etc.)
myrosrun() {
	rosrun $1 $1
}

# clear screen and go to home directory
alias god='cd && clear'

# analyze tf tree and show results
alias runtf='rosrun tf2_tools view_frames.py && rm frames.gv && evince frames.pdf'

# open document using locate
doc_open() {
	gedit $(echo $(locate $1))
}
