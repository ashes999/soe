#!/bin/sh
# Deletes and re-creates gh-pages. Nothing else works.
git push origin --delete gh-pages
git push origin gh-pages

