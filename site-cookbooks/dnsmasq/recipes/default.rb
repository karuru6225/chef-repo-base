#
# Cookbook Name:: dnsmasq
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "simple_iptables"

node['dnsmasq']['packages'].each{|value|
	package value do
		action :install
	end
}

service "dnsmasq" do
	service_name "dnsmasq"
	action [:enable]
end

cookbook_file "/etc/hosts" do
	owner "root"
	group "root"
	mode "0644"
	source "hosts"
	notifies :restart, "service[dnsmasq]", :delayed
end

cookbook_file "/etc/dnsmasq.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "dnsmasq.conf"
	notifies :restart, "service[dnsmasq]", :delayed
end

cookbook_file "/etc/resolv.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "resolv.conf"
	notifies :restart, "service[dnsmasq]", :delayed
end

simple_iptables_rule 'dnsmasq' do
	rule '-p udp --dport 67'
	jump 'ACCEPT'
end

