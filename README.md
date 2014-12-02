# The simplest Vagrant Docker Node.js server example ever

This is the simplest example on the internet of a Docker container running a 
Node.js web server inside a Vagrant VM on Mac OS X. I searched and searched
and couldn't find anything simpler (not that you can't make something 
slightly simpler). 

I stole the Node.js server from the front page of nodejs.com, and pieced the 
Vagrantfiles and Dockerfile together from various examples I found that 
didn't quite suit my needs.

My example uses only a base image of Ubuntu 12.04, and then manually installs
everything else on top of that. The example uses a Dockerfile rather than an
image. The goal is to demonstrate a barebones Node.js web server with all the
inner-workings laid out.

# Usage

Make sure you have Vagrant and Docker installed. Then, start everything with:

```bash
vagrant up --provider="docker"
```

You can check that your server is running with:

```bash
curl http://localhost:8888
```

# Explanation

### Vagrantfile.proxy
Vagrant runs the Docker server inside a VM because it needs to run on 
Linux kernel. We reference this file from Vagrantfile to ensure that 
Docker is using Vagrant's VM (VirtualBox) as opposed to boot2docker, 
which kind of sucks when you're dealing with ports. I use ubuntu 12.04 
for this.

### Vagrantfile
This is the main Vagrantfile, which runs the Docker container. Notice
that we tell the provider (Docker) to run its server inside the VM 
specified by Vagrantfile.proxy.

### Dockerfile
This is where the Docker magic happens. There's not much going on here--
Ubuntu updates its repos, installs Node.js, creates a public www directory,
moves out Node.js app to it, then runs it.

### app.js
This is the super simple Node.js server. It responds to everything with 
'Hello World'. No ip is specified, so it defaults to '0.0.0.0'. This is
what we want. '127.0.0.1' does not work because of some internal bullshit.

