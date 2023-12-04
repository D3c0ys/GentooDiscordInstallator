if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
fi
tmpdir=/tmp/discordtmp;
mkdir -p "$tmpdir"; 
echo "created directory"
curl -L https://discord.com/api/download/stable\?platform\=linux\&format\=deb -o ${tmpdir}/discord.deb;
echo "Downloading discord.deb ..."
ar x ${tmpdir}/discord.deb --output ${tmpdir}; 
echo "extacted discord.deb"
tar xvf ${tmpdir}/data.tar.gz -C ${tmpdir}; 
echo "extacted data.tar.gz"
sudo cp ${tmpdir}/usr/bin/discord /usr/bin/;
echo "copied ${tmpdir}/usr/bin/discord to /usr/bin/"
sudo cp -r ${tmpdir}/usr/share/* /usr/share/
echo "copied ${tmpdir}/usr/share to /usr/share/"

echo "Discord Install Successfully"

while true ;do
	read -p "Do you want to clear tmp files?(${tmpdir}[y/n]: " yn
	case $yn in
		[Yy]* ) rm -rf /tmp/discordtmp;;
		[Nn]* ) exit;;
		* ) echo "Please select [y/n]: ";;
	esac
done
