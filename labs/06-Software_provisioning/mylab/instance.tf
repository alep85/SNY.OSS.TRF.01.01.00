// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_instance" "default" {
// Install software using remote-exec provisioner
 provisioner "remote-exec" {
   inline = [
      "sudo apt-get -y install tcpdump"
   ]

   connection {
    type     = "ssh"
    host     = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    user     = "${var.VM_USERNAME}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }
 }

 // Execute a script remotely using remote-exec provisioner
 provisioner "remote-exec" {
   inline = [
     "chmod a+x /tmp/my_script.sh",
      "/tmp/my_script.sh"
   ]

   connection {
    type     = "ssh"
    host     = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    user     = "${var.VM_USERNAME}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }
 }

 // Create the Ansible inventory locally using the local-exec provisioner 
 provisioner "local-exec" {
    command = "echo '[all]' > inventory.txt && echo ${google_compute_instance.default.network_interface.0.access_config.0.nat_ip} >> inventory.txt"
 }

 // Provision using Ansible with local-exec provisioner
 provisioner "local-exec" {
    command = "sleep 40; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ${var.VM_USERNAME} --private-key ~/.ssh/id_rsa -i inventory.txt ../playbooks/ansible-playbook.yml" 
 }

}
