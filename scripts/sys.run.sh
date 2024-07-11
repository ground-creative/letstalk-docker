#!/bin/sh

VOLUME_PATH=$(realpath "$VOLUME")

# Add a 10-second sleep to debug start script
if [ "${TEST}" = true ]; then 
	echo "Sleeping for 10 seconds..."
	sleep 10
fi

# Clone repository if not already present or empty
if [ -n "${APP_REPOSITORY_URL}" ] && \
    ( [ ! -d "${VOLUME_PATH}/deploy" ] || [ -z "$(ls -A ${VOLUME_PATH}/deploy)" ] ); then
    echo "The folder ${VOLUME_PATH}/deploy does not exist or is empty. Cloning repository ${APP_REPOSITORY_URL}..."
    git clone ${APP_REPOSITORY_URL} ${VOLUME_PATH}/deploy
	if [ -n "$USRID" ] && [ -n "$GRPID" ]; then
    	chown -R "$USRID:$GRPID" ${VOLUME_PATH}/deploy
	fi
fi

cd ${VOLUME_PATH}/deploy/backend
pip install --no-cache-dir -r requirements.txt --break-system-packages

# Run command based on environment
if [ "${TEST}" = true ]; then 
    echo "======= Running test command \"tail -f /dev/null\""
    tail -f /dev/null
else
    # Substitute environment variables in command
    COMMAND=$(echo "${COMMAND}" | sed "s/__SERVER_ADDRESS__/${SERVER_ADDRESS}/g; s/__SERVER_PORT__/${SERVER_PORT}/g")
    echo "======= Running command \"${COMMAND}\""
    eval "${COMMAND}"
fi
