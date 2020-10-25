FLATPAK_BUILDER = flatpak-builder
BUILDER_OPTIONS = --force-clean --ccache --require-changes
TARGET_REPO = repo
MANIFEST = com.governikus.ausweisapp2.yaml
COMMAND = AusweisApp2

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build AusweisApp2 Flatpak
	@$(FLATPAK_BUILDER) $(BUILDER_OPTIONS) --repo=$(TARGET_REPO) build-dir $(MANIFEST)

run: ## Run AusweisApp2 Flatpak directly
	@$(FLATPAK_BUILDER) --run build-dir $(MANIFEST) $(COMMAND)

install: ## Install AusweisApp2 Flatpak locally
	@$(FLATPAK_BUILDER) --install --user --force-clean build-dir $(MANIFEST)

clean: ## Cleanup
	@rm -rf build-dir

.PHONY: help build run install clean
