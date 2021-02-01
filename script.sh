#!/bin/bash
kubectl get nodes -o wide | grep worker | awk '{print $1}'|head -n 1 > node1
kubectl get nodes -o wide | grep worker | awk '{print $1}'|head -n 1 > node2
kubectl get nodes -o wide | grep worker | awk '{print $2}'|tail -n 1 > node3
n1=$(cat node2)
n2=$(cat node3)
ssh ubuntu@$n1 "sudo systemctl stop docker" 
ssh ubuntu@$n2 "sudo systemctl stop kubelet" 

