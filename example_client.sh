## REQUIRED: freerdp, xquartz, sshpass

#!/bin/sh
TOKEN=INSERT TOKEN HERE

echo "Fetching instance details from Hack The Box..."
RESP=$(curl -s -X GET -H "Authorization: Bearer $TOKEN" $PWNBOX_URL)
USERNAME=$(echo $RESP | jq -r '.data.username')
PASSWORD=$(echo $RESP | jq -r '.data.vnc_password')
HOST=$(echo $RESP | jq -r '.data.hostname')

echo "Instance details:"
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "Host: $HOST"

sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -v -N -f -L 3389:localhost:3389 $USERNAME@$HOST

# Give some time for the tunnel to establish
sleep 3

# Check if the tunnel is established
echo "Checking if local port 3389 is listening..."
netstat -an | grep 3389

export DISPLAY=:0
sleep 1
open -a XQuartz
sleep 2

xfreerdp /v:localhost /u:$USERNAME /p:$PASSWORD /d:. /rfx /gfx:RFX:on,AVC420:on,small-cache:off,thin-client:off /gdi:sw
