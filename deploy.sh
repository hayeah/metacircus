DEPLOY_DIR=./deploy
REPO=git@github.com:hayeah/metacircus.git

[ -d "$DEPLOY_DIR" ] || mkdir $DEPLOY_DIR
rsync --delete --exclude ".git" -Pa  _site/ $DEPLOY_DIR

cd $DEPLOY_DIR
git init
git add -A .
git commit -m "deploy at `date`" > /dev/null

echo Pushing to Github
git remote remove github
git remote add github git@github.com:hayeah/metacircus.git
git push github master:gh-pages -f
