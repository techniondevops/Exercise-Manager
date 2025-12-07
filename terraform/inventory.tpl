[masters]
k8s-master ansible_host=${master_ip} ansible_user=ubuntu private_ip=${master_private_ip}

[workers]
%{ for ip in worker_ips ~}
k8s-worker-${index(worker_ips, ip) + 1} ansible_host=${ip} ansible_user=ubuntu
%{ endfor ~}

[k8s:children]
masters
workers

[k8s:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
