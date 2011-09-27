RESULT=`which git`
if [ $? -eq 0 ]
then
	echo "Git already installed"
	exit 0
else
	wget -O /var/tmp/git.deb http://packages.debian.org/stable/devel/git
	dpkg -i /var/tmp/git.deb
	echo "Git installed"
	exit 0
fi
