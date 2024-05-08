#!/bin/bash
BUCKET=velero
REGION=minio

/usr/bin/velero install \
    --kubeconfig /root/.kube/config \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.9.2 \
    --bucket ${BUCKET} \
    --use-volume-snapshots=true \
    --uploader-type=restic \
    --use-node-agent \
    --image=velero/velero:v1.13.2 \
    --backup-location-config region=$REGION,s3ForcePathStyle="true",s3Url=https://console.github.icu \
    --snapshot-location-config region=$REGION,s3ForcePathStyle="true",s3Url=https://console.github.icu \
    --secret-file /opt/velero/cfg/credentials-velero
