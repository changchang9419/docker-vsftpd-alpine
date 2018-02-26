#!/bin/sh

PASSWORD=

usage()
{
	echo -e "\nUsage:"
	echo -e "\t`basename $0` -p admin-password\n"
	exit
}

while getopts "p:" arg
do
	case ${arg} in
	p) PASSWORD=${OPTARG}
		;;
	:) usage
		;;
	?) usage
		;;
	esac
done

if [ "${PASSWORD}" == "" ]; then
	usage
fi

echo "admin:$(openssl passwd -1 ${PASSWORD})" >> /etc/vsftpd/virtual_users
echo "anon_world_readable_only=NO" > /etc/vsftpd/vsftpd_user_conf/admin
echo "write_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/admin
echo "anon_upload_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/admin
echo "anon_mkdir_write_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/admin
echo "anon_other_write_enable=YES" >> /etc/vsftpd/vsftpd_user_conf/admin
echo "local_root=/home/ftp/" >> /etc/vsftpd/vsftpd_user_conf/admin

