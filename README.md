# End-to-End DevSecOps CI/CD Pipeline for Containerized Applications on Kubernetes

A production-style DevSecOps project that demonstrates an end-to-end CI/CD workflow for building, testing, securing, containerizing, deploying, monitoring, and troubleshooting a Python Flask application on Kubernetes.

The project combines Infrastructure as Code, containerization, Kubernetes, Helm, GitHub Actions, automated security scanning, monitoring, health checks, failure testing, and deployment rollback practices.

---

## Project Overview

This project demonstrates an end-to-end **DevOps and DevSecOps workflow**, taking application source code through automated testing, security validation, containerization, deployment, monitoring, and recovery on Kubernetes.

The project combines **GitHub Actions, Docker, GHCR, Helm, Kubernetes, Terraform, Floci, Prometheus, and Grafana** to demonstrate an automated and security-focused application delivery workflow.

### Application Delivery Flow

```text
Developer
    |
    v
 GitHub
    |
    v
GitHub Actions
    |
    +--------------------------+
    |                          |
    v                          v
Unit Tests              Security Validation
                              |
                    +---------+---------+---------+
                    |         |         |         |
                    v         v         v         v
                 Gitleaks  SonarQube  Checkov   Trivy
                    |         |         |         |
                    +---------+---------+---------+
                              |
                              v
                        Docker Build
                              |
                              v
                    Container Registry
                              |
                              v
                       Helm Deployment
                              |
                              v
                         Kubernetes
                              |
                              v
                        Application
                              |
                       +------+------+
                       |             |
                       v             v
                  Prometheus     Grafana
```

### Infrastructure Flow

Terraform is used to define infrastructure as code, while Floci provides an AWS-compatible local environment for infrastructure testing and demonstration without using a real AWS account.

```text
Terraform
    |
    v
  Floci
    |
    v
AWS-Compatible
Local Infrastructure
```
---

# Phase 1 — Local DevOps Environment Setup

## Objective

The objective of Phase 1 was to prepare and validate the complete local DevOps/DevSecOps environment required for application development, containerization, Kubernetes deployment, and CI/CD automation.

## Environment Architecture
        Windows
        |
        ↓
        WSL 2 + Ubuntu
        |
        ↓
        Docker Desktop
        |
        ↓
        Kind Kubernetes Cluster
        |
        ↓
        Floci (AWS-Compatible Local Environment)


## Tools Installed and Configured

| Tool | Purpose | Status |
|------|---------|--------|
| WSL 2 | Linux development environment | ✅ |
| Ubuntu | DevOps workspace | ✅ |
| Docker Desktop | Container runtime | ✅ |
| Terraform | Infrastructure as Code | ✅ |
| AWS CLI | AWS-compatible communication | ✅ |
| Floci | Local AWS-compatible environment | ✅ |
| kubectl | Kubernetes management | ✅ |
| Kind | Local Kubernetes cluster | ✅ |
| Helm | Kubernetes package management | ✅ |
| Python 3.10 | Application development | ✅ |

---

## WSL Setup

Configured Ubuntu inside WSL 2 for running DevOps tools such as:

- Terraform
- AWS CLI
- kubectl
- Helm
- Docker CLI
- Python tools

---

## Docker Configuration

Docker Desktop was configured with WSL integration.

Docker was validated successfully for:

- Building container images
- Running containers
- Kubernetes container runtime

---

## Terraform and AWS CLI Setup

Terraform was installed for Infrastructure as Code workflows.

AWS CLI was configured to communicate with Floci instead of real AWS.

Architecture:

        Terraform
        |
        ↓
        Floci
        |
        ↓
        AWS-Compatible Local Infrastructure


---

## Floci Configuration

Floci was used to simulate AWS services locally without requiring a real AWS account.

Validation completed:

- Floci endpoint connectivity
- AWS CLI authentication
- AWS-compatible API communication

---

## Kubernetes Setup

A local Kubernetes environment was prepared using Kind.

Configured:

- kubectl access
- Kubernetes context
- Cluster connectivity
- Node verification

Existing Kubernetes workloads were preserved, and a separate namespace was planned for this project.

---

## Helm Setup

Helm was installed for:

- Kubernetes application packaging
- Deployment management
- Rollback support

---

## Python Environment Setup

Python environment was prepared for Flask application development.

Configured:

- Python 3.10
- pip
- Python virtual environment support

Project dependencies will be installed inside the application virtual environment.

---

# Problems Faced and Solutions

| Problem | Solution |
|---------|----------|
| WSL distribution name mismatch | Used the correct Ubuntu distribution |
| Docker connection issue | Enabled Docker Desktop Engine |
| Floci not available in Ubuntu PATH | Used Windows executable path through `/mnt` |
| Floci environment activation issue | Exported variables manually |
| kubectl had no context | Configured Windows kubeconfig file |
| pytest not available globally | Installed inside project environment |

---

# Phase 1 Result

The complete local DevOps environment was successfully prepared.

The system is now ready for:

✅ Flask application development  
✅ Docker containerization  
✅ Kubernetes deployment  
✅ Helm packaging  
✅ Terraform infrastructure  
✅ CI/CD automation

# Phase 2 — GitHub Repository Setup

## Objective

The objective of Phase 2 was to create the GitHub repository, configure Git, prepare the DevSecOps project structure, and connect the local development environment with GitHub.

This phase established the foundation for future application development, Docker, Kubernetes, Terraform, CI/CD, security scanning, and monitoring phases.

---

# Repository Setup

## GitHub Repository

     Repository: devops-kubernetes-cicd-pipeline 


Purpose:

