FROM node:slim
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y bash git nano gcc-multilib lib32stdc++-4.9-dev zlib1g-dev lib32z1-dev python3 python3-dev python3-pip git autotools-dev automake
RUN pip3 install colorama prompt-toolkit pygments
RUN pip3 install frida
RUN npm install frida
ADD frida-android-repinning_sa-1.js /root/frida-android-repinning_sa-1.js
ADD burpca-cert-der.crt /root/burpca-cert-der.crt
WORKDIR /root/
ENTRYPOINT ["bash"]
