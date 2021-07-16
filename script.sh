#!/bin/bash
 
read -p "Enter the worker1 username : " w1
 
read -p "Enter the worker2 username : " w2
 

kubectl get nodes | grep -v master | grep -v NAME | head -n 1 | awk '{print $1}' > node1
 
kubectl get nodes | grep -v master | tail -n 1 | awk '{print $1}' > node2
 

n1=$(cat node1)
 
n2=$(cat node2)
 

ssh $w1@$n1 "sudo systemctl stop docker"
 
ssh $w2@$n2 "sudo systemctl stop kubelet"
