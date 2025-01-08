# How to deploy the argocd

```console
❯ helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/databus23/helm-diffDownloading https://github.com/databus23/helm-diff/releases/download/v3.9.13/helm-diff-linux-amd64.tgz
Preparing to install into /home/vagrant/.local/share/helm/plugins/helm-diff
Installed plugin: diff

❯ helm plugin list
NAME    VERSION DESCRIPTION
diff    3.9.13  Preview helm upgrade changes as a diff
```

```console
❯ cd helmfile

❯ helmfile diff --environment poc
<omit>

❯ helmfile apply --environment poc
<omit>
Upgrading release=argocd, chart=argo/argo-cd, namespace=argocd
Release "argocd" does not exist. Installing it now.
NAME: argocd
LAST DEPLOYED: Wed Jan  8 05:12:46 2025
NAMESPACE: argocd
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
In order to access the server UI you have the following options:

1. kubectl port-forward service/argocd-server -n argocd 8080:443

    and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
      - Add the annotation for ssl passthrough: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
      - Set the `configs.params."server.insecure"` in the values file and terminate SSL at your ingress: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

(You should delete the initial secret afterwards as suggested by the Getting Started Guide: https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli)

Listing releases matching ^argocd$
argocd  argocd          1               2025-01-08 05:12:46.308921555 +0900 JST deployed        argo-cd-7.7.14  v2.13.3


UPDATED RELEASES:
NAME     NAMESPACE   CHART          VERSION   DURATION
argocd   argocd      argo/argo-cd   7.7.14       1m14s
```

```console
❯ kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
<admin user password>

❯ kubectl port-forward service/argocd-server --namespace argocd 8080:443 &

❯ argocd login localhost:8080
WARNING: server certificate had error: tls: failed to verify certificate: x509: certificate signed by unknown authority. Proc
eed insecurely (y/n)? y
Username: admin
Password:
'admin:login' logged in successfully
Context 'localhost:8080' updated
```

https://localhost:8080/
