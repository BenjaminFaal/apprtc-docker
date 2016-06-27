sed -i 's/SHARED_KEY_REPLACE/'"$SHARED_KEY"'/g' apprtc/src/app_engine/apprtc.py
sed -i 's/TURN_IP_REPLACE/'"$TURN_IP"'/g' apprtc/src/app_engine/apprtc.py
sed -i 's/TURN_PORT_REPLACE/'"$TURN_PORT"'/g' apprtc/src/app_engine/apprtc.py

npm install -g npm
npm install -g grunt-cli

npm install
grunt build

exec "$@"