FROM leplusorg/latex

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt install -y texlive-fonts-extra \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /var/log/* /var/cache/ldconfig/aux-cache

USER "${USER_NAME}"

ENV NAME=basm

WORKDIR /files

ENTRYPOINT [ "pdflatex", "$NAME.tex" ]