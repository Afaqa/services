YELLOW="\033[1;33m"
ORANGE="\033[0;33m"
CLEAR="\033[0m"

echo $YELLOW "\t>> Starting kube" $CLEAR
minikube start
if [ $? -ne 0 ]; then
  echo $ORANGE "\t>> Not started. Download minikube and docker"\
      " then check disk space.\033[0" $CLEAR
  exit
fi

minikube addons enable metallb

eval $(minikube -p minikube docker-env)
echo $YELLOW "\t>> Building nginx" $CLEAR
make -C srcs/nginx build

kubectl apply -f srcs/kube.yaml
minikube dashboard &> /dev/null &
