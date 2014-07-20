#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "simple_iptables"

simple_iptables_rule 'default' do
	rule [
		'-s 192.168.62.0/24',
		'-m state --state ESTABLISHED,RELATED',
		'-p icmp',
		'-i lo'
	]
	jump 'ACCEPT'
end

