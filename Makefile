# Copyright (c) 2021 Red Hat, Inc.
# Copyright Contributors to the Open Cluster Management project

SHELL = /bin/bash
STABLE_BUILD_DIR = stable
CHART_NAME ?= stable/insights-chart
VERSION := $(shell cat COMPONENT_VERSION)


default::
	@echo "Build Harness Bootstrapped"

init::
	curl -fksSL https://storage.googleapis.com/kubernetes-helm/helm-v2.14.1-linux-amd64.tar.gz | sudo tar --strip-components=1 -xvz -C /usr/local/bin/ linux-amd64/helm
	helm init --stable-repo-url https://charts.helm.sh/stable -c

lint:
	@mkdir -p $(STABLE_BUILD_DIR)
	helm lint $(CHART_NAME)

build:
	@echo "CHART_NAME: $(CHART_NAME)"
	@echo "CHART_VERSION: $(VERSION)"
	helm package  --version $(VERSION) $(CHART_NAME)  -d $(STABLE_BUILD_DIR)

build-local:
	helm package  $(CHART_NAME) -d $(STABLE_BUILD_DIR)

test:
	helm install insights stable/insights-chart --dry-run

