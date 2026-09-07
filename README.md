End-to-End DevSecOps CI/CD Pipeline for Containerized Applications on Kubernetes

A production-style DevSecOps project that demonstrates an end-to-end CI/CD workflow for building, testing, securing, containerizing, deploying, monitoring, and troubleshooting a Python Flask application on Kubernetes.

The project combines Infrastructure as Code, containerization, Kubernetes, Helm, GitHub Actions, automated security scanning, monitoring, health checks, failure testing, and deployment rollback practices.

Project Overview

This project simulates a real-world DevOps and DevSecOps workflow from source code to a running application on Kubernetes.

The objective is to build an automated and security-focused delivery pipeline where application changes move through testing, security validation, containerization, deployment, monitoring, and recovery.

Application Delivery Flow

Stage

Technology / Action

1

Developer commits application changes

2

GitHub stores the source code

3

GitHub Actions starts the CI/CD workflow

4

Pytest runs automated unit tests

5

Gitleaks checks for exposed secrets

6

SonarQube checks code quality and security

7

Checkov scans Infrastructure as Code

8

Trivy scans files and configurations for vulnerabilities

9

Docker builds the application image

10

Trivy scans the container image

11

The image is pushed to a container registry

12

Helm manages the Kubernetes deployment

13

Kubernetes runs the application

14

Health checks validate application availability

15

Prometheus collects monitoring metrics

16

Grafana provides monitoring dashboards

17

Failure scenarios and rollback procedures are tested

Infrastructure Flow

Stage

Component

Purpose

1

Terraform

Defines infrastructure as code

2

Floci

Provides the local AWS-compatible development environment

3

AWS-compatible services

Simulate required cloud infrastructure locally

Important: Floci is used as a local AWS-compatible environment because this project does not use a real AWS account. AWS service compatibility will be verified before implementation, and unsupported services will be adapted and documented.

Project Objectives

The project is designed to demonstrate practical DevOps and DevSecOps skills, including:

Source code management with Git and GitHub

Automated application testing

CI/CD pipeline automation

Infrastructure as Code using Terraform

Local AWS-compatible infrastructure using Floci

Containerization with Docker

Kubernetes application deployment

Helm-based deployment management

Kubernetes health checks

Kubernetes RBAC and ServiceAccounts

Secure configuration using ConfigMaps and Secrets

Source-code security scanning

Infrastructure security scanning

Container vulnerability scanning

Application and infrastructure monitoring

Failure troubleshooting

Deployment rollback

Technical documentation

Technology Stack

Infrastructure

Linux / WSL

Terraform

Floci

AWS-compatible CLI

Source Control

Git

GitHub

Application

Python

Flask

Pytest

Containerization

Docker

Dockerfile

CI/CD

GitHub Actions

Kubernetes

Kubernetes

kubectl

Deployments

Services

ConfigMaps

Secrets

ServiceAccounts

RBAC

Liveness Probes

Readiness Probes

Resource Requests

Resource Limits

Deployment

Helm

Security

Gitleaks

SonarQube

Checkov

Trivy

Monitoring

Prometheus

Grafana

Automation

Bash

YAML

Terraform

DevSecOps CI/CD Pipeline

The pipeline follows a shift-left security approach by introducing automated security checks throughout the software delivery lifecycle.

Pull Request Workflow

Stage

Action

1

Pull Request created

2

GitHub Actions starts the workflow

3

Source code is checked out

4

Application dependencies are installed

5

Unit tests are executed

6

Gitleaks scans for exposed secrets

7

SonarQube performs code quality and security analysis

8

Checkov scans Terraform and IaC configurations

9

Trivy scans application files and configurations

10

Security gates evaluate the results

11

Pipeline passes when configured requirements are satisfied

12

Pipeline stops when a configured security threshold is exceeded

Main Branch Workflow

Stage

Action

1

Changes are merged into the main branch

2

GitHub Actions starts the deployment workflow

3

Unit tests are executed

