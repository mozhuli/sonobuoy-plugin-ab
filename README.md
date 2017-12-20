# sonobuoy-plugin-ab

Apache Benchmark Plugin of [Sonobuoy](https://github.com/heptio/sonobuoy)

use command `/usr/bin/ab -n 90000 -c 50 ${NGINX_ENDPOINT}` to benchmark the vip of nginx in 
kubernetes.

## Usage

1. Install Sonobuoy with this plugin.

```
kubectl create -f examples/benchmark.yml
```

2. Verify that Sonobuoy has completed successfully if you see the log line `no-exit was specified, sonobuoy is now blocking`.

```
kubectl logs -f sonobuoy --namespace=heptio-sonobuoy
```

3. Copy the output directory from the main Sonobuoy pod to somewhere local.

```
kubectl cp heptio-sonobuoy/sonobuoy:/tmp/sonobuoy ./results --namespace=heptio-sonobuoy
```

4. View the results.

```
cd results && tar -zxvf *.tar.gz && cd plugins/ab
```

5. Clean up.

```
kubectl delete -f examples/benchmark.yml
```