The repository will contain the complete DevSecOps pipeline implementation including:

- Flask application
- Docker containerization
- Kubernetes deployment
- Helm charts
- Terraform infrastructure
- GitHub Actions CI/CD
- Security scanning
- Monitoring configuration

---

# Git Configuration

Configured Git identity:

- Username
- Email

Verified remote connection between local repository and GitHub.

Repository connection:

        Local Repository
        |
        ↓
        GitHub

---

# Project Structure

Created the initial DevSecOps project structure:

        devops-kubernetes-cicd-pipeline
        │
        ├── .github/
        │ └── workflows/
        │
        ├── app/
        │ ├── tests/
        │ ├── app.py
        │ ├── requirements.txt
        │ ├── Dockerfile
        │ └── .dockerignore
        │
        ├── terraform/
        │ └── modules/
        │
        ├── kubernetes/
        │
        ├── helm/
        │ └── devsecops-app/
        │
        ├── monitoring/
        │ ├── prometheus/
        │ └── grafana/
        │
        ├── security/
        │ ├── gitleaks/
        │ ├── sonarqube/
        │ ├── checkov/
        │ └── trivy/
        │
        ├── scripts/
        │
        ├── README.md
        ├── LICENSE
        └── .gitignore


---

# .gitignore Configuration

Created `.gitignore` to prevent unnecessary and sensitive files from being committed.

Excluded:

- Python cache files
- Virtual environments
- Environment files
- Terraform state files
- Kubernetes credentials
- Security reports
- IDE files

Examples:

        .venv/
        pycache/
        .env
        terraform.tfstate
        kubeconfig


---

# Documentation Setup

Created initial:

- README.md
- LICENSE

README included:

- Project overview
- Technology stack
- DevSecOps workflow
- Future implementation phases

---

# Initial Git Commit

Created the first project commit:

     - chore: initialize DevSecOps project structure


All initial project files were successfully committed.

---

# GitHub Authentication Setup

## Problem

Initial push failed because GitHub no longer supports password authentication for Git operations.

## Solution

Configured GitHub Personal Access Token (PAT).

Required permissions:

- Repository contents → Read and write
- Workflows → Read and write

Workflow permission was required because the repository contains:
 
   - .github/workflows/


---

# Repository Push

Successfully pushed the project to GitHub.

Final verification:

  - Branch: main

Status:

  - Working tree clean
  - Repository synchronized with origin/main


---

# Problems Faced and Solutions

| Problem | Solution |
|---------|----------|
| Empty repository after cloning | Created project files locally and pushed them |
| Incorrect upstream branch | Removed old upstream configuration |
| GitHub password authentication failed | Used Personal Access Token |
| Workflow push rejected | Added workflow permission to PAT |
| Empty folders not appearing in Git | Added required files/placeholders |

---

# Phase 2 Result

GitHub repository setup was completed successfully.

Completed:

✅ Repository created  
✅ Git configured  
✅ Project structure created  
✅ README and LICENSE added  
✅ .gitignore configured  
✅ Initial commit created  
✅ GitHub authentication configured  
✅ Project pushed successfully  

The repository is now ready for application development and DevSecOps implementation.

---

# Phase 3 — Application Development & Containerization

## Objective

The objective of Phase 3 was to develop a production-ready Flask application, add configuration management, implement automated testing, and containerize the application using Docker.

The main goals were:

- Build a backend application
- Add health and readiness endpoints
- Support environment-based configuration
- Implement automated testing
- Create a production Docker image
- Run and verify the containerized application

---

# Application Development

## Flask Application

A Flask-based backend application was created.

Application structure:

        app/
        │
        ├── app.py
        ├── config.py
        ├── requirements.txt
        ├── Dockerfile
        ├── .dockerignore
        │
        └── tests/
        ├── test_app.py
        └── conftest.py


---

## Application Endpoints

The application provides the following endpoints:

| Endpoint | Purpose |
|----------|---------|
| `/` | Verify application availability |
| `/health` | Health check endpoint |
| `/ready` | Readiness check endpoint |

Example responses:

  - GET /

    - DevSecOps Flask Application is running

  - GET /health

    - healthy

  - GET /ready

    - ready


---

# Configuration Management

Application configuration was separated from the source code using environment variables.

Created:

  - config.py


Supported configurations:

- Application name
- Environment
- Port

Example:

  - APP_NAME
  - APP_ENV
  - PORT


Benefits:

- Configuration can change without modifying code
- Supports different environments
- Follows production deployment practices

---

# Python Environment Setup

  - Created an isolated Python virtual environment:

    - app/.venv


  - Configured:

    - Python 3.10
    - pip
    - Project dependencies

  - Dependencies were managed using:

    - requirements.txt

  - Main dependencies:
    
     - Flask
     - gunicorn


---

# Automated Testing

## Pytest Implementation

Automated tests were added to verify application functionality.

Created:
   
   - tests/test_app.py


Test cases:

| Test | Verification |
|------|-------------|
| Home Endpoint | `/` returns 200 response |
| Health Endpoint | `/health` returns healthy |
| Ready Endpoint | `/ready` returns ready |

---

## Pytest Import Issue

Problem:

Pytest was unable to locate the Flask application module.

Solution:

Created:

  - tests/conftest.py


Configured Python path loading.

Result:

  - 3 tests passed


---

# Docker Containerization

## Dockerfile Creation

The Flask application was containerized using Docker.

Dockerfile features:

- Lightweight Python base image
- Production dependencies
- Environment configuration
- Non-root user execution
- Gunicorn production server

Base image:

  - python:3.10-slim


---

