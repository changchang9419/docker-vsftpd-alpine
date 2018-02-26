#!/bin/sh

USERNAME=
PASSWORD=

usage()
{
	echo -e "\nUsage:"
	echo -e "\t`basename $0` -u username -p password\n"
	exit
}

while getopts "u:p:" arg
do
	case ${arg} in
	u) USERNAME=${OPTARG}
		;;
	p) PASSWORD=${OPTARG}
		;;
	:) usage
		;;
	?) usage
		;;
	esac
done

if [[ "${USERNAME}" == "" || "${PASSWORD}" == "" ]]; then
	usage
fi

mkdir -p /home/ftp/${USERNAME}
chown -R virtual:virtual /home/ftp/${USERNAME}
echo "${USERNAME}:$(openssl passwd -1 ${PASSWORD})" >> /etc/vsftpd/virtual_users
echo "anon_world_readable_only=NO" > /etc/vsftpd/vsftpd_user_conf/${USERNAME}
echo "write_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/${USERNAME}
echo "anon_upload_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/${USERNAME}
echo "anon_mkdir_write_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/${USERNAME}
echo "anon_other_write_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/${USERNAME}
echo "local_root=/home/ftp/${USERNAME}" >> /etc/vsftpd/vsftpd_user_conf/${USERNAME}

