FROM amazon/aws-glue-libs:glue_libs_4.0.0_image_01

# Add DeltaLake JAR files
ADD https://repo1.maven.org/maven2/io/delta/delta-core_2.12/2.3.0/delta-core_2.12-2.3.0.jar /home/glue_user/spark/jars/delta-core_2.12-2.3.0.jar
ADD https://repo1.maven.org/maven2/io/delta/delta-contribs_2.12/2.3.0/delta-contribs_2.12-2.3.0.jar /home/glue_user/spark/jars/delta-contribs_2.12-2.3.0.jar
ADD https://repo1.maven.org/maven2/io/delta/delta-storage/2.3.0/delta-storage-2.3.0.jar /home/glue_user/spark/jars/delta-storage-2.3.0.jar
ADD https://repo1.maven.org/maven2/io/delta/delta-storage-s3-dynamodb/2.3.0/delta-storage-s3-dynamodb-2.3.0.jar /home/glue_user/spark/jars/delta-storage-s3-dynamodb-2.3.0.jar
ADD https://repo1.maven.org/maven2/io/delta/delta-iceberg_2.12/2.3.0/delta-iceberg_2.12-2.3.0.jar /home/glue_user/spark/jars/delta-iceberg_2.12-2.3.0.jar

# Add a customer spark-default.conf that contains DeltaLake default configurations
ADD spark-defaults.conf /home/glue_user/spark/conf/spark-defaults.conf

USER root

RUN chown glue_user:root \
        /home/glue_user/spark/jars/*.jar \
        /home/glue_user/spark/conf/spark-defaults.conf \
    && chmod 0644 \
        /home/glue_user/spark/jars/*.jar \
        /home/glue_user/spark/conf/spark-defaults.conf

ENV DISABLE_SSL=true

USER glue_user
