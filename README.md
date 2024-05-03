# Status
🚧 **Under Development** 🚧

This project is currently under active development. I'm continuously working on adding features, fixing bugs, and improving documentation. 
Although this is a one-man project, contributions are welcome.
Please feel free to open issues or submit pull requests.

# dev_forum
Dev forum is a project I've started in order to familiarize myself with the concept and implementation of microservices and related patterns in Go.
Since this project was created for educational purposes only, the business logic is intentionally kept very basic so I could focus on learning new tools and technologies without wasting time trying to find solutions to complex made-up problems.

## Learning Objectives
- **Microservice Architecture**: Understand how to design applications as a collection of small, loosely coupled services.
- **Hands-on Kubernetes Experience**: Learn to develop, test, deploy and scale applications using Kubernetes.
- **Resilience and Availability**: Implement services in a way that ensures horizontal scalability and high availability by avoiding [SPOFs](https://en.wikipedia.org/wiki/Single_point_of_failure) and bottlenecks.
- **Debugging and Monitoring**: Learn how to monitor the health of services and debug the common issues that may arise.

Configurations for DBs, message brokers etc. are kept at bare minimum required to work so I can focus on the code instead.

## Use-cases
Dev forum allows users to register.
Registered users can create, update and delete articles and allows everyone to read them.

That's all.

...looking back I probably should have named the project a 'blog' instead.

## Structure
Dev-forum consists of multiple repositories where each one is named `dev_forum-{name}`. Repositories storing source code of backend services are referenced in this repository as submodules for easier deployment allowing to version the whole system as one application. Each service is additionally versioned separately.

## Set up
Dev-forum is designed to be deployed entirely on Kubernetes.
Each submodule is a seperate service containing its main deployment along with any additional k8s resources it needs. 

You need a working [Kubernetes environment](https://kubernetes.io/docs/setup) with [Kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization).

Main resources are defined in `k8s/`. Currently there are `stage`, `dev` and `test` overlays available which include all required resources and configs. Overlay's name corresponds to the namespace it will be deployed on, excluding certain resources such as [cert-manager](https://cert-manager.io/) included in `tls` component which is defined in it's own namespace.

Use `make` to apply an overlay to current `kubectl` context.
```shell
make deploy overlay=<dev/stage/...>
```
Once you deploy one of the overlays you can deploy backend services to this overlay. Instructions on how to do this are included in the documentation of each service.
