#!/bin/bash

USER=$(getent passwd sbt 2>&1)
GROUP=$(getent group sbt 2>&1)

echo "==> Attempting to create 'sbt' user."

if [ ${#USER} == 0 ] && [ ${#GROUP} == 0 ]; then
    # Create the user with the given home directory.
    echo "    Creating user with UID:GID of ${SBT_UID}:${SBT_GID}"
    groupadd -g ${SBT_GID} -o sbt
    useradd -s /bin/bash -u ${SBT_UID} -g ${SBT_GID} -d ${SBT_HOME} -M -o sbt
else
    echo "    User 'sbt' already exists."
fi

echo "==> Attempting to create home directory at '${SBT_HOME}'."

# Create the home directory, if it doesn't already exist. We won't bother with the skeleton.
if [ ! -d "${SBT_HOME}" ]; then
    mkdir -p "${SBT_HOME}"
    echo "    Done!"
else
    echo "    Already exists!"
fi

echo "==> Attempting to create working directory at '${SBT_WORKDIR}'."

# Create the workspace.
if [ ! -d "${SBT_WORKDIR}" ]; then
    mkdir -p "${SBT_WORKDIR}"
    echo "    Done!"
else
    echo "    Already exists!"
fi

echo "==> Updating home and working directory permissions..."

chown ${SBT_UID}:${SBT_GID} "${SBT_HOME}"
chown ${SBT_UID}:${SBT_GID} "${SBT_WORKDIR}"

echo "    Done!"

echo "==> Running CMD..."

cd "${SBT_WORKDIR}"

exec gosu sbt "$@"
