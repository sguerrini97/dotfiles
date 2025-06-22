### Install container

Copy/link the relavant files in `~/.config/containers/systemd/`

Refresh systemd daemon

```bash
systemctl --user daemon-reload
```

Start the container

```bash
systemctl --user start <name>.service
```

Enable automatic updates (if necessary):

```bash
systemctl enable --user --now podman-auto-update.timer
```
