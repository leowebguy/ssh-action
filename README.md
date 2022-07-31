# Remote SSH Commands

Simple GitHub Action to run a command on a remote server using SSH.

## ✨ Example Usage

**Example using OpenSSH private key**

```yml
- name: ls -a via ssh
  uses: leowebguy/ssh-action@master
  with:
    command: |
      cd /tmp
      ls -a
    host: ${{ secrets.HOST }}
    user: root
    key: ${{ secrets.PRIVATE_KEY}}
```

🔐 Set your secrets here: `https://github.com/USERNAME/REPO/settings/secrets`.

## Options

- **command** - _string_ - Command to execute on the remote server.

- **host** - _string_ - Hostname or IP address of the server.

- **port** - _integer_ - Port number of the server. `default 22`

- **user** - _string_ - Username for authentication.

- **key** - _string_ - Private key for either key-based or hostbased user authentication (OpenSSH format).

- **args** - _string_ - SSH parameters for example: -tt.

```
Pseudo-terminal will not be allocated because stdin is not a terminal.
```

## Tips

If emitting "mesg: ttyname failed: Inappropriate ioctl for device", You need to modify your Linux files as follows

```
vim /root/.profile
// Modify the "mesg n || true"  to "tty -s && mesg n || true"
```
