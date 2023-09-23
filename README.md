# AWS Glue Image

This repository contains a Dockerfile to build a custom AWS Glue image for local
development that supports:

- DeltaLake v2.3.0 (Spark 3.3)

## To build

```shell
docker build --platform x86_64 -t herry13/glue:linux-amd64 .
```

## To run the Jupyter Lab

```shell
export JUPYTER_WORKSPACE_LOCATION=/local_path_to_workspace/jupyter_workspace/
docker run -it --rm \
    -v ~/.aws:/home/glue_user/.aws \
    -v $JUPYTER_WORKSPACE_LOCATION:/home/glue_user/workspace/jupyter_workspace/ \
    -e AWS_PROFILE=$PROFILE_NAME \
    -p 4040:4040 \
    -p 18080:18080 \
    -p 8998:8998 \
    -p 8888:8888 \
    --name glue_jupyter_lab \
    herry13/glue:linux-amd64 \
    /home/glue_user/jupyter/jupyter_start.sh
```

## To run the PySpark shell

```shell
docker run -it --rm \
    -v ~/.aws:/home/glue_user/.aws \
    -e AWS_PROFILE=$PROFILE_NAME \
    -p 4040:4040 \
    -p 18080:18080 \
    --name glue_pyspark \
    herry13/glue:linux-amd64 \
    pyspark
```

## To run a PySpark script

```shell
docker run -it --rm \
    -v ~/.aws:/home/glue_user/.aws \
    -v $WORKSPACE_LOCATION:/home/glue_user/workspace/ \
    -e AWS_PROFILE=$PROFILE_NAME \
    -p 4040:4040 \
    -p 18080:18080 \
    --name glue_spark_submit \
    herry13/glue:linux-amd64 \
    spark-submit \
        /home/glue_user/workspace/pyspark_script.py
```

Note that environment variable `WORKSPACE_LOCATION` contains the PySpark script file.

## License

See the [LICENSE](LICENSE.txt) file for licensing information.
