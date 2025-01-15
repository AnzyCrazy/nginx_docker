FROM nginx:1.27.3-alpine3.20
RUN apk add --no-cache nginx-module-image-filter

#RUN rm /etc/nginx/conf.d/default.conf

RUN sed -i '7a\load_module /etc/nginx/modules/ngx_http_image_filter_module.so;' /etc/nginx/nginx.conf


COPY ./nginx_files/nginxserver.ddnsfree.com/ /var/www/nginxserver.ddnsfree.com/
COPY ./nginx_files/conf/ /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
