#!/bin/bash
echo -n $CLUSTER_SECRET > /tmp/secret; chmod 600 /tmp/secret; condor_metrics
