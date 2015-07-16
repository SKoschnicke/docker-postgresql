# NOTE that this won't work unless docker container is started with
# --ipc host. With a recent kernel (>=3.16) the settings are
# automatically propagated from the host, so it shouldn't be needed
# anyway. Just keeping this file around if someone with an old kernel
# stumbles opon the issue.
#
# see also https://github.com/docker/docker/issues/10176

#sysctl -w kernel.shmmax=17179869184
#sysctl -w kernel.shmall=4194304
