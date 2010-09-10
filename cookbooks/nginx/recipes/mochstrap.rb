require_recipe "nginx"

template "/etc/nginx/sites-available/mochstrap" do
  source "mochstrap.erb"
end

link "/etc/nginx/sites-enabled/default" do
  action :delete
end

link "/etc/nginx/sites-enabled/mochstrap"  do
  to"/etc/nginx/sites-available/mochstrap"
  notifies :restart, resources(:service => "nginx")
end

