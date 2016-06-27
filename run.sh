sed -i 's/SHARED_KEY_REPLACE/'"$SHARED_KEY"'/g' apprtc/out/app_engine/apprtc.py
sed -i 's/TURN_IP_REPLACE/'"$TURN_IP"'/g' apprtc/out/app_engine/apprtc.py
sed -i 's/TURN_PORT_REPLACE/'"$TURN_PORT"'/g' apprtc/out/app_engine/apprtc.py
dev_appserver.py ./apprtc/out/app_engine --skip_sdk_update_check --host=0.0.0.0
