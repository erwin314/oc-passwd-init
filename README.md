# oc-passwd-init

1. Make sure there is a volume that can hold the custom passwd file for the container. This volume is only needed by the pod and only while running, so a simple "emptyDir" volume can be used.
```
      volumes:
        - name: shared-volume
          emptyDir: {}
```

2. Add an init container to the deployment yaml. This init container will create the passwd file in /work/passwd. 

```  
    initContainers:
      - name: init-passwd
        image: nlxsoftware/init-passwd
        volumeMounts:
        - name: passwd-volume
          mountPath: /work
```

3. Make sure the passwd file in the actual container is mounted from the special volume and overrides the original passwd file.
```
 volumeMounts:
        - name: passwd-volume
          mountPath: /etc/passwd
          subPath: passwd
```