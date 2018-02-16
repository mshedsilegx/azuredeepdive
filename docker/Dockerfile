FROM oraclelinux:7
MAINTAINER MSH Azure Deepdive <azure.deepdive@mckesson.com>

RUN echo "----- [C1]- Upgrading all OS packages from xgforge repository -----"
COPY xgforge-local.repo /etc/yum.repos.d/
RUN yum update -y && rm -f /var/lib/rpm/__db.00?

RUN echo "----- [C2]- Installing nginx, PHP, memcached custom binaries -----"
RUN yum --enablerepo=ol7_optional_latest install -y nginx memcached
RUN yum install -y php-cli php-fpm php-gd php-imap php-intl php-json php-ldap php-mbstring \
      php-mcrypt php-mysqlnd php-opcache php-pdo php-process php-soap php-xml \
      php-pecl-apcu php-pecl-memcache php-pecl-zip php-pear

RUN echo "----- [C3]- Verifying stack versions and archiving defaults -----"
RUN nginx -v && php -v && memcached --version && \
    mkdir -p /etc/nginx/conf.d/archive /opt/{webapps/public,scripts} && \
    mv /etc/nginx/conf.d/*.conf /etc/nginx/conf.d/archive/

RUN echo "----- [C4]- Copying configuration files to container -----"
COPY .docker/nginx.conf /etc/nginx/
COPY .docker/webapps.conf /etc/nginx/conf.d/
COPY .docker/php-fpm.conf /etc/
COPY .docker/www.conf /etc/php-fpm.d/
COPY .docker/php.ini /etc/
COPY .docker/init.sh /opt/scripts/
COPY opt/webapps/public/ /opt/webapps/public/

RUN echo "----- [C5]- Adjusting File permissions and package cleanups -----"
RUN useradd -M -u 1000 -d /opt/webapps -s /bin/false -g nginx nginx && \
    groupadd -g 2000 apps && useradd -u 2000 -d /home/webadm -s /bin/nologin -g apps webadm && \
    mkdir -p /var/run/nginx && chown -R webadm:apps /opt/webapps && \
    chown -R nginx:nginx /var/lib/{nginx,php} /var/log/{nginx,php-fpm} /var/run/{nginx,php-fpm} && \
    mkdir -p /var/cache/weblogs && pushd /var/cache/weblogs && \
    ln -sf /var/log/nginx && ln -sf /var/log/php-fpm && popd && \
    yum clean all && rm -rf /var/cache/yum/x86_64/

RUN echo "----- [C6]- Executing init script to start stack with container bootup -----"
CMD /opt/scripts/init.sh
