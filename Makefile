dev:
	go run ./services/rest-api/cmd/rest-api

build:
	docker build -t rest-api:dev ./services/rest-api

deploy-local:
	helm upgrade --install rest-api ./helm/rest-api -n dev
