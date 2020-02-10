# All About Terraform

## Load Balancers
  - Application Load Balancer (ALB)
      - Best suited for load balancing of HTTP and HTTPS traffic
  - Network Load Balancer (NLB)
      - Best suited for load balancing of TCP, UDP and TLS traffic
      - Designed to scale to tens of millions of requests per second
  - Classic Load Balancer (CLB)
      - Legacy load balancer
      - handles HTTP, HTTPS, TCP and TLS traffic but with far fewer features

## ALB

### Listener
  - Listens on a specific port(80) and protocol (HTTP)

### Listener rule
  - Takes requests that come into a listener and sends those that match 

### Target groups
  - one or more servers that receive requests from the load balancer
