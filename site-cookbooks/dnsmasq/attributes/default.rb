case platform
	when "centos"
		default['dnsmasq']['packages'] = [
			"dnsmasq"
		]
	when "debian", "ubuntu"
		default['dnsmasq']['packages'] = [
			"dnsmasq"
		]
end