4

Security scans are executed

5

Docker builds the container image

6

Trivy scans the container image

7

The approved image is pushed to the container registry

8

Helm deploys the application to Kubernetes

9

Kubernetes health checks validate the deployment

10

Deployment status is verified

Security tools will be configured as actual pipeline gates rather than being used only as manual scanning tools.

Security Implementation

The project applies DevSecOps principles by integrating security validation into the CI/CD process.

Gitleaks

Gitleaks is used to detect accidentally committed secrets and sensitive credentials.

The pipeline will fail when a configured secret-detection rule identifies an exposed secret.

SonarQube

SonarQube is used for:

Source-code quality analysis

Security analysis

Code issue detection

Maintainability checks

Checkov

Checkov is used to scan Terraform and Infrastructure as Code configurations for security and compliance issues.

Trivy

Trivy is used for vulnerability scanning of:

Application files

Container images

Kubernetes configurations

Infrastructure as Code configurations

Security gates will be configured so that the pipeline can fail when a configured security threshold is exceeded.

Kubernetes Implementation

The application will be deployed to a dedicated Kubernetes namespace.

The Kubernetes implementation will include:

Namespace isolation

Deployment

Service

ConfigMap

Secret

ServiceAccount

RBAC

Liveness probes

Readiness probes

Resource requests

Resource limits

Existing workloads in the local Kubernetes cluster will not be deleted or modified unnecessarily.

Helm Deployment

Helm will be used to package and manage the Kubernetes application deployment.

The Helm chart will support environment-specific configuration through values files.

Planned Environments

Development

Production

Helm will also be used to maintain deployment history and demonstrate rollback procedures.

Infrastructure as Code

Terraform will be used to define infrastructure configuration.

Floci is being used as an AWS-compatible local development environment because this project does not use a real AWS account.

AWS-related components will be checked against Floci's supported capabilities before implementation.

Where a service is unsupported or partially supported, the project will document and apply an appropriate adaptation.

The design will remain transferable to real AWS infrastructure where practical.

Monitoring and Observability

The final implementation will use Prometheus and Grafana to provide visibility into the Kubernetes environment and application.

Monitoring Flow

Component

Responsibility

Kubernetes

Runs the application workloads

Application

Generates application activity and health information

Prometheus

Collects and stores metrics

Grafana

Provides dashboards and visualization

Monitoring Areas

The monitoring setup will provide visibility into:

Pod availability

CPU usage

Memory usage

Pod restarts

Application availability

Kubernetes health

Failure Testing and Troubleshooting

Real troubleshooting scenarios will be intentionally introduced and resolved as part of the project.

ImagePullBackOff

The project will demonstrate how to investigate an image-pull failure using:

kubectl get pods

kubectl describe pod

CrashLoopBackOff

The project will demonstrate how to investigate application startup failures using:

kubectl get pods

kubectl logs

kubectl describe pod

Trivy Security Failure

The project will demonstrate a controlled security failure:

Introduce a test vulnerability.

Run the Trivy scan.

Verify that the security gate detects the vulnerability.

Fix the dependency or base image.

Rebuild the container image.

Run the scan again.

Verify that the security check passes.

Gitleaks Failure

The project will demonstrate a controlled secret-detection failure:

Introduce a test secret.

Run the Gitleaks scan.

Verify that the secret is detected.

Remove or rotate the test secret.

Secure the configuration.

Run the pipeline again.

Verify that the security check passes.

Helm Rollback

The project will demonstrate release management and recovery using:

helm status

helm history

helm rollback

These scenarios are included to demonstrate practical DevOps troubleshooting, incident analysis, and recovery skills.

Project Structure

The repository will progressively develop into the following structure:

