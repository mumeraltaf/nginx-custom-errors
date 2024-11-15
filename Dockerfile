FROM registry.k8s.io/ingress-nginx/nginx-errors:v20230404-helm-chart-4.6.0-11-gc76179c04
COPY ./rootfs/ /