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

Phase 7 — Terraform + Floci

Objective

Phase 7 implements the Infrastructure as Code layer using Terraform and Floci.

Terraform is used to define and manage AWS-compatible infrastructure as code.

Floci provides the local AWS-compatible development environment used by this project instead of a real AWS account.

The objective of this phase is to demonstrate:

Infrastructure as Code

Terraform provider configuration

Terraform variables

Reusable Terraform modules

Infrastructure state management

Infrastructure lifecycle management

Security scanning with Checkov

AWS-compatible local infrastructure testing

Infrastructure verification using AWS-compatible CLI commands

Terraform plan and apply validation

Idempotency verification

Safe infrastructure cleanup procedures


Phase 7 Architecture

The infrastructure workflow is:

Terraform
    ↓
AWS Provider
    ↓
Floci
    ↓
AWS-compatible Local Infrastructure
    ├── S3
    │   ├── Versioning
    │   ├── Lifecycle Configuration
    │   └── Public Access Blocking
    │
    └── IAM
        └── IAM Role

Floci is not being presented as production AWS infrastructure.

The purpose of Floci is to provide an AWS-compatible local development environment where Terraform workflows can be tested without using a real AWS account.


Why Terraform

Terraform provides declarative Infrastructure as Code.

Instead of manually creating cloud resources, the desired infrastructure is defined in Terraform configuration files.

Terraform then compares the configuration with its state and the infrastructure environment and determines the required changes.

The main Terraform lifecycle used in this phase is:

terraform init
    ↓
terraform fmt
    ↓
terraform validate
    ↓
terraform plan
    ↓
terraform apply
    ↓
Infrastructure verification
    ↓
terraform plan
    ↓
No changes


Why Floci

This project does not use a real AWS account.

Floci provides an AWS-compatible local environment that allows AWS-related Terraform workflows to be demonstrated locally.

The project therefore uses:

Terraform → Floci → AWS-compatible Local Infrastructure

The project does not claim that Floci is equivalent to production AWS.

AWS service compatibility is checked before implementation, and unsupported or partially supported functionality is documented rather than hidden.


Terraform Provider Configuration

The Terraform AWS provider is configured to communicate with the local Floci endpoint.

The project uses the HashiCorp AWS provider with the 6.x provider series.

The configured AWS-compatible environment uses:

Region: us-east-1

Access key: test

Secret key: test

Floci endpoint: http://127.0.0.1:4566

The provider disables AWS-specific validation and metadata checks that are unnecessary for the local Floci environment.

S3 path-style addressing is enabled because it is required for reliable local S3 compatibility.

The Terraform provider endpoints used by this phase are:

S3 → http://127.0.0.1:4566

IAM → http://127.0.0.1:4566


Terraform Version and Provider Locking

Terraform requires version 1.6.0 or newer.

The AWS provider is constrained to the 6.x series.

Terraform provider dependency information is stored in:

terraform/.terraform.lock.hcl

The lock file is retained so provider dependency resolution remains reproducible.

The Terraform and AWS provider versions were tested against the local Floci environment before the final implementation was selected.


Terraform Variables

The root Terraform configuration defines the following variables:

aws_region

environment

s3_bucket_name

iam_role_name

The variables allow resource names and environment information to be supplied without hard-coding the values throughout the module configuration.

The project-specific values are stored in:

terraform/terraform.tfvars

An example configuration is provided in:

terraform/terraform.tfvars.example


Terraform Module Architecture

The Terraform configuration uses reusable modules where they provide a clear separation of responsibility.

Current modules:

terraform/modules/storage/

terraform/modules/iam/


Storage Module

The storage module manages the Terraform-controlled S3 bucket.

The module contains:

terraform/modules/storage/main.tf

terraform/modules/storage/variables.tf

terraform/modules/storage/outputs.tf


IAM Module

The IAM module manages the Terraform-controlled IAM role.

The module contains:

terraform/modules/iam/main.tf

