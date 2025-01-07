# How to install required commands

```console
❯ cd kind

❯ kind create cluster --config config.yaml
Creating cluster "argocd-poc" ...
 ✓ Ensuring node image (kindest/node:v1.32.0) 🖼
 ✓ Preparing nodes 📦 📦 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
 ✓ Joining worker nodes 🚜
Set kubectl context to "kind-argocd-poc"
You can now use your cluster with:

kubectl cluster-info --context kind-argocd-poc

Not sure what to do next? 😅  Check out https://kind.sigs.k8s.io/docs/user/quick-start/
```

```console
❯ kubectl get nodes
NAME                       STATUS   ROLES           AGE   VERSION
argocd-poc-control-plane   Ready    control-plane   93s   v1.32.0
argocd-poc-worker          Ready    <none>          81s   v1.32.0
argocd-poc-worker2         Ready    <none>          81s   v1.32.0
```
