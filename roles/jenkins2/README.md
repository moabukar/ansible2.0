# Using jenkins2 playbook

To use this playbook you will need to do the following commands to get the entire playbook;

```
git clone https://github.com/stevshil/ansible/tree/master/jenkins2
cd jenkins2/roles
git submodule add https://github.com/geerlingguy/ansible-role-jenkins
git submodule add https://octolinker-demo.now.sh/geerlingguy/ansible-role-java
```

Alternatively install the modules with **ansible galaxy**

Some notes on the Jenkins Job Builder Python module;
* https://readthedocs.org/projects/jenkins-job-builder/downloads/pdf/stable/
