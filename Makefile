build-push:
	set -e
	yarn build
	docker build -t brojonat/poisson-confidence-intervals-frontend .
	docker push brojonat/poisson-confidence-intervals-frontend

deploy:
	@make build-push
	kubectl apply -f k8s/deployment.yaml
	kubectl apply -f k8s/ingress.yaml
	kubectl rollout restart deployment poisson-confidence-intervals-frontend

run-local:
	set -e
	quasar dev
