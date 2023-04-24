xhost +
sudo nvidia-docker run -ti -v /tmp/.X11-unix:/tmp/.X11-unix  -v $(pwd)/SuperPoint-SLAM:/root/super-vslam --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -e DISPLAY=$DISPLAY -v $(pwd)/Dataset:/home/Dataset --name=super --gpus all super bash