terraform/modules/iam/variables.tf

terraform/modules/iam/outputs.tf


S3 Infrastructure

The storage module creates one Terraform-managed S3 bucket.

The bucket name is supplied through the root variable:

s3_bucket_name

The bucket is configured with security and lifecycle controls.


S3 Versioning

S3 versioning is enabled.

Versioning allows multiple versions of objects to be retained rather than immediately replacing previous object versions.

Terraform manages this through the S3 bucket versioning resource.


S3 Public Access Blocking

All four S3 public-access-block controls are enabled:

BlockPublicAcls

IgnorePublicAcls

BlockPublicPolicy

RestrictPublicBuckets

This prevents the Terraform-managed bucket from being configured for public access through common S3 public-access mechanisms.


S3 Lifecycle Configuration

A lifecycle configuration is managed by Terraform.

The current lifecycle rule:

Rule ID: terraform-managed-lifecycle-test

Status: Enabled

Object expiration: 365 days

Incomplete multipart upload cleanup: 7 days

The lifecycle rule is intentionally managed without a non-empty object prefix because the Checkov lifecycle validation rejected the earlier filtered configuration.

The final configuration therefore uses an unfiltered lifecycle rule.


IAM Infrastructure

The IAM module creates one Terraform-managed IAM role.

The role name is supplied through:

iam_role_name

The role contains an assume-role trust policy for the local Floci AWS-compatible account.

The current local account identifier is:

000000000000

The resulting role ARN follows the local AWS-compatible format:

arn:aws:iam::000000000000:role/<role-name>

The IAM trust configuration is documented as a local Floci implementation detail and is not presented as a production IAM trust design.


Terraform State

Terraform state is maintained in the Terraform working directory.

The current state files are:

terraform/terraform.tfstate

terraform/terraform.tfstate.backup

The state records the infrastructure Terraform manages.

The final Terraform state contains five managed resources:

module.iam.aws_iam_role.this

module.storage.aws_s3_bucket.this

module.storage.aws_s3_bucket_lifecycle_configuration.this

module.storage.aws_s3_bucket_public_access_block.this

module.storage.aws_s3_bucket_versioning.this

Terraform state must not be treated as disposable information while resources are being managed because Terraform uses it to determine the relationship between configuration and infrastructure.


Terraform Lifecycle Verification

The following Terraform workflow was completed successfully:

terraform fmt -recursive

terraform init

terraform validate

terraform plan

terraform apply

After the infrastructure was applied, Terraform was run again with:

terraform plan

The resulting plan reported:

No changes. Your infrastructure matches the configuration.

This confirms Terraform idempotency for the current configuration.

Idempotency means that repeatedly applying the same configuration does not continuously create or modify resources when the infrastructure already matches the desired state.


Floci Compatibility Testing

Before the final Terraform implementation was selected, Terraform-to-Floci compatibility was tested using the HashiCorp AWS provider 6.x series.

The compatibility test covered:

Terraform initialization

Provider installation

Terraform validation

Terraform planning

Terraform apply

Terraform state management

AWS-compatible CLI verification

Terraform destruction

Post-destruction verification

Temporary S3 compatibility tests successfully demonstrated the Terraform lifecycle:

init → validate → plan → apply → verify → destroy

The temporary compatibility resources were removed after testing.


AWS-Compatible CLI Verification

The resulting Floci infrastructure was independently verified using AWS-compatible CLI commands.

The verification confirmed:

The expected S3 bucket exists.

The expected IAM role exists.

S3 versioning is enabled.

S3 public-access blocking is enabled.

The S3 lifecycle configuration exists and is enabled.

The IAM role ARN matches the Terraform output.

The infrastructure returned by the CLI matches the Terraform-managed configuration.


Checkov Security Scanning

Checkov is used to scan the Terraform Infrastructure as Code configuration for security and compliance issues.

The final Checkov configuration is stored in:

terraform/.checkov.yaml

The configured Checkov result is:

17 passed

