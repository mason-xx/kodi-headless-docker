#!/bin/bash
if [ -d "/opt/kodi-headless/userdata" ]; then
echo "using existing datafiles"
# chown -R mason:users /opt/kodi-server
else
echo "creating datafiles"
mkdir -p /opt/kodi-headless/userdata
sleep 15
# chown -R mason:users /opt/kodi-server
fi
if [ -f "/opt/kodi-headless/userdata/advancedsettings.xml" ]; then
echo "using existing advancedsettings.xml"
# chown -R mason:users /opt/kodi-server
sed -i "s|\(<host>\)[^<>]*\(</host>\)|\1${MYSQLip}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
sed -i "s|\(<port>\)[^<>]*\(</port>\)|\1${MYSQLport}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
sed -i "s|\(<user>\)[^<>]*\(</user>\)|\1${MYSQLuser}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
sed -i "s|\(<pass>\)[^<>]*\(</pass>\)|\1${MYSQLpass}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
else
echo "creating advancedsettings.xml"
cp /root/advancedsettings.xml /opt/kodi-headless/userdata/advancedsettings.xml
# chown -R nobody:users /opt/kodi-server
sed -i "s|\(<host>\)[^<>]*\(</host>\)|\1${MYSQLip}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
sed -i "s|\(<port>\)[^<>]*\(</port>\)|\1${MYSQLport}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
sed -i "s|\(<user>\)[^<>]*\(</user>\)|\1${MYSQLuser}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
sed -i "s|\(<pass>\)[^<>]*\(</pass>\)|\1${MYSQLpass}\2|" /opt/kodi-headless/userdata/advancedsettings.xml
fi
