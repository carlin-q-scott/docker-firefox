This docker image runs Firefox through a socket connection to an x11 environment running on your machine. Xming and VcXsrv are two such services but there may be others. The graphical performance isn't great and audio and video website tabs tend to crash, but it works perfectly fine for reading articles or checking your bank statement.

# Setup Instructions
1. Install [Xming](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjT2q2u_ZreAhX8FzQIHRqiAO8QFjAAegQIARAB&url=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fxming%2F&usg=AOvVaw2r18vOyEGzisW0WiHH4ksg) or [VcXsrv](https://sourceforge.net/projects/vcxsrv/)  
   See [this SuperUser answer](https://superuser.com/a/1311934) if you need help deciding which one to use.
2. Determine your docker machine ip: `docker-machine ip`  
   Typically this is 192.168.99.1
3. Find your Xming/VcXsrv folder and open X0.hosts
   * VcXsrv: `C:\Program Files\VcXsrv\X0.hosts`
4. Add the ip of the docker machine on a new line.
5. Launch Xming/VcXsrv.

# Usage
Run this container, specifying the ip address for your docker-machine.
`docker run -it -e DISPLAY=192.168.99.1:0.0 carlin/firefox:latest`