0 failed

5 intentionally skipped


Deliberate Checkov Exceptions

Five Checkov checks are intentionally excluded from the local Floci Terraform scan.

They are documented rather than suppressed without explanation.

CKV_AWS_61

This check concerns IAM assume-role trust configuration.

The current implementation uses the local Floci account/root principal required by the deliberately simple local IAM role design.

Changing the trust policy solely to satisfy the Checkov pattern would introduce an artificial production-style principal that is not required by this local infrastructure.

The exception is therefore documented as a deliberate local-environment design decision.


CKV2_AWS_62

This check requires S3 event notifications.

S3 event notifications are not required by the current project infrastructure.

A temporary Terraform notification compatibility test was performed successfully against Floci, including creation and verification of the notification configuration.

The feature was not added to the actual project infrastructure because there is no application requirement for S3 event notifications.


CKV_AWS_18

This check requires S3 access logging.

Current Floci compatibility documentation identifies S3 access logging as not implemented.

Therefore, enabling this feature in the project would not represent a reliable current Floci capability.

The check is documented as a Floci compatibility limitation.


CKV_AWS_144

This check requires S3 cross-region replication.

Cross-region replication is not required by the current local infrastructure design.

Floci exposes S3 replication configuration operations, but current Floci documentation states that replication is configuration-only and does not actually replicate objects.

The project therefore does not add artificial replication infrastructure merely to satisfy the Checkov rule.


CKV_AWS_145

This check requires S3 KMS encryption.

The current project does not require a KMS key for its local infrastructure.

The Floci environment currently has no KMS keys or aliases configured for this project.

The project therefore does not create artificial KMS infrastructure solely to make the Checkov scan report zero skipped checks.


Checkov Configuration

The five deliberate exceptions are maintained centrally in:

terraform/.checkov.yaml

The configuration contains:

CKV_AWS_61

CKV2_AWS_62

CKV_AWS_18

CKV_AWS_144

CKV_AWS_145

Running Checkov without supplying command-line skip arguments automatically uses this configuration.

This keeps the exceptions visible and reproducible instead of hiding them in individual commands.


Floci Default Network Decision

The Floci environment already provides a default AWS-compatible network.

The project therefore does not recreate:

VPC

Subnets

Internet Gateway

Route Tables

Default Security Group

The project does not need separate Terraform-managed networking for the selected S3 and IAM infrastructure.

Recreating an already-existing default network would add unnecessary infrastructure and increase the risk of conflicts.

The existing Floci network is therefore intentionally left outside the Terraform-managed resource set.


Kubernetes and Terraform Separation

The project already uses a Kind Kubernetes cluster for the application deployment.

Terraform is not being used to recreate or automatically manage the existing Kind cluster in this phase.

This keeps responsibilities separated:

Terraform → AWS-compatible infrastructure

Kind/Kubernetes → Kubernetes cluster and workloads

Helm → Kubernetes application packaging and release management

GitHub Actions → CI/CD automation

This avoids duplicating infrastructure responsibilities and prevents Terraform from unnecessarily modifying existing Kubernetes workloads.


Errors and Problems Encountered

Several compatibility and security-scanning issues were encountered during Phase 7.

S3 Lifecycle Checkov Failure

The initial S3 lifecycle configuration used a non-empty prefix.

Checkov reported a failure for the lifecycle configuration.

The lifecycle rule was changed to an unfiltered rule.

The final configuration passed the corresponding Checkov lifecycle check.


AWS Provider S3 Logging Validation

During the temporary S3 access-logging compatibility test, the AWS provider required a target prefix.

The initial configuration did not contain the required target prefix.

The configuration was corrected by adding:

target_prefix = "logs/"

The temporary compatibility test then succeeded.

This was a compatibility test only and is not part of the final infrastructure configuration.


Floci Resource Reset

The Floci environment was recreated during the Terraform work.

Terraform state still contained the previously managed resources while the newly created Floci environment no longer contained those resources.

