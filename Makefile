SHELL := /bin/bash
STACK_NAME := acm-cert
ASSETS_BUCKET := cfn-assets-repository-publicassetsbucket-lyi1yv8zzwxh
VERSION := 1.0.0

publish: template.yaml
	aws s3 cp $< s3://$(ASSETS_BUCKET)/$(STACK_NAME)-$(VERSION).yaml

tag:
	git tag -a v$(VERSION) -m "Release $(VERSION)"

release: tag
	git push origin v$(VERSION)
