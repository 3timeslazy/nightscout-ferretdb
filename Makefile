run-tests:
	- docker compose -f ${DB_ENGINE} -f docker-compose.yml up \
		--build \
		--abort-on-container-exit \
		--remove-orphans

mongodb: DB_ENGINE=mongodb.yml
mongodb: run-tests

ferretdb-sqlite: DB_ENGINE=ferretdb-sqlite.yml
ferretdb-sqlite: run-tests

ferretdb-postgres: DB_ENGINE=ferretdb-postgres.yml
ferretdb-postgres: run-tests

cleanup:
	- docker rm $$(docker ps -a | grep Exited | awk '{print $$1}')
	- docker image rm $$(docker images | awk '{if ($$1=="<none>") print $$3}')

.PHONY: cleanup mongodb ferretdb-sqlite ferretdb-postgres