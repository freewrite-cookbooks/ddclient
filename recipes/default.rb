%w[libio-socket-ssl-perl ddclient].each do |pkg|
  package pkg
end

template '/etc/ddclient.conf' do
  group 'root'
  mode '0600'
  notifies :restart, 'service[ddclient]'
  owner 'root'
end

service 'ddclient' do
  supports :status => true, :restart => true
end
