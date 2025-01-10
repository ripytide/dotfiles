#! /bin/env sh

systemctl enable --now logitechmediaserver-git
systemctl enable --now frpc
systemctl enable --now caddy
systemctl enable --now mosquitto
systemctl enable --now zigbee2mqtt
systemctl enable --now smb
systemctl enable --now wsdd

systemctl enable --now docker
systemctl enable --now avahi-daemon
systemctl enable --now sshd