Terraform correctly detected that the infrastructure had changed outside Terraform and planned the resources for recreation.

The infrastructure was then successfully recreated with:

5 resources added

0 changed

0 destroyed

The final Terraform plan subsequently returned:

No changes.


AWS CLI Credential Difference

Terraform uses the credentials configured in the Terraform AWS provider.

The AWS CLI does not automatically inherit those Terraform provider settings.

For local Floci CLI testing, the following local test credentials were therefore exported when required:

AWS_ACCESS_KEY_ID=test

AWS_SECRET_ACCESS_KEY=test

AWS_DEFAULT_REGION=us-east-1

The AWS CLI was then directed to the Floci endpoint.


Wrong-Environment Bucket Check

During verification, a bucket belonging to the other project was queried against the wrong Floci environment.

The resulting NoSuchBucket response was caused by using the wrong bucket name for that environment.

No infrastructure was modified or damaged.

The correct project-specific bucket was subsequently verified against its corresponding environment.


Infrastructure Verification

The final Terraform and Floci verification confirmed:

Terraform configuration is valid.

Terraform formatting is valid.

Terraform plan is idempotent.

Terraform state contains five managed resources.

The expected S3 bucket exists.

S3 versioning is enabled.

S3 public-access blocking is enabled.

S3 lifecycle management is enabled.

The expected IAM role exists.

The IAM role ARN matches the Terraform output.

Checkov reports 17 passed and 0 failed with five documented intentional exceptions.


Safe Cleanup Procedure

Terraform-managed infrastructure can be removed using:

terraform destroy

Before destruction, the planned changes should be reviewed carefully.

The recommended workflow is:

terraform plan

Review the proposed changes.

terraform destroy

Confirm the destruction when Terraform requests approval.

After destruction, verify that the Terraform-managed S3 bucket and IAM role are no longer present in Floci.

The destroy operation should only be performed when the infrastructure is no longer required.

The current Phase 7 infrastructure remains available until deliberate cleanup is requested.


Phase 7 Verification Checklist

Terraform

✓ Terraform configuration created

✓ AWS provider configured for Floci

✓ Provider version constrained

✓ Provider lock file generated

✓ Variables implemented

✓ Storage module implemented

✓ IAM module implemented

✓ Outputs implemented

✓ Terraform state created

✓ terraform fmt completed

✓ terraform validate completed

✓ terraform plan completed

✓ terraform apply completed


Infrastructure

✓ S3 bucket created

✓ S3 versioning enabled

✓ S3 lifecycle configuration enabled

✓ S3 incomplete multipart upload cleanup configured

✓ S3 public access blocked

✓ IAM role created

✓ Terraform outputs verified


Security

✓ Checkov configured

✓ 17 Checkov checks passing

✓ Five exceptions explicitly documented

✓ No artificial infrastructure added only to make Checkov green


Compatibility

✓ Terraform AWS provider tested against Floci

✓ S3 Terraform lifecycle tested

✓ IAM Terraform lifecycle tested

✓ AWS-compatible CLI verification completed

✓ Terraform idempotency verified

✓ Floci-specific limitations documented


Design

✓ Existing Floci default network preserved

✓ Existing Kind Kubernetes cluster preserved

✓ Terraform responsibilities separated from Kubernetes responsibilities

✓ Local Floci environment clearly distinguished from production AWS


Phase 7 Status

Phase 7 — Terraform + Floci

Status: ✅ Complete

Phase 7 successfully establishes the project's Infrastructure as Code foundation using Terraform against a local AWS-compatible Floci environment.

The infrastructure is reproducible, state-managed, security-scanned, independently verified, and documented with the limitations and deliberate exceptions required by the local environment.


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
│   ├── .checkov.yaml
│   ├── .terraform.lock.hcl
│   └── modules/
│       ├── storage/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── iam/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
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

Current Phase: Phase 10 — Monitoring

Phase

Status

Phase 0 — Planning & Compatibility

✅ Complete

Phase 1 — Local Environment

✅ Complete

Phase 2 — GitHub Repository

✅ Complete

Phase 3 — Application

✅ Complete

Phase 4 — Docker

✅ Complete

Phase 5 — Kubernetes

✅ Complete

Phase 6 — Helm

✅ Complete

Phase 7 — Terraform + Floci

✅ Complete

Phase 8 — CI/CD

✅ Complete

Phase 9 — DevSecOps

✅ Complete

Phase 10 — Monitoring

✅ Complete

Phase 11 — Failure Testing & Rollback

✅ Complete

Phase 11 validated controlled failure, Kubernetes recovery, monitoring detection, and Helm rollback.

### Phase 11 Objectives

The failure and recovery workflow followed this sequence:

Healthy Application
→ Controlled Failure
→ Failure Observed
→ Kubernetes / Monitoring Detection
→ Recovery / Rollback
→ Healthy Application

### 11.1 Healthy Baseline

Before failure testing:

- Helm release: `devsecops-app-helm`
- Namespace: `devsecops-helm`
- Helm revision: `5`
- Application image: `devsecops-flask-app:1.3`
- Deployment replicas: `2`
- Application Pods: `2/2 Running`
- `/health`: `healthy`
- `/ready`: `ready`
- Prometheus target: `up = 1`
- Grafana dashboard: `DevSecOps Application Monitoring`

### 11.2 Kubernetes Pod Failure Test

A controlled Pod deletion was attempted using the Deployment's selector.

The application remained healthy and the Deployment maintained its desired replica count.

During this test, repeated direct deletion attempts against specific Pod names returned `NotFound` even though the Pod objects were subsequently observable. This anomaly was not treated as evidence of a Kubernetes self-healing failure, and repeated targeting of the same Pod was avoided.

### 11.3 Controlled Bad Image Deployment

A controlled Helm upgrade was performed using the intentionally invalid image tag:

`devsecops-flask-app:99.99.99-failure-test`

Result:

- Helm revision `6` was deployed.
- The new Pod entered `ImagePullBackOff`.
- Kubernetes Events reported `ErrImagePull` and `ImagePullBackOff`.
- The previous healthy Pods remained available during the failed rollout.
- The rollout did not successfully replace both healthy replicas.

### 11.4 Helm Rollback

The failed Helm revision was rolled back.

Rollback:

`Revision 6 → Revision 5`

Helm created revision `7` with the description:

`Rollback to 5`

After rollback:

- Image returned to `devsecops-flask-app:1.3`
- Deployment returned to `2/2`
- Application Pods became healthy
- `/health` returned `healthy`

### 11.5 Monitoring Failure Detection

The application Deployment was intentionally scaled from `2` replicas to `0`.

Observed:

- Application Pods: `0`
- Deployment: `0/0`
- Service endpoints: `<none>`
- Prometheus `up`: `0`

This demonstrated that Prometheus detected the application becoming unavailable.

### 11.6 Monitoring Recovery

The application Deployment was restored from `0` to `2` replicas.

Observed:

- Deployment: `2/2`
- Application Pods: `2/2 Running`
- Service endpoints: `2`
- Application `/health`: `healthy`
- Prometheus `up`: `1`

This demonstrated recovery of both the application and monitoring target.

### 11.7 Final Phase 11 State

Final verified state:

- Helm status: `deployed`
- Helm revision: `7`
- Image: `devsecops-flask-app:1.3`
- Replicas: `2`
- Application health: `healthy`
- Prometheus target: `up = 1`
- Grafana: operational
- Grafana dashboard: `DevSecOps Application Monitoring`

### Phase 11 Result

Phase 11 successfully demonstrated:

- Controlled failure testing
- Kubernetes recovery behavior
- Controlled bad-image deployment
- `ErrImagePull`
- `ImagePullBackOff`
- Helm rollback
- Prometheus failure detection
- Application recovery
- Monitoring recovery
- Final healthy state

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