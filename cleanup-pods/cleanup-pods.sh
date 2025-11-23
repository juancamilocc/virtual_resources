#!/bin/bash
now=$(date +%s)

# Search for failed, evicted, or completed pods older than 5 minutes
kubectl get pods -A -o json | jq -r --argjson now "$now" '
  .items[]
  | select(
      .status.phase == "Failed" or
      .status.reason == "Evicted" or
      (
        .status.phase == "Succeeded" and
        (($now - ((.metadata.creationTimestamp | fromdateiso8601) | tonumber)) > 300)
      )
    )
  | "\(.metadata.namespace) \(.metadata.name)"
' | while read -r namespace name; do
    kubectl -n "$namespace" delete pod "$name"
  done