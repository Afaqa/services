# start kube
echo " Starting kube"
RETRYC=0
minikube start --vm-driver=virtualbox
while [ $? -ne 0 ] && [ $RETRYC -lt 5 ]; do
  echo "Let's retry"
  RETRYC=$(expr $RETRYC + 1)
  minikube start --vm-driver=virtualbox
done

if [ $RETRYC -eq 5 ]; then
  echo "Dead luck."
  exit
fi

echo " Enable addons"
minikube addons enable metallb

# build images
echo " Importing docker"
eval $(minikube -p minikube docker-env)
echo " Building nginx"
make -C srcs/nginx build

# load pods
echo " loading metallb config"
kubectl apply -f srcs/kube/metallb.yaml
echo " loading pods configs"
kubectl apply -Rf srcs/kube/pods/

# launch dashboard
echo " launching dashboard"
minikube dashboard &> /dev/null &
