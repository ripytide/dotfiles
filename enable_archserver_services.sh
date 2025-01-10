#! /bin/env sh

systemctl enable --now logitechmediaserver-git
systemctl enable --now frpc
systemctl enable --now caddy
systemctl enable --now mosquitto
systemctl enable --now zigbee2mqtt

systemctl enable --now docker
systemctl enable --now sshd