## Docker Security Practices

Implemented:

### Non-root User

Created:

  - appuser


The application runs without root privileges.

Benefits:

- Reduced container security risk
- Follows container security best practices

---

### Production Server

Instead of Flask development server, Gunicorn was used.

Gunicorn provides:

- Production WSGI server
- Better reliability
- Worker support

---

# Docker Ignore Configuration

  - Created:

    - .dockerignore

  - Excluded unnecessary files:

    - .venv/
    - pycache/
    - .pytest_cache/
    - .git/
    - .env
    - tests/

  - Benefits:

    - Smaller image size
    - Faster builds
    - Prevents unnecessary files from entering the image

---

# Docker Image Build

Created Docker image:

  - devops-kubernetes-cicd-pipeline:test


Build command:

        docker build -t devops-kubernetes-cicd-pipeline:test .  

Image was created successfully.

## Container Deployment

The Docker image was run as a container.

  - Container configuration:
       
       - APP_NAME=DevSecOps Docker App
       - APP_ENV=production
       - PORT=5000

  - Application was exposed on:

       - 5000:5000

## Container Verification

The application was tested successfully inside the running container.

  - Verified endpoints:

        /
        /health
        /ready

  - Result:

    - ✅ Application running successfully inside Docker

## Phase 3 Result

Application development and containerization were completed successfully.

  - Completed:

        ✅ Flask application created
        ✅ Configuration management implemented
        ✅ Environment variables supported
        ✅ Pytest automation added
        ✅ Docker image created
        ✅ Container deployed
        ✅ Application endpoints verified
        ✅ Production Gunicorn server configured
        ✅ Non-root container execution implemented

# Phase 4 — Container Security & Image Hardening

## Objective

The objective of Phase 4 was to improve the security of the Dockerized Flask application by reviewing the container configuration, applying security best practices, scanning the image for vulnerabilities, and creating a hardened production-ready image.

The main goals were:

- Review Docker image security
- Run container as non-root user
- Reduce unnecessary runtime dependencies
- Perform vulnerability scanning using Trivy
- Analyze and fix application-level vulnerabilities
- Rebuild and verify the final image

---

# Docker Security Improvements

The Dockerfile was reviewed and improved with security-focused practices.

Implemented:

- Lightweight base image
- Non-root container execution
- Minimal runtime files
- Removed unnecessary build tools
- Production Gunicorn server
- Vulnerability scanning

---

# Docker Image Hardening

## Base Image

  - Used:
    
    - python:3.10-slim

  - Benefits:

    - Smaller image size
    - Fewer unnecessary packages
    - Reduced attack surface

--- 

