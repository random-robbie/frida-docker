FROM node:slim
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y bash git nano gcc-multilib lib32stdc++-4.9-dev zlib1g-de$
RUN pip3 install colorama prompt-toolkit pygments
RUN pip3 install --user frida
RUN npm install frida
ENTRYPOINT ["bash"]
