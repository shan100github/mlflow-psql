# MLflow with postgresql
Repo for mlflow with psql deployment

1. Build MLflow docker image with below command.
`docker build . -t mlflow:psql`

2. Create MLflow namespace
`kubectl create namespace mlflow`

3. Deploy postgresql
`kubectl -f apply manifest/postgresql.yaml`

4. Deploy MLflow
`kubectl -f apply manifest/mlflow.yaml`

Here comes extra addition to setup authentication with mlflow

5. Integerate MLflow in kubeflow authentication
`kubectl edit cm centraldashboard-config -n kubeflow`
and then add the following item to the "menuLinks":
```
    {
        "type": "item",
        "link": "/mlflow/",
        "text": "MLFlow",
        "icon": "icons:cached"
    }
```

Create virtual service for mlflow.
`kubectl apply -f manifest/kfp-mlflow-virtualservice.yaml`