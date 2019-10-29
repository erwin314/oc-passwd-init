FROM busybox
COPY initpasswd.sh /bin/initpasswd.sh
CMD ["initpasswd.sh"]
