docker build -t neerajjainwalmart/fib-client:latest -t neerajjainwalmart/fib-client:$SHA -f ./client/Dockerfile ./client
docker build -t neerajjainwalmart/fib-server:latest -t neerajjainwalmart/fib-server:$SHA -f ./server/Dockerfile ./server
docker build -t neerajjainwalmart/fib-worker:latest -t neerajjainwalmart/fib-worker:$SHA -f ./worker/Dockerfile ./worker
docker push neerajjainwalmart/fib-client:latest
docker push neerajjainwalmart/fib-client:$SHA
docker push neerajjainwalmart/fib-server:latest
docker push neerajjainwalmart/fib-server:$SHA
docker push neerajjainwalmart/fib-worker:latest
docker push neerajjainwalmart/fib-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=neerajjainwalmart/fib-server:$SHA
kubectl set image deployments/client-deployment client=neerajjainwalmart/fib-client:$SHA
kubectl set image deployments/worker-deployment worker=neerajjainwalmart/fib-worker:$SHA