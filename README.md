## Setup self-hosted Kubernetes cluster on AlibabaCloud

This series of WIKIs will show how to set up a self-hosted, HA Kubernetes cluster on AlibabaCloud step by step.

Firstly, when you created a number of ECSs for the mission, you should [Intiaialze it](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/1.-Initialize-the-ECS-for-the-mission). To get rid of doing it again and again, you can [create a custom image](https://www.alibabacloud.com/help/en/doc-detail/35109.htm) for future use.

Hold a bunch of ECSs, we can [set up a rustic cluster](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/2.-Setup-a-rusty-Kubernetes-cluster) now. It is not even. For a more reliable and operation-friendly goal, we need to integrate the Kubernetes cluster to AlibabaCloud.

To manage resources on the AlibabaCloud, we need to [create a granted RAM user](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/3.-Create-RAM-user) and then [deploy it onto the cluster](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/4.-Deploy-the-credential--onto-the-cluster) so that it could be found.

For data persistence, we need to [deploy AlibabaCloud CSI(Container Storage Interface) plugins](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/5.-Deploy-AlibabaCloud-CSI), which works between the Kubernetes cluster and AlibabaCloud, managing storage resources(e.g., EBS, NAS...). CSI takes over almost all the drudgery, like create/delete EBS, mount/umount to ECS, format, mount/umount EBS to OS, etc.

Just like CSI, the AlibabaCloud CCM(Cloud Controller Manager) also works between the Kubernetes cluster and AlibabaCloud. In this case, CCM is mainly used to manage SLB, including creating/deleting SLB, exposing traffic ports, etc... [We do need to deploy CCM](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/6.-Deploy-AlibabaCloud-CCM) used it as a mid-man to the outside world.

So far, for better use, we still need to put in the last necessary effort: [Setup Nginx ingress controller](https://github.com/tiantiandas/alibabacloud-k8s-setup/wiki/7.-Setup-Nginx-Ingress-Controller) to handle all requests towards the cluster, not only for HTTP but also TCP/UDP.

Hooray!

----
Reference:
- [GitHub: AlibabaCloud CCM](https://github.com/kubernetes/cloud-provider-alibaba-cloud)
- [GitHub: AlibabaCLoud CSI Driver](https://github.com/kubernetes-sigs/alibaba-cloud-csi-driver)
