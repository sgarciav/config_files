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

# open pictures
alias pic_open='gnome-open'

# clear screen and go to home directory
alias god='cd && clear'

# analyze tf tree and show results
alias runtf='rosrun tf2_tools view_frames.py && rm frames.gv && evince frames.pdf'

# go to nutria/gtri_car directory automatically
alias go2gtri_car='cd ~/nutria/gtri-car'

# add source statement to .bashrc file
alias src2bashrc='echo "source $(readlink -f ./devel/setup.bash)" >> ~/.bashrc'

# run different ROS visualization programs (eg. rviz, rqt_graph, rqt_console, etc.)
myrosrun() {
	rosrun $1 $1
}

# open document using locate
doc_open() {
	gedit $(echo $(locate $1)) &
}

# speed up videos using ffmpeg
speedup_4x() {
	ffmpeg -i $1 -r 120 -filter:v "setpts=0.25*PTS" $2
}

# generate urdf file from xacro file
xacro2urdf() {
	rosrun xacro xacro.py --inorder $1 roboname:=car0 > urdf_output.urdf
}
