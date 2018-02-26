# docker-vsftpd-alpine
vsftpd Docker image build script based on Alpine

Supports passive mode and virtual users.

## vsftpd.conf

`/etc/vsftpd/vsftpd.conf`

## How to run

Use `docker-compose`

**Modify `docker-compose.yml` to fit you need.**
**For example, modify passive address to your host ip.**

```
git clone https://github.com/changchang9419/docker-vsftpd-alpine.git
cd docker-vsftpd-alpine
docker-compose up -d
```

## Something to do
`docker exec -it <Container ID> sh`

**Set `admin` password**

Replace `AdminPWD` to what you favor.

```
set-admin-password AdminPWD
```

**Add Virtual FTP User**

Replace `myuser` and `mypass` to what you want.

User's root path, upload and write permission in file */etc/vsftpd/vsftpd_user_conf/`<username>`*, you can change them for security reason.

```
add-ftp-user -u myuser -p mypass
```

**quit to Host**

`exit`
