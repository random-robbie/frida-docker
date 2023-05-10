FROM node:19.9.0-slim

MAINTAINER random_robbie <txt3rob@gmail.com>
WORKDIR /root

#Set Env
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV ANDROID_HOME=/opt
ENV PATH=$ANDROID_HOME/platform-tools:$PATH

#Update OS
RUN apt-get update
RUN apt-get upgrade -y

#Install Frida
RUN apt-get install -y unzip bash git nano gcc-multilib libstdc++6 zlib1g-dev lib32z1-dev python3 python3-dev python3-pip git autotools-dev automake apt-utils curl
#Install Frida CLI tools
RUN pip install frida-tools

RUN pip3 install colorama prompt-toolkit pygments
#Install Frida bindings
RUN pip3 install frida
RUN npm install -g frida

#Install Adb 
RUN mkdir -pm 0750 ~/.android $ANDROID_HOME 
RUN curl -fsSL https://dl.google.com/android/repository/platform-tools-latest-linux.zip -o /tmp/adb.zip
RUN unzip /tmp/adb.zip -d $ANDROID_HOME 
        
# Add Files        
ADD frida-android-repinning_sa-1.js /root/frida-android-repinning_sa-1.js
ADD burpca-cert-der.crt /root/burpca-cert-der.crt

ENTRYPOINT ["bash"]
