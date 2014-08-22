server {
  listen      192.168.112.42:443  ssl spdy;
  server_name  local.iamcarrico.com;

  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";

  ssl_certificate     /etc/nginx/ssl/server.crt;
  ssl_certificate_key /etc/nginx/ssl/server.key;

  access_log  /var/log/nginx/iamcarrico.access.log;

  location / {
    root   /home/vagrant/public_html;
    index  index.html index.htm;
  }
}
