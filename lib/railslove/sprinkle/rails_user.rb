package :rails_user do
  description 'Creates a special User for all the Rails stuff'
  config do 

    # It's better to do that in a cap task?
    #path_to_ssh_key = enter("Path to your public SSH key:")
    #put "/tmp/ssh_key.pub.client", File.open(path_to_ssh_key).read

    run "groupadd -f rails"
    run "useradd -g rails -m rails;echo 0"
    run "echo 'rails\tALL=(ALL) ALL' | tee -a /etc/sudoers"
    run "mkdir /home/rails/.ssh; echo 0"
    run "chown -R rails:rails /home/rails/.ssh; echo 0"
    #run "cat /tmp/ssh_key.pub.client >> /home/rails/.ssh/authorized_keys"
    run "mkdir /var/www/rails_apps;echo 0"
    run "chown rails:rails -R /var/www/rails_apps;echo 0"
    run "cp /root/.gemrc /home/rails/.gemrc"
    run "chown rails:rails /home/rails/.gemrc;echo 0"
  end
  
end