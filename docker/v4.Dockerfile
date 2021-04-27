FROM node:lts-alpine
ARG REPO=gihub
ARG REPO_URL=$REPO.com
ARG JD_SHELL=jd_shell
ARG JD_SHELL_BRANCH=master
ARG JD_SHELL_HOST=$REPO_URL
#ARG JD_SHELL_KEY="NEED_REPLACE"
ARG JD_SCRIPTS=jd_scripts
ARG JD_SCRIPTS_BRANCH=master
ARG JD_SCRIPTS_HOST=jd_scripts_$REPO
ARG JD_SCRIPTS_KEY=-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----""
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    JD_DIR=/jd \
    ENABLE_HANGUP=false \
    ENABLE_RESET_REPO_URL=true \
    JD_SHELL_URL=https://$JD_SHELL_HOST/gys619/$JD_SHELL \
    JD_SCRIPTS_URL=git@$JD_SCRIPTS_HOST:lxk0301/$JD_SCRIPTS.git
WORKDIR $JD_DIR
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f \
        bash \
        coreutils \
        git \
        wget \
        curl \
        nano \
        tzdata \
        perl \
        openssh-client \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /root/.ssh \
    ##&& echo $JD_SHELL_KEY | perl -pe "{s|_| |g; s|@|\n|g}" > /root/.ssh/$JD_SHELL \
    && echo $JD_SCRIPTS_KEY | perl -pe "{s|_| |g; s|@|\n|g}" > /root/.ssh/$JD_SCRIPTS \
    && chmod 600 /root/.ssh/$JD_SCRIPTS \
    && echo -e "Host $JD_SHELL_HOST\n\tHostname $REPO_URL\n\tIdentityFile=/root/.ssh/$JD_SHELL\n\nHost $JD_SCRIPTS_HOST\n\tHostname $REPO_URL\n\tIdentityFile=/root/.ssh/$JD_SCRIPTS" > /root/.ssh/config \
    && echo -e "\n\nHost *\n  StrictHostKeyChecking no\n" >> /etc/ssh/ssh_config \
    && chmod 644 /root/.ssh/config \
    && ssh-keyscan $REPO_URL > /root/.ssh/known_hosts \
    && git clone -b $JD_SHELL_BRANCH $JD_SHELL_URL $JD_DIR \
    && npm install -g pm2 \
    && ln -sf $JD_DIR/jtask.sh /usr/local/bin/jtask \
    && ln -sf $JD_DIR/jtask.sh /usr/local/bin/otask \
    && ln -sf $JD_DIR/jtask.sh /usr/local/bin/mtask \
    && ln -sf $JD_DIR/jup.sh /usr/local/bin/jup \
    && ln -sf $JD_DIR/jlog.sh /usr/local/bin/jlog \
    && ln -sf $JD_DIR/jcode.sh /usr/local/bin/jcode \
    && ln -sf $JD_DIR/jcsv.sh /usr/local/bin/jcsv \
    && cp -f $JD_DIR/docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 $JD_DIR/*.sh \
    && rm -rf /root/.npm
ENTRYPOINT ["docker-entrypoint.sh"]
