# MQTT & Postgres

This is an emqttd container that is preconfigured to use Postgres for user credentials and ACL.

# To start the container

```bash
$ docker-compose up --build
```

Then you can access mqtt dashbaord at http://_YOUR_DOCKER_HOST_:18083/

Only one user is preconfigured:
	Username: client
	Password: public

	The only topic it has access is: /World

You can modify the users and ACL in the provisioning/data/030-database/mqtt-table-*.sql