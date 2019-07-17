FROM ubuntu:18.04
LABEL maintainer="diracdiego@gmail.com"
LABEL version="1.0"

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev

RUN pip3 install --upgrade pip

# Install python modules.
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Set alias for python3
RUN echo "alias python=python3" >> $HOME/.bashrc && \
    echo "alias pip=pip3" >> $HOME/.bashrc

WORKDIR /work

CMD ["/bin/bash"]
