Import-Module posh-git
Import-Module oh-my-posh
#Set-Theme Paradox
#Set-Theme Sorin
#Set-Theme Darkblood
Set-Theme MyTheme

function azdt { az account set -s Interxion-Portal-DevTest }
function azhm { az account set -s Interxion-Dev-hosseinm }
function azhm2 { az account set -s HM-2 }

function azaksshared { az aks get-credentials -g inxn-shared -n inxn-shared-aks }
function azaksa1 { az aks get-credentials -g inxn-a1 -n inxn-a1-aks }
function azaksp1 { az aks get-credentials -g inxn-p1 -n inxn-p1-aks }
function azaksrg($name) { az aks get-credentials -g $name-rg -n $name }
function kdelns($ns) { kubectl get namespace $ns -o json > ns.json; $json = Get-Content -Path .\ns.json; $json = $json -replace "`"kubernetes`"", ""; Set-Content -Path .\ns.json -Value $json; kubectl replace --raw "/api/v1/namespaces/$ns/finalize" -f ./ns.json }
function kdelnsres($ns) { kubectl delete deployments,replicasets,statefulsets,limitranges,resourcequotas,ingresses,pods,services,events,endpoints -n $ns --all --grace-period=0 --force }
function kcc { kubectl config current-context }
function kcg { kubectl config get-contexts }
function kcd($name) { kubectl config delete-context $name }
function kcushared { kubectl config use-context inxn-shared-aks }
function kcu1503 { kubectl config use-context aks-1503-b2s }
function kfixdash { kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard }
function ktn { kubectl top nodes }

function kpods($n) { if ($n) { kubectl get pods -n $n -o wide } else { kubectl get pods -o wide } }
function kpodsw($n) { if ($n) { kubectl get pods -n $n -o wide --watch } else { kubectl get pods -o wide --watch } }
function kpodsa($n) { kubectl get pods -A -o wide }
function kpodsa($n) { kubectl get pods -A -o wide --watch }

function ksvcs($n) { if ($n) { kubectl get services -n $n -o wide } else { kubectl get services -o wide } }
function ksvcsw($n) { if ($n) { kubectl get services -n $n -o wide --watch } else { kubectl get services -o wide --watch } }
function ksvcsa($n) { kubectl get services -A -o wide }
function ksvcsaw($n) { kubectl get services -A -o wide --watch }

function kevt($n) { if ($n) { kubectl get events -n $n } else { kubectl get events } }
function kevtw($n) { if ($n) { kubectl get events -n $n --watch } else { kubectl get events --watch } }
function kevta($n) { kubectl get events -A }
function kevtaw($n) { kubectl get events -A --watch }
