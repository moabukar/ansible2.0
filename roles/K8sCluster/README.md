# Kubernetes Cluster Build

This repository makes use of the Ansible code from https://github.com/kubernetes-sigs/kubespray.

- This was originally tested with the 370a0635fae8b4904bb6bf7936884195d1ab327f (v2.12.0)
- Run the following to ensure you are using the correct version of kubespray;
  - ```git clone https://github.com/kubernetes-sigs/kubespray```
  - ```git checkout v2.12.0```

The Kubespray code requires you to have your systems already built, so this code will create your requested number of VMs to launch and then create the hosts file for kubespray to run.

Best created in AWS using AMI Amazon Linux 2 AMI (HVM), SSD Volume Type.

## Pre-requisites

* Ansible version 2.9.1
* Python 3.7.5 (optional)

This code takes into account the use of Python Virtual Environments to run the correct version of Python.

```
$ python -m venv ~/ansible
$ source ~/ansible/bin/activate
```


If you're using Python venv then you should ensure you have installed the dependencies;

```
pip install -r requirements.txt
```

# Checking out a specific version

Find out the version tags;

```
$ git fetch --all --tags
$ git tag -l
```

Checkout the version to use before running;

```
$ git checkout tags/k8sv2.1 -b k8sv2.1
```

Replacing v2.0 with the version you wish to use.

# Running the build

This module allows you to supply your own ansible environment, which can be a completely separate directory in your own GIT repository.  Set the **ANSIBLEENV** environment variable on your operating system to the location of your own environment.  To create the correct environment for your own revision make sure you copy the **environments/prod** directory and then make your changes.

You **must** change variables in the **environments/prod/group_vars/all** to set your region, VPCs, etc and your SSH public key in AWS environment.

The private key is supplied as an argument to the **create**, **runbook** or **destroyme** commands.

The commands;
* create
  - This will create the Kubernetes cluster in its entirety, which includes
    - Controller (also an ansible provisioner for the cluster)
    - Master (the Kubernetes master)
    - 2 x Workers
  - It requires your AWS_DEFAULT_PROFILE, ANSIBLEENV environment variables to be set as well as an SSH private key filename (with path)
  - You can also tell it to SKIP the ec2 server build if your inventory is already populated, so that it will build the cluster and ELB
* destroyme
  - Will delete the entire cluster and all associated elements, including DNS records
* runbook
  - Allows you to run specific ansible playbooks such as deletelb.yml or createlb.yml

### Running in normal mode

```./create ~/your/ssh/private/key```

### Running in Debug mode

```./create DEBUG ~/your/ssh/private/key```

### Skip the ec2 instance build

```./create SKIP ~/your/ssh/private/key```
