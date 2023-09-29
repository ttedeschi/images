FROM python:3.9.12 AS BASE

#RUN curl repo.data.kit.edu/repo-data-kit-edu-key.gpg \
#        | gpg --dearmor \
#        > /etc/apt/trusted.gpg.d/kitrepo-archive.gpg

#RUN echo "deb https://repo.data.kit.edu/ubuntu/20.04 ./" >> /etc/apt/sources.list

#RUN apt update && apt install -y oidc-agent 

WORKDIR /usr/src/app
COPY . .

RUN pip install .

CMD [ "./bin/entrypoint.sh",  "iam-scim-map" ]
