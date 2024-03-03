FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY dist/spa /usr/share/nginx/html
# TODO/FIXME: We should use a multistage build in a node container so we don't have to build locally
