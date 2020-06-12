FROM python:3.8 
 
ARG WORKSPACE=/root 

RUN apt-get update 
RUN apt-get install software-properties-common -y
RUN apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 8CF63AD3F06FC659

RUN add-apt-repository ppa:jonathonf/vim
RUN apt install vim -y


RUN git config --global user.name "John Doe"
RUN git config --global user.email johndoe@example.com

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install nodejs -y

RUN apt-get install wget
RUN ["apt-get", "install", "-y", "zsh"]
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN pip install annoy
RUN pip install streamlit
 
WORKDIR $WORKSPACE

COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

CMD ["zsh"]