devops-kubernetes-cicd-pipeline/
├── README.md
├── LICENSE
├── .gitignore
├── architecture/
│   ├── architecture.png
│   └── architecture.drawio
├── app/
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── .dockerignore
│   └── tests/
│       └── test_app.py
├── terraform/
│   ├── providers.tf
│   ├── versions.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   └── modules/
│       ├── network/
│       ├── compute/
│       └── kubernetes/
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── configmap.yaml
│   ├── secret.yaml
│   └── serviceaccount.yaml
├── helm/
│   └── devsecops-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── values-dev.yaml
│       ├── values-prod.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── configmap.yaml
│           ├── secret.yaml
│           ├── serviceaccount.yaml
│           └── _helpers.tpl
├── monitoring/
│   ├── prometheus/
│   └── grafana/
├── security/
│   ├── gitleaks/
│   ├── sonarqube/
│   ├── checkov/
│   └── trivy/
├── scripts/
│   ├── setup.sh
│   ├── build.sh
│   ├── deploy.sh
│   ├── health-check.sh
│   └── destroy.sh
└── .github/
    └── workflows/
        ├── ci.yml
        ├── security.yml
        └── cd.yml

The structure will be created progressively as each project phase is completed.

Local Development Environment

The current development environment consists of:

Layer

Technology

Operating System

Windows

Linux Environment

WSL Ubuntu

Container Platform

Docker Desktop

Kubernetes

Kind Kubernetes Cluster

Local AWS-compatible Environment

Floci

Floci runs on Windows and is accessed from WSL Ubuntu.

Existing Kubernetes workloads will be preserved and the project will use a dedicated namespace.

End-to-End Workflow

The complete project workflow is:

Git → GitHub → GitHub Actions → Automated Tests → Security Gates → Docker → Container Registry → Helm → Kubernetes → Health Checks → Prometheus → Grafana → Failure Testing → Rollback

Infrastructure Workflow

Terraform → Floci → AWS-compatible Local Infrastructure

Production-Style Target

The project targets a production-style implementation with:

Infrastructure as Code

Automated CI/CD

Security gates

Container security

Kubernetes deployment

Helm-based releases

Health checks

Monitoring

Failure testing

Rollback

Technical documentation

Documentation

The final project documentation will include:

Architecture documentation

Installation guide

CI/CD pipeline explanation

Security implementation

Monitoring setup

Troubleshooting guide

Screenshots

Demo video

Resume-ready project description

Project Status

Current Phase: Phase 2 — GitHub Repository Setup

Phase

Status

Phase 0 — Planning & Compatibility

✅ Complete

Phase 1 — Local Environment

✅ Complete

Phase 2 — GitHub Repository

🔄 In Progress

Phase 3 — Application

⏳ Planned

Phase 4 — Docker

⏳ Planned

Phase 5 — Terraform / Infrastructure

⏳ Planned

Phase 6 — Kubernetes

⏳ Planned

Phase 7 — Helm

⏳ Planned

Phase 8 — CI/CD

⏳ Planned

Phase 9 — DevSecOps

⏳ Planned

Phase 10 — Monitoring

⏳ Planned

Phase 11 — Failure Testing & Rollback

⏳ Planned

Phase 12 — Documentation

⏳ Planned

Key DevOps and DevSecOps Skills Demonstrated

This project demonstrates practical experience with:

Linux administration

Git and GitHub

CI/CD automation

GitHub Actions

Infrastructure as Code

Terraform

Docker

Kubernetes

Helm

Kubernetes RBAC

Application health checks

Container security

Secret detection

Static code analysis

Infrastructure security

Vulnerability management

Prometheus

Grafana

Bash automation

YAML

Troubleshooting

Failure recovery

Deployment rollback

Disclaimer

This project uses Floci as an AWS-compatible local development environment rather than a real AWS account.

AWS service compatibility will be evaluated before implementation. Unsupported or partially supported services will be adapted where appropriate and clearly documented.

The objective is to build a technically honest project that demonstrates transferable DevOps and DevSecOps concepts applicable to real cloud environments.

Author

R S SUBHAM MOHNATY

DevOps | DevSecOps | Kubernetes | AWS | Terraform | Docker | CI/CD