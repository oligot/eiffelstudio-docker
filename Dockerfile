FROM oligot/eiffel

RUN apt-get install -y libxtst-dev libgtk2.0-dev

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/eiffel && \
    echo "eiffel:x:${uid}:${gid}:eiffel,,,:/home/eiffel:/bin/bash" >> /etc/passwd && \
    echo "eiffel:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/eiffel

USER eiffel
ENV HOME /home/eiffel
CMD estudio
