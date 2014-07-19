#
# Cookbook Name:: dnsmasq
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['dnsmasq']['packages'].each{|value|
	package value do
		action :install
	end
}

cookbook_file "/etc/hosts" do
	owner "root"
	group "root"
	mode "0644"
	source "hosts"
end

cookbook_file "/etc/dnsmasq.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "dnsmasq.conf"
end
