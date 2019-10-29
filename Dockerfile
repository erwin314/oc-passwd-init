FROM busybox
COPY oc-passwd-init.sh /bin/oc-passwd-init.sh
CMD ["oc-passwd-init.sh"]
