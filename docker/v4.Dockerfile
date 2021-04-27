FROM node:lts-alpine
ARG REPO=github
ARG REPO_URL=$REPO.com
ARG JD_SHELL=jd_shell
ARG JD_SHELL_BRANCH=master
ARG JD_SHELL_HOST=$REPO_URL
#ARG JD_SHELL_KEY="NEED_REPLACE"
ARG JD_SCRIPTS=jd_scripts
ARG JD_SCRIPTS_BRANCH=master
ARG JD_SCRIPTS_HOST=jd_scripts_$REPO
ARG JD_SCRIPTS_KEY="-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn\nNhAAAAAwEAAQAAAQEAvRQk2oQqLB01iVnJKrnI3tTfJyEHzc2ULVor4vBrKKWOum4dbTeT\ndNWL5aS+CJso7scJT3BRq5fYVZcz5ra0MLMdQyFL1DdwurmzkhPYbwcNrJrB8abEPJ8ltS\nMoa0X9ecmSepaQFedZOZ2YeT/6AAXY+cc6xcwyuRVQ2ZJ3YIMBrRuVkF6nYwLyBLFegzhu\nJJeU5o53kfpbTCirwK0h9ZsYwbNbXYbWuJHmtl5tEBf2Hz+5eCkigXRq8EhRZlSnXfhPr2\n32VCb1A/gav2/YEaMPSibuBCzqVMVruP5D625XkxMdBdLqLBGWt7bCas7/zH2bf+q3zac4\nLcIFhkC6XwAAA9BjE3IGYxNyBgAAAAdzc2gtcnNhAAABAQC9FCTahCosHTWJWckqucje1N\n8nIQfNzZQtWivi8GsopY66bh1tN5N01YvlpL4ImyjuxwlPcFGrl9hVlzPmtrQwsx1DIUvU\nN3C6ubOSE9hvBw2smsHxpsQ8nyW1IyhrRf15yZJ6lpAV51k5nZh5P/oABdj5xzrFzDK5FV\nDZkndggwGtG5WQXqdjAvIEsV6DOG4kl5TmjneR+ltMKKvArSH1mxjBs1tdhta4kea2Xm0Q\nF/YfP7l4KSKBdGrwSFFmVKdd+E+vbfZUJvUD+Bq/b9gRow9KJu4ELOpUxWu4/kPrbleTEx\n0F0uosEZa3tsJqzv/MfZt/6rfNpzgtwgWGQLpfAAAAAwEAAQAAAQEAnMKZt22CBWcGHuUI\nytqTNmPoy2kwLim2I0+yOQm43k88oUZwMT+1ilUOEoveXgY+DpGIH4twusI+wt+EUVDC3e\nlyZlixpLV+SeFyhrbbZ1nCtYrtJutroRMVUTNf7GhvucwsHGS9+tr+96y4YDZxkBlJBfVu\nvdUJbLfGe0xamvE114QaZdbmKmtkHaMQJOUC6EFJI4JmSNLJTxNAXKIi3TUrS7HnsO3Xfv\nhDHElzSEewIC1smwLahS6zi2uwP1ih4fGpJJbU6FF/jMvHf/yByHDtdcuacuTcU798qT0q\nAaYlgMd9zrLC1OHMgSDcoz9/NQTi2AXGAdo4N+mnxPTHcQAAAIB5XCz1vYVwJ8bKqBelf1\nw7OlN0QDM4AUdHdzTB/mVrpMmAnCKV20fyA441NzQZe/52fMASUgNT1dQbIWCtDU2v1cP6\ncG8uyhJOK+AaFeDJ6NIk//d7o73HNxR+gCCGacleuZSEU6075Or2HVGHWweRYF9hbmDzZb\nCLw6NsYaP2uAAAAIEA3t1BpGHHek4rXNjl6d2pI9Pyp/PCYM43344J+f6Ndg3kX+y03Mgu\n06o33etzyNuDTslyZzcYUQqPMBuycsEb+o5CZPtNh+1klAVE3aDeHZE5N5HrJW3fkD4EZw\nmOUWnRj1RT2TsLwixB21EHVm7fh8Kys1d2ULw54LVmtv4+O3cAAACBANkw7XZaZ/xObHC9\n1PlT6vyWg9qHAmnjixDhqmXnS5Iu8TaKXhbXZFg8gvLgduGxH/sGwSEB5D6sImyY+DW/OF\nbmIVC4hwDUbCsTMsmTTTgyESwmuQ++JCh6f2Ams1vDKbi+nOVyqRvCrAHtlpaqSfv8hkjK\npBBqa/rO5yyYmeJZAAAAFHJvb3RAbmFzLmV2aW5lLnByZXNzAQIDBAUG\n-----END OPENSSH PRIVATE KEY-----"
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
