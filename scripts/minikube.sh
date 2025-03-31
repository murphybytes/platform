#!/bin/bash 

finish() { minikube stop; }

if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
  trap finish TERM INT EXIT
elif [[ "$OSTYPE" == "darwin"* ]]; then
  trap finish SIGTERM SIGINT EXIT
else 
  echo "${OSTYPE} unsupported"
  exit 1
fi 

minikube start
minikube logs -f
