# All About Terraform

> [ Terraform Up & Running ](http://shop.oreilly.com/product/0636920225010.do)

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

## Managing Terraform State
  > *The State File is a Private API* - Changes with every realease and is meant only for internal use within Terraform

  - Shared storage for state files
      - To be able to update your infrastructure, each team members needs access to the same Terraform state files

  - Locking State files
      - When two members are running Terraform at the same time, you can run into race conditions as multiple Terraform processes make a concurrent updates to the state files
      - leading to conflicts, data loss and state file corruption

  - Isolating state files
      - Its best practice to isolate dfferent environements

## Workspaces

### Cons
  - The state files for all of your workspaces are stored in the same backend
  - Workspaces are not visible in the code or on the terminal unless you run `terraform workspace`
  - Error prone. Accidentally running `terraform destroy`
