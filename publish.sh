#!/bin/sh
# change branch
git checkout gh-pages
# synch gh-pages
git rebase master
# publish
git push origin gh-pages
# switch back to master
git checkout master
