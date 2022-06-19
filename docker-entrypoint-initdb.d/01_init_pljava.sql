SET pljava.libjvm_location TO '/usr/lib/jvm/java-11-openjdk/lib/server/libjvm.so';
ALTER DATABASE postgres SET pljava.libjvm_location FROM CURRENT;
ALTER USER postgres SET SEARCH_PATH TO public,sqlj;
CREATE EXTENSION pljava;
