class apt {
	exec { "apt-update" :
		path => "/bin:/usr/bin",
		command => "apt-get update",
	}
}

define repo($url) {
	exec { "apt-add-repo-${name}":
		path => "/bin:/usr/bin",
		command => "/bin/echo 'deb ${url} oldstable all' >> /etc/apt/sources.list && /bin/echo 'deb-src ${url} oldstable all' >> /etc/apt/sources.list",
		unless => "grep '$url' /etc/apt/sources.list",
		notify => Exec["apt-update"],
	}
}
