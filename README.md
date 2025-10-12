# Testkube Sample Application

A sample 3-tier application to run tests on.
The application is composed of a React frontend, NodeJs backend and a PostgreSQL database.

It can be used to showcase Testkube tests workflows.

![Testkube Sample Application](./docs/images/app.png)

## Running the application

You can either use docker-compose.yaml:

```
docker-compose up
```

Or run it locally:

```
npm run start
```

When running locally you should start your own PostgreSQL database.
There are many ways to do this, one suggestion is to use Docker:

```
docker run --name testkube-sample-db \
  -p 15432:5432 \
  -e POSTGRES_DB=api-db \
  -e POSTGRES_USER=api-user \
  -e POSTGRES_PASSWORD=api-password \
  --rm -d postgres
```

## Running tests

Unit tests can be executed without a running appliction:

```
npm run test
```

For E2E test, you should first run the application as described above:

```
npm run test:e2e
```


## Continuous Delivery Simulation with a Kind k8s cluster & Git Hooks
This repo is an example we can simulate continuous delivery with k8s
using `kind`, docker and git pre and post-commit hooks.

### Prerequisites
1. Install and run Docker
2. Install kind
  * windows - `choco install kind`
  * macos - `brew install kind`
3. Run the following commands
```bash
./vullnet.sh

cd apps/web
npm ci
npm run build
npm run preview
```
4. Visit `localhost:4173` and try it out
