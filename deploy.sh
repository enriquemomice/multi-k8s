docker build -t enriquemomice/multi-client -f .client/Dockerfile ./client
docker build -t enriquemomice/multi-server -f .server/Dockerfile ./server
docker build -t enriquemomice/multi-worker -f .worker/Dockerfile ./worker
docker push enriquemomice/multi-client
docker push enriquemomice/multi-server
docker push enriquemomice/multi-worker
kubectl apply -f k8s
kubectl rolling-restart deployment/client-deployment
kubectl rolling-restart deployment/server-deployment
kubectl rolling-restart deployment/worker-deployment