## Non-Root Container Execution

  - A dedicated application user was created:

    - appuser


  - The container runs using:

        ```dockerfile
        USER appuser

  - Benefits:

    - Avoids running applications as root
    - Reduces impact if the container is compromised

## Runtime Dependency Optimization

The Docker image was optimized by removing unnecessary package-management tools after installing dependencies.

  - Removed:

    - pip
    - setuptools
    - wheel

  - Reason:

    - These tools are required during dependency installation but are not needed during application runtime.

    - Removing them reduces unnecessary attack surface. 

## Docker Image Versions

Different image versions were created during the hardening process:

              Image	                     Purpose
        devsecops-flask-app:1.0	    Initial Docker image
        devsecops-flask-app:1.1	    Image after removing unnecessary runtime tools
        devsecops-flask-app:1.2	    Final rebuilt and verified image       

## Trivy Vulnerability Scanning

Trivy was used to scan Docker images for security vulnerabilities.

  - Scan command:

    - trivy image devsecops-flask-app:1.2

  - The scanning process helped identify vulnerabilities in:

    - Python dependencies
    - Operating system packages
    - Base image components

## Vulnerability Analysis

  - Initial findings included vulnerabilities related to:

    - pip
    - setuptools
    - wheel
    - Python packages

  - Solution:

    - Removed unnecessary Python package-management tools from the final runtime image.

  - Result:

    - Python dependency vulnerabilities: 0


## Base Image Refresh

  - The Python base image was refreshed:

     - docker pull python:3.10-slim

  - The application image was rebuilt:

     - devsecops-flask-app:1.2

  - The refreshed image was scanned again.

## OS-Level Vulnerability Handling

After hardening, remaining Trivy findings were mainly related to Debian OS/base-image packages.

  - Important decision:

    - The project did not blindly remove required system packages only to reduce the vulnerability count.

  - Reason:

    - Some packages are required by the operating system
    - Removing them could break the application
    - Security fixes must be evaluated properly

## APT Diagnostic Check

A temporary root container was used only for checking available package updates.

  - The final application container remained:

     - appuser (non-root)

       No permanent root access was added.

  - Result:

    - No additional Debian package upgrades were available from the configured repositories during verification.

## Final Container Verification

  - The final image:

     - devsecops-flask-app:1.2

       was tested successfully.

  - Verified:

        - Container starts correctly
        - Application runs as appuser
        - / endpoint works
        - /health endpoint works
        - /ready endpoint works    

## Phase 4 Security Improvements

        Implemented:

        ✅ Lightweight Python slim image
        ✅ Non-root container execution
        ✅ Removed unnecessary runtime tools
        ✅ Used Gunicorn production server
        ✅ Optimized Docker build context
        ✅ Added Trivy vulnerability scanning
        ✅ Refreshed base image
        ✅ Verified final container security


# Phase 5 — Kubernetes Deployment & Runtime Security

## Objective

The objective of Phase 5 was to deploy the hardened Flask Docker image to a local Kubernetes cluster using Kind and apply basic Kubernetes security, configuration, networking, and health-check practices.

---

## Kubernetes Environment

  - Created a dedicated Kind cluster:

        ```text
        Cluster: kind-devops-cluster
        Kubernetes: v1.34.0
        ```

  - The existing Docker Desktop Kubernetes environment was kept separate from this project.

  - The Docker image was loaded into Kind because locally built Docker images are not automatically available inside Kind nodes.

        Docker Image
            |
            ↓
        Kind Cluster
            |
            ↓
        Kubernetes Deployment


## Kubernetes Resources

Created the following resources:

        Resource	      Purpose
        Namespace	    Isolate the application
        ConfigMap	    Store application configuration
        Secret	        Store application secret
        ServiceAccount	Dedicated application identity
        Role	        Least-privilege permissions
        RoleBinding	    Bind permissions to ServiceAccount
        Deployment	    Run application replicas
        Service	        Internal application access

  - Manifests:

        kubernetes/
        ├── configmap.yaml
        ├── deployment.yaml
        ├── namespace.yaml
        ├── role.yaml
        ├── rolebinding.yaml
        ├── secret.yaml
        ├── service.yaml
        └── serviceaccount.yaml        

## Application Deployment

  - The existing image:

     - devsecops-flask-app:1.2

       was deployed with 2 replicas.

  - Final state:

    - 2/2 Pods Running
    - 0 Restarts

## Configuration

  - Application configuration was provided through a ConfigMap:

    - APP_NAME
    - APP_ENV
    - PORT

  - A Kubernetes Secret was used for:

    - APP_SECRET

  - The secret value was verified without exposing its contents.    

## Kubernetes Runtime Security

  - The application was configured to run with:

    - runAsNonRoot: true
    - runAsUser: 1000
    - runAsGroup: 1000
    - allowPrivilegeEscalation: false

  - Additional security controls:

    - Dropped all Linux capabilities
    - RuntimeDefault seccomp profile
    - Disabled automatic ServiceAccount token mounting

  - The container was verified to run as UID 1000 rather than root.  

## Resource Management

 - Configured resource requests:

    - CPU:    100m
    - Memory: 64Mi

 - Configured limits:

    - CPU:    250m
    - Memory: 128Mi

 - This prevents unrestricted resource consumption by the application.

## Health Checks

 - Configured Kubernetes probes:

        Probe	      Endpoint	       Purpose
        Liveness	  /health	    Checks application health
        Readiness	  /ready	    Checks whether the Pod can receive traffic

  - Both endpoints returned successful responses.  

## Service

  - Created an internal Kubernetes Service:

    - Name: devsecops-app
    - Type: ClusterIP
    - Port: 5000

  - The Service provided access to the application Pods and successfully discovered both replicas.

## RBAC

Implemented least-privilege RBAC.

  - The application ServiceAccount was allowed only the required access, including:

    - get → devsecops-app-config

  - Unauthorized actions such as deleting the ConfigMap or accessing another ConfigMap were denied.

## Problems Solved

            Problem	                                      Solution
        Wrong Kubernetes context	             Created a dedicated Kind cluster
        Kind not installed	                     Installed Kind v0.30.0
        Local Docker image unavailable in Kind	 Loaded image using kind load docker-image
        CreateContainerConfigError	             Verified appuser UID and configured UID/GID 1000
        wget unavailable in minimal image	     Used Service and application endpoints for testing
        Pod hostname testing failed	             Tested through the Kubernetes Service
        Need least-privilege access	             Added ServiceAccount, Role and RoleBinding

- The CreateContainerConfigError was resolved by matching the Docker appuser identity with Kubernetes runAsUser: 1000 and runAsGroup: 1000.  

## Validation

 - Final Kubernetes validation confirmed:

        Kind Cluster              ✅
        Namespace                 ✅
        Deployment                ✅
        2 Replicas                ✅
        Pods Running              ✅
        Service                   ✅
        EndpointSlice             ✅
        Application Endpoint      ✅
        Health Endpoint           ✅
        Readiness Endpoint        ✅
        ConfigMap                 ✅
        Secret                    ✅
        RBAC                      ✅
        Non-root UID 1000         ✅
        Seccomp RuntimeDefault    ✅
        Capabilities Dropped      ✅
        Manifest Validation       ✅

- The final application returned HTTP 200 for the application, health, and readiness endpoints, with both Pods running and zero restarts.

## Git

  - Phase 5 changes were committed locally with:

    - 8c5a76a feat: deploy secured Flask app to Kubernetes

## Phase 5 Result

- The hardened Flask application was successfully deployed to a two-replica Kind Kubernetes cluster with:

        Namespace isolation
        ConfigMap and Secret configuration
        Least-privilege RBAC
        Non-root execution
        Resource requests and limits
        Seccomp
        Dropped capabilities
        Liveness and readiness probes
        Internal ClusterIP Service    
---

## Phase 6 — CI/CD Automation with GitHub Actions

## Objective

- The objective of Phase 6 was to move from manually validated development and deployment toward automated CI and security validation using GitHub Actions.

- The main goal was reliable Continuous Integration first, while keeping Continuous Deployment for a later phase.

## CI Pipeline

 - The implemented pipeline follows:

        Developer Push / Pull Request
                    ↓
            GitHub Repository
                    ↓
            GitHub Actions
                    ↓
            Automated Pytest
                    ↓
            Docker Build
                    ↓
            Trivy Security Scan
                    ↓
        Kubernetes Manifest Validation
                    ↓
                Pass / Fail

- The workflows were implemented under:

        .github/workflows/
        ├── ci.yml
        ├── security.yml
        └── cd.yml

- The existing workflow structure was reused rather than creating duplicate files.

## CI Workflow

## Triggers

- The CI workflow runs on:

        push:
        branches:
            - main

        pull_request:
        branches:
            - main

- Therefore, CI executes for pushes to main and pull requests targeting main.

## Automated Testing

        The workflow:

        Checks out the repository
        Sets up Python 3.10
        Installs application dependencies
        Installs pytest
        Runs the existing test suite

- Result:

  - 3 tests passed

## Docker Build

- The CI pipeline builds the existing application Dockerfile:

     app/Dockerfile

- The image is tagged using the Git commit SHA:

      devsecops-flask-app:${{ github.sha }}

- This provides an immutable identifier associated with the source commit instead of relying on a mutable latest tag.

## Trivy Security Scan

Trivy was integrated into GitHub Actions for automated container vulnerability scanning.

- Security policy:

        Severity: HIGH, CRITICAL
        ignore-unfixed: true
        exit-code: 1

- Therefore:

        Fixed HIGH/CRITICAL vulnerabilities can fail CI.
        Unfixed vulnerabilities are ignored.
        A security-policy failure causes the workflow to fail.

- The successful Phase 6 run reported:

        Debian OS packages: 0 HIGH/CRITICAL
        Python packages:    0 HIGH/CRITICAL

## Kubernetes Manifest Validation

Kubernetes manifests were automatically validated using Kubeconform.

- The project contains:

        8 Kubernetes manifests

- Kubeconform successfully validated:

        8/8 resources

This validates Kubernetes configuration without requiring access to a live cluster.

## Why GitHub Actions Does Not Deploy to Kind

Automatic deployment from GitHub Actions to the local Kind cluster was intentionally not implemented.

        GitHub-hosted Runner
                ≠
        Developer Machine
                ↓
        Local Kind Cluster

The GitHub-hosted runner cannot directly access the Kind cluster running on the local machine.

- Therefore, Phase 6 focuses on:

        Test
        ↓
        Build
        ↓
        Security
        ↓
        Kubernetes Validation

Automatic deployment is reserved for a later CD/cloud phase.

- The existing file:

     .github/workflows/cd.yml

      was kept reserved for future Continuous Deployment.

## Problems Faced and Solutions

            Problem	                                     Solution
        Pytest unavailable in system Python	            Used the project's app/.venv
        Docker build failed from wrong directory	    Ran the build from repository root
        Trivy database update timed out	                Used existing DB temporarily; later normal update succeeded
        kubectl --dry-run=client attempted API access	Replaced with Kubeconform
        YAML lint warnings	                            Kept them as non-blocking warnings
        Newer Trivy version notice	                    Treated as informational
        GitHub runner could not access local Kind	    Limited Phase 6 to CI validation

## CI Failure Behavior

- The pipeline is designed so important failures stop CI:

        Tests Fail
            ↓
        CI Failed

        Docker Build Fails
            ↓
        CI Failed

        Trivy Security Policy Fails
            ↓
        CI Failed

        Kubernetes Validation Fails
            ↓
        CI Failed

This prevents the pipeline from reporting success when an important quality or security gate fails.        

## Phase 6 Result

- Phase 6 was completed successfully.

        GitHub Actions CI                  ✅
        Automated pytest                   ✅
        Docker build                       ✅
        Kubernetes validation              ✅
        Kubeconform                        ✅
        Trivy security scan                ✅
        HIGH/CRITICAL security gate        ✅
        GitHub CI run                      ✅
        GitHub Security run                ✅
        Git commit                         ✅
        Git push                           ✅

- Final commit:

        3ef1eff ci: add GitHub Actions CI and security workflows

The main branch was synchronized with GitHub and the Phase 6 workflows were successfully running.

---

## Phase 7 — Helm / Kubernetes Package Management

## Objective

The objective of Phase 7 was to convert the existing working Kubernetes deployment from static YAML manifests into a reusable and configurable Helm chart.

The existing Kubernetes manifests were preserved as the reference implementation.

## Why Helm Was Added

Before Phase 7, Kubernetes resources were managed through static YAML files.

- Helm introduced:

        Kubernetes packaging
        Templating
        Reusable configuration
        Release management
        Versioned upgrades
        Rollbacks

- The implemented relationship was:

        values.yaml
            ↓
        Helm Templates
            ↓
        Rendered Kubernetes YAML
            ↓
        Kubernetes Release

## Helm Chart

- Final chart:

        helm/devsecops-app/
        ├── .helmignore
        ├── Chart.yaml
        ├── values.yaml
        ├── values-dev.yaml
        ├── values-prod.yaml
        └── templates/
            ├── _helpers.tpl
            ├── configmap.yaml
            ├── deployment.yaml
            ├── role.yaml
            ├── rolebinding.yaml
            ├── secret.yaml
            ├── service.yaml
            └── serviceaccount.yaml

Namespace management was intentionally kept outside the Helm chart.        

## Configurable Values

- Helm values were used to parameterize appropriate application settings, including:

        Container image
        Image tag
        Replica count
        Container/service ports
        Application environment
        Resources
        Health probes
        Security configuration

Security defaults were kept strong rather than unnecessarily parameterizing every field.

## Kubernetes Resources

- The Helm chart represents the existing application resources:

        Resource	         Helm Template
        ConfigMap	         configmap.yaml
        Secret	             secret.yaml
        ServiceAccount	     serviceaccount.yaml
        Role	             role.yaml
        RoleBinding	         rolebinding.yaml
        Deployment	         deployment.yaml
        Service	             service.yaml

Existing security controls were preserved, including non-root execution, RBAC, resource limits, probes, dropped capabilities, disabled privilege escalation, and RuntimeDefault seccomp.

## Helm Validation

- The chart was validated using:

        helm lint
                ↓
            PASS

        helm template
                ↓
            PASS

        Kubeconform
                ↓
        7/7 resources valid

No invalid resources or validation errors were reported.

## Helm Release Lifecycle

- The Helm release was tested through the complete lifecycle:

        Install
        ↓
        Upgrade
        ↓
        Rollback

- All three operations completed successfully.

  - Helm release:

     devsecops-app-helm

  - Helm namespace:

     devsecops-helm

## Application Validation

- Final Helm deployment:

        Pods:       2/2 Running
        Restarts:   0
        Service:    ClusterIP

- Application endpoints were verified:

        /         → DevSecOps Flask Application is running
        /health   → healthy
        /ready    → ready

## Security & RBAC Validation

- Verified that:

        Non-root UID 1000          ✅
        Privilege escalation       Disabled
        Capabilities               Dropped
        Seccomp                    RuntimeDefault
        RBAC                       Least privilege

RBAC testing confirmed required ConfigMap access was allowed while unauthorized deletion was denied.

## Problems / Important Decisions

            Issue / Decision	                                       Solution
            Existing Kubernetes deployment was already working	     Preserved the original manifests
            Existing helm/ directory	                             Inspected before creating the chart
            Avoid breaking the working deployment	                 Validated Helm independently
            Namespace management	                                 Kept namespace outside the Helm chart
            Static configuration	                                 Converted appropriate settings to Helm values
            Security resources could be forgotten	                 Preserved ConfigMap, Secret, RBAC and ServiceAccount
            Phase 7 could become full CD	                         Kept scope limited to Helm packaging and release lifecycle

Phase 7 was intentionally not converted into full GitHub Actions CD.    

## Git & GitHub

- Final commit:

     4c1c4c4 feat: add Helm chart for DevSecOps application

- Final state:

        Branch:        main
        Working tree:  clean
        Remote:        GitHub
        CI:            PASS
        Security Scan: PASS

The Phase 7 changes were pushed successfully to GitHub, and the latest commit passed the existing CI and Security workflows.

## Phase 7 Result

- Phase 7 was completed successfully.

        Static Kubernetes YAML
                ↓
        Reusable Helm Chart
                ↓
        Configurable Deployment
                ↓
        Helm + Kubeconform Validation
                ↓
        Install → Upgrade → Rollback
                ↓
        Secure Working Application
                ↓
        Committed + Pushed to GitHub

---

## Phase 8 — CI/CD Automation with GitHub Actions

We’re starting Phase 8 now. I checked your project notes first.

Phase 8 is not a rebuild of Phases 1–7. We already have working CI, Security, Kubernetes, and Helm components. The goal is to inspect the current implementation first, identify what is missing, and then extend it safely.

- The target Phase 8 flow is:

        Developer
        ↓
        Git Push / Pull Request
        ↓
        GitHub Actions
        ↓
        Tests
        ↓
        Docker Build
        ↓
        Kubernetes Validation
        ↓
        Trivy Scan
        ↓
        GHCR
        ↓
        CD
        ↓
        Kind
        ↓
        Helm
        ↓
        Kubernetes
        ↓
        Deployment Verification

Your notes specifically require that we inspect before modifying anything, especially ci.yml, security.yml, and cd.yml.

## Step 1 — Inspect existing setup

- Check Git status and latest commit.
- Inspect:

        .github/workflows/ci.yml
        .github/workflows/security.yml
        .github/workflows/cd.yml

- Verify existing Helm chart.
- No changes.

## Step 2 — Analyze existing workflows

- Confirm current CI stages.
- Confirm security scanning.
- Confirm Helm/image configuration.
- Identify what Phase 8 needs to add.

## Step 3 — Configure CI image publishing

- Update CI so that after successful validation:

    - Build Docker image.
    - Tag image with commit SHA.
    - Login to GHCR using GitHub authentication.
    - Push image to:
    - ghcr.io/dibyasha-sahu/kubernetes-devsecops-pipeline
    - Never hardcode credentials.

## Step 4 — Validate CI

- Push the changes and verify GitHub Actions:

    - Python tests ✅
    - Docker build ✅
    - Kubernetes manifest validation/Kubeconform ✅
    - Trivy scan ✅
    - GHCR image push ✅

## Step 5 — Configure CD trigger

- Create/fix cd.yml using:

    - workflow_run
    - Trigger only after CI completes successfully
    - Only for main
    - Use the exact successful CI commit SHA.

## Step 6 — Prepare CD environment

- CD workflow will:

    - Checkout exact commit.
    - Install/setup Kind.
    - Setup kubectl.
    - Setup Helm.
    - Login to GHCR.
    - Configure ghcr-secret.

## Step 7 — Deploy with Helm

- Use the existing Helm chart:

   - helm/devsecops-app

- Deploy/update:

   - devsecops-app-helm

Use the exact GHCR image corresponding to the CI commit.

## Step 8 — Verify deployment

- CD must verify:

    - Helm deployment succeeds.
    - Kubernetes rollout succeeds.
    - Pods are Running.
    - Service exists.
    - Application deployment is healthy.

## Step 9 — Test complete pipeline

- Final flow:

        Git Push
        ↓
        GitHub Actions CI
        ↓
        Tests
        ↓
        Docker Build
        ↓
        Kubeconform
        ↓
        Trivy
        ↓
        Push Image → GHCR
        ↓
        Successful CI
        ↓
        CD workflow_run
        ↓
        Kind
        ↓
        GHCR Authentication
        ↓
        Helm Deploy
        ↓
        Kubernetes
        ↓
        Rollout Verification

## Step 10 — Final Phase 8 validation

- Confirm:

        CI passes ✅
        Security scan passes ✅
        Image exists in GHCR ✅
        CD automatically triggers ✅
        Exact commit image is deployed ✅
        Helm deployment succeeds ✅
        Kubernetes rollout succeeds ✅
        Git status clean ✅
        Push final changes to GitHub ✅
---

## PHASE 9 — FULL DEVSECOPS SECURITY

- Project: devops-kubernetes-cicd-pipeline
- Directory: ~/devops-kubernetes-cicd-pipeline
- GHCR: ghcr.io/RsSubhamMohanty/devops-kubernetes-cicd-pipeline

Phase 9 adds layered security to the working Phase 8 CI/CD pipeline.

## Step 1 — Inspect Existing CI/Security

- Check:

        .github/workflows/ci.yml
        .github/workflows/security.yml
        .github/workflows/cd.yml

Also check the current Git status and existing Trivy implementation.

Goal: understand what already works before modifying anything.

## Step 2 — Add Semgrep

- Create:

     .semgrep.yml

Use Semgrep for SAST — Static Application Security Testing.

- Add the project-specific Python security rule for:

        eval()
        exec()
        compile()

The project notes specify the custom rule as python-security-audit with WARNING severity.

Add Semgrep to CI.

## Step 3 — Test Semgrep

- Run:

        Broad Semgrep scan
        +
        Custom Semgrep scan

- Expected:

      0 findings

If the Flask 0.0.0.0 finding appears, use a targeted nosemgrep suppression, not a global Semgrep disable, because the binding is intentional for the Kubernetes architecture.

## Step 4 — Add Gitleaks

- Create:

     .gitleaks.toml

- Purpose:

     Secret Detection

- Detect things such as:

        AWS credentials
        API keys
        tokens
        passwords
        private credentials

Add Gitleaks to CI.

## Step 5 — Test Gitleaks

- Perform two tests:

        Clean repository → PASS
        Fake AWS-style credential → Detection

Use only fake/test credentials.

The project notes use the AWS Access Key pattern:

       AKIA[0-9A-Z]{16}

and confirm that Gitleaks successfully detected the test credential.

## Step 6 — Add OWASP Dependency-Check

- Purpose:

       SCA — Software Composition Analysis

Scan the application's Python dependencies.

Add Dependency-Check to CI.

- Expected result:

        No vulnerabilities

A feed/cache warning can occur and must be distinguished from an actual vulnerability failure.

## Step 7 — Test Dependency-Check

- Verify:

        Dependency scan executes
                ↓
        Dependencies analyzed
                ↓
        Vulnerability result checked

Do not treat a feed/cache warning automatically as a vulnerability.

## Step 8 — Strengthen Existing Trivy

Trivy already exists from the previous phase.

Do not create another unrelated Trivy workflow.

- Verify/enforce:

        Docker image
        ↓
        Trivy
        ↓
        Security threshold
        ↓
        PASS → continue
        FAIL → stop

The purpose is to make Trivy a proper security gate rather than simply producing a report.

## Step 9 — Add Checkov

- Purpose:

        IaC Security

Scan the relevant infrastructure/configuration instead of blindly scanning every file.

Target areas can include the Terraform/Kubernetes-related configuration.

- Expected architecture:

        Infrastructure / Configuration
                ↓
            Checkov
                ↓
        Security Findings
                ↓
            Security Gate

## Step 10 — Test Checkov

Run Checkov.

Fix genuine security findings.

Do not simply disable the scanner.

- The final project notes include fixes involving:

        image digest
        NetworkPolicy
        unused Secret
        Kubernetes hardening

## Step 11 — Add Kubescape

- Purpose:

        Kubernetes Security

Scan the actual Kubernetes configuration.

- Potential targets:

        Kubernetes manifests
        Helm-rendered manifests
        Kubernetes configuration

Do not blindly modify Helm templates before understanding the existing chart.

## Step 12 — Test Kubescape

Run Kubescape against the appropriate Kubernetes/Helm-rendered configuration.

If the raw configuration produces findings, investigate them.

- The final project result used the rendered Helm manifest, which achieved:

        20/20
        100%

- instead of the initial raw scan result of:

        18/20
        90%

## Step 13 — Kubernetes & Container Hardening

Strengthen the workload security configuration.

- Target:

        Non-root UID/GID
        Read-only root filesystem
        No privilege escalation
        Drop ALL capabilities
        RuntimeDefault seccomp
        Disable service-account token
        NetworkPolicy

The final configuration used UID/GID 10001 and these hardening controls.

## Step 14 — Fix Runtime Compatibility

Security hardening can break applications.

- If:

        readOnlyRootFilesystem

causes Gunicorn/runtime failures:

- Use:

        emptyDir → /tmp

and configure Gunicorn to use /tmp for temporary/control files.

This preserves the security control instead of removing it.

## Step 15 — Immutable Image Deployment

Move deployment toward the exact image generated by CI.

- Use:

        GHCR image
            ↓
        SHA256 digest
            ↓
        Helm
            ↓
        Kubernetes

This ensures deployment references an immutable image rather than relying only on a mutable tag.

## Step 16 — Combine All Security Gates

- Final CI concept:

        Tests
        ↓
        Semgrep
        ↓
        Dependency-Check
        ↓
        Gitleaks
        ↓
        Kubernetes Validation
        ↓
        Checkov
        ↓
        Kubescape
        ↓
        Trivy
        ↓
        Docker Build
        ↓
        GHCR

- A required security failure should stop the pipeline:

        Security Failure
            ↓
        CI FAIL ❌
            ↓
        No GHCR publish
            ↓
        No deployment

Successful checks allow the pipeline to continue.

## Step 17 — Test Security Failure

Intentionally create controlled test failures one at a time.

- Examples:

        Semgrep finding
        Gitleaks secret
        Dependency vulnerability
        Trivy vulnerability
        Checkov finding
        Kubescape finding

- Verify:

        Finding
        ↓
        Security Gate FAIL
        ↓
        CI FAIL
        ↓
        Image NOT published
        ↓
        CD NOT deployed

        Then restore the repository.

## Step 18 — Run Complete CI

- Final successful flow:

        Code Push
        ↓
        Tests
        ↓
        Semgrep
        ↓
        Dependency-Check
        ↓
        Gitleaks
        ↓
        Kubeconform
        ↓
        Checkov
        ↓
        Kubescape
        ↓
        Trivy
        ↓
        Docker Build
        ↓
        GHCR Publish

All required gates must pass.

## Step 19 — Verify CD

- After successful CI:

        CI Success
        ↓
        CD workflow_run
        ↓
        Exact Commit
        ↓
        GHCR Authentication
        ↓
        Helm
        ↓
        Kubernetes

Verify that the existing Phase 8 CD still works and has not been broken by the new security gates.

## Step 20 — Verify Kubernetes

- Check:

        kubectl get pods
        kubectl get service
        kubectl rollout status deployment/<deployment-name>

- Verify:

        Pods Running
        Service available
        Rollout successful
        Security configuration active
        Step 21 — Final Phase 9 Validation

## Phase 9 is complete only when:

        SAST                         ✅
        SCA                          ✅
        Secret Scanning              ✅
        Container Scanning           ✅
        IaC Scanning                 ✅
        Kubernetes Scanning          ✅
        Container Hardening          ✅
        Kubernetes Hardening         ✅
        NetworkPolicy                ✅
        Image Digest                 ✅
        Security Gates               ✅
        GHCR Publishing              ✅
        Helm Deployment              ✅
        Kubernetes Deployment        ✅
        Rollout Verification         ✅

## Final Phase 9 Architecture

                        DEVELOPER
                        │
                        ▼
                        Git Push
                        │
                        ▼
                    GitHub Actions
                        │
                ┌───────┴────────┐
                ▼                ▼
            Tests             Security
                                Gates
                                 │
        ┌────────────────────────┼────────────────────────┐
        │            │           │          │             │
        ▼            ▼           ▼          ▼             ▼
        Semgrep    Dependency   Gitleaks   Checkov      Kubescape
        SAST       Check          │         IaC          K8s
                                    │
                                    ▼
                                  Trivy
                             Container Scan
                                    │
                                    ▼
                              Security PASS
                                    │
                                    ▼
                              Docker Build
                                    │
                                    ▼
                                   GHCR
                                    │
                                    ▼
                                   CD
                                    │
                                    ▼
                                  Helm
                                    │
                                    ▼
                                Kubernetes
                                    │
                                    ▼
                              Rollout Verify

---

## Phase 10 — Monitoring & Observability

## Goal

Add monitoring to the existing DevSecOps project using Prometheus + Grafana and monitor both the Flask application and Kubernetes environment.

- Phase 10 Steps

       - Inspect existing project and Kubernetes state
       - Add Flask /metrics endpoint
       - Test application metrics
       - Build and deploy updated Docker image
       - Configure Prometheus
       - Verify Prometheus scraping
       - Add/verify Kubernetes metrics
       - Install Grafana
       - Connect Grafana → Prometheus
       - Create monitoring dashboard
       - Generate real application traffic
       - Verify metrics in Prometheus/Grafana
       - Test monitoring after pod restart/rollout
       - Verify CI/CD + Phase 9 security remain working
       - Commit, push, and complete Phase 10 validation

## Architecture

                 GitHub
                    │
                    ▼
              Existing CI/CD
                    │
                    ▼
                  GHCR
                    │
                    ▼
            Kind Kubernetes
                    │
             ┌──────┴──────┐
             │             │
             ▼             ▼
        Flask App      K8s Resources
             │             │
         /metrics      K8s Metrics
             │             │
             └──────┬──────┘
                    ▼
               Prometheus
                    │
                    ▼
                 Grafana
                    │
                    ▼
             Monitoring Dashboard

---

## Phase 11 — Reliability & Self-Healing

Phase 11 focuses on testing Kubernetes reliability and recovery on the existing project.

- Steps

   - Verify healthy baseline
   - Test pod self-healing
   - Test failed image deployment
   - Verify ErrImagePull / ImagePullBackOff
   - Test Helm rollback
   - Verify application recovery
   - Test scaling 2 → 0
   - Verify monitoring detects up = 0
   - Scale application back 0 → 2
   - Verify up = 1 and healthy pods
   - Verify Grafana monitoring
   - Run final reliability validation
   - Commit and push Phase 11 changes

## Architecture

                 Kubernetes
                     │
              ┌──────┴──────┐
              │             │
              ▼             ▼
        Flask Deployment   Helm
              │              │
         ┌────┴────┐         │
         │         │         │
       Pod 1      Pod 2 ◄────┘
         │         │
         └────┬────┘
              │
              ▼
          Prometheus
              │
              ▼
           Grafana

Failure → Kubernetes detects → Recovery/Rollback → Healthy State