# #######################################################################################
# start minikube
# #######################################################################################
minikube start
# check minikube status. Should see "minikube: Running..."
minikube status

# #######################################################################################
# change to the working directory
# #######################################################################################
cd ~/dev-leo/example/fluent-bit-kubernetes-logging

# #######################################################################################
# run the following commands to create the namespace, service account and role setup
# #######################################################################################
# create a namespace
kubectl create namespace logging
# check namespaces. Should see "logging       Active    ..."
kubectl get namespaces

# create a ServiceAccount
kubectl create -f fluent-bit-service-account.yaml
# check ServiceAccount. Should see "fluent-bit   1  ..."
kubectl get ServiceAccounts -n logging

# create a ClusterRole
kubectl create -f fluent-bit-role.yaml
# check ClusterRoless. Should see "fluent-bit-read"
kubectl get ClusterRoles

# create a ClusterRoleBinding
kubectl create -f fluent-bit-role-binding.yaml
# check ClusterRoleBinding. Should see "fluent-bit-read"
kubectl get ClusterRoleBindings


# #######################################################################################
# Fluent Bit to Elasticsearch on Minikube
# #######################################################################################
kubectl create -f output/elasticsearch/fluent-bit-ds-minikube.yaml