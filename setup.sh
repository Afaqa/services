YELLOW="\033[1;33m"
ORANGE="\033[0;33m"
CLEAR="\033[0m"

minikube stop
minikube delete
echo $YELLOW "\t>> Starting kube" $CLEAR
minikube start --addons=metallb --vm-driver=virtualbox --memory=2000 --disk-size=4096
if [ $? -ne 0 ]; then
  echo $ORANGE "\t>> Not started. Download minikube and docker"\
      " then check disk space.\033[0" $CLEAR
  exit
fi

eval $(minikube -p minikube docker-env)
for service in mysql nginx wordpress phpmyadmin ftps influx grafana; do
    echo $YELLOW "\t>> Building $service" $CLEAR
    make -C srcs/$service build
done

minikube dashboard &> /dev/null &
echo $YELLOW "\t>> Kustomization" $CLEAR
kubectl apply -k srcs/kube
echo $ORANGE "Finished!" $CLEAR
