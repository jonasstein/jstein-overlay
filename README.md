mkdir /usr/local/overlays/


cat << EOF > /etc/portage/repos.conf/jstein-overlay.conf
[DEFAULT]
main-repo = gentoo

[jstein-overlay]
priority = 60
location = /usr/local/overlays/jstein-overlay
sync-type = git
sync-uri = https://github.com/jonasstein/jstein-overlay
auto-sync = no
sync-depth = 0
EOF


