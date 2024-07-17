## REQUIRED: freerdp, xquartz, sshpass (use brew on macOS!)

#!/bin/sh
TOKEN=INSERT_TOKEN_HERE
PWNBOX_URL=https://labs.hackthebox.com/api/v4/pwnbox/status

echo "Fetching instance details from Hack The Box..."
RESP=$(curl -s -X GET -H "Authorization: Bearer $TOKEN" $PWNBOX_URL)
USERNAME=$(echo $RESP | jq -r '.data.username')
PASSWORD=$(echo $RESP | jq -r '.data.vnc_password')
HOST=$(echo $RESP | jq -r '.data.hostname')

echo "Instance details:"
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "Host: $HOST"

# Create SSH session without output, only to establish the tunnel and port forward 3389.
sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no -v -N -f -L 3389:localhost:3389 $USERNAME@$HOST

# Give some time for the tunnel to establish
sleep 3

export DISPLAY=:0
open -a XQuartz
sleep 2

xfreerdp /v:localhost /u:$USERNAME /p:$PASSWORD /d:. /compression /network:lan /gdi:sw /bpp:16 /cache:bitmap:on,glyph:off,offscreen:off /rfx /gfx:avc420 /dynamic-resolution /window-drag /menu-anims /fonts /rfx /frame-ack:8 /grab-keyboard /grab-mouse /scale:100 /themes
