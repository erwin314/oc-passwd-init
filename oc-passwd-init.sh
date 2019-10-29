#!/bin/ash

# Make sure the work folder exists. It should be mounted, but during testing it might be missing.
mkdir -p /work 

# Copy the original passwd file
cp /etc/passwd /work/passwd 

# Check if we are running as a user without a passwd entry
if ! whoami &> /dev/null; then     
    # Add the current user
    USER_NAME=${USER_NAME:-user_$(id -u)}
    USER_HOME=${USER_HOME:-/home/${USER_NAME}}
    echo '${USER_NAME}:x:$(id -u):0:${USER_NAME} user:${USER_HOME}:/sbin/nologin' >> /work/passwd
fi
