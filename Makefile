build-push:
	set -e
	yarn build
	docker build -t brojonat/poisson-confidence-intervals-frontend .
	docker push brojonat/poisson-confidence-intervals-frontend

run-local:
	set -e
	quasar dev
