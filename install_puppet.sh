RESULT=`which puppet`
if [ $? -eq 0 ]
then
	echo "Puppet already installed"
	exit 0
else
	apt-get update
	RESULT=`which ruby`
	if [ $? -eq 1 ]
	then
		apt-get install irb libopenssl-ruby libreadline-ruby rdoc ri ruby ruby-dev
	fi

	RESULT=`which gem`
	if [ $? -eq 1 ]
	then
		cd /usr/local/src
		wget http://production.cf.rubygems.org/rubygems/rubygems-1.5.2.tgz
		tar -xzf rubygems-1.5.2.tgz
		cd rubygems-1.5.2
		ruby setup.rb
		update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.8 1
		gem update --system
	fi 

	gem install puppet
	exit 0
fi
