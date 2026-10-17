.PHONY: help up down logs psql reset

# Load .env so POSTGRES_* variables are available here (ignore if missing)
-include .env
export

help:  ## Show available commands
	@grep -hE '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-8s\033[0m %s\n", $$1, $$2}'

up:  ## Start Postgres in the background and wait until it is healthy
	docker compose up -d --wait

down:  ## Stop containers (data is kept in the volume)
	docker compose down

logs:  ## Follow Postgres logs
	docker compose logs -f postgres

psql:  ## Open a psql shell inside the container
	docker compose exec postgres psql -U $(POSTGRES_USER) -d $(POSTGRES_DB)

reset:  ## Stop containers AND delete the database volume (destructive)
	docker compose down -v
