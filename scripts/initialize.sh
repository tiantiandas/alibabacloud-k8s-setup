#!/bin/bash
#

K8S_MAJOR_VERSION=${1:-1.29}

apt update

# Install
apt install -y --no-install-recommends apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v${K8S_MAJOR_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v${K8S_MAJOR_VERSION}/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

apt update
apt install -y  --no-install-recommends kubelet kubeadm kubectl

# Fix Kubernetes version
apt-mark hold kubectl kubelet kubeadm
systemctl enable kubelet
