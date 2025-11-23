# Cleanup Pods CronJob

This is a maintenance task, which is executed every day to keep a healthy cluster. It is on charge to delete all pods in `Evicted`, `Failed` or `Succeeded` status.

```bash
# Deploy rbac and cronjob
kubectl apply -f rbac.yaml
kubectl apply -f cleanup-pods-cron.yaml
```

To test it, you can launch a manual job, as follows.

```bash
kubectl create job --from=cronjobs/cleanup-pods cleanup-pods
kubectl get pods
# cleanup-pods-57b74           1/1     Running   0          4s
```

Inspect the logs.

```bash
kubectl logs cleanup-pods-57b74 -f
# pod "pod-7d6f8b76bc-6tdmk" deleted
# pod "pod-7d6f8b76bc-kpsmw" deleted
# pod "pod-7d6f8b76bc-ms6zx" deleted
```
