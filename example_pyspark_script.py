"""
This is an example PySpark script for testing the Docker image.
"""
from pyspark.sql import SparkSession


spark = SparkSession.builder.getOrCreate()
df = spark.createDataFrame([(1,), (2,)])
df.write.mode('overwrite').format('delta').save('/home/glue_user/workspace/delta')
