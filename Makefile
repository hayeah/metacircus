
DEPLOY_DIR=gh-pages

.PHONY: deploy build server

deploy: commit push

commit: build $(DEPLOY_DIR)
	cd $(DEPLOY_DIR)
	# the "--exclude" flag keeps the .git directory within deploy from being removed.
	rsync --delete --exclude ".git" -Pa  _site/ $(DEPLOY_DIR)
	cd $(DEPLOY_DIR) && git add -A . && git commit -m "commit at $$(date +%D-%H:%M:%S)"

push:
	cd $(DEPLOY_DIR) && git push origin gh-pages:gh-pages

$(DEPLOY_DIR):
	git clone git@github.com:hayeah/metacircus.git gh-pages --branch gh-pages

build:
	jekyll build

server:
	jekyll serve -w --port 5000