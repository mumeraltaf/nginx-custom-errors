# nginx-custom-errors

Implementation of custom error pages for nginx as described here: https://github.com/kubernetes/ingress-nginx/tree/main/images/custom-error-pages

## Build
    
```bash
docker build -t custom-erros:a .
```

## Run

```bash
docker run -p 8080:8080 -e DEBUG=true docker.io/library/custom-erros:a
```
* DEBUG=true: enable debug mode, which will print the error code and the error message in the response headers.

## Test

```bash
curl --header "X-Code: 404" --header "X-Format: text/html"  localhost:8080
<span>The page youre looking for could not be found YUP.</span>

curl --header "X-Code: 503" localhost:8080
<span>Something went wrong 5xx Custom.</span>

curl --header "X-Code: 404" --header "X-Format: text/javascript"  localhost:8080
404 page not found

```

* X-Code: will set the html code to test
* X-Format: will set the format of the response
* http://localhost:8080/metrics is the Prometheus metrics endpoint