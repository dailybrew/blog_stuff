#!/bin/bash

BLOG_PATH=/Users/colonel/Documents/blog/hexo
PENDING=$BLOG_PATH/source/_drafts
PUBLISHED=$BLOG_PATH/source/_posts

## IF NEW ARTICLES FOUND
cd $PENDING
if [ "$(ls -A $1)" ]; then
	## REMOVE SPACES
	for post in *; do mv "$post" `echo $post | tr ' ' '_'` ; done
		## LIST OF NEW ARTICLES
		new_articles=$(ls ${PENDING})
		## PUBLISH ARTICLES BY MOVING THEM TO THE SOURCE FOLDER
		for post in $new_articles
		do
			## -- here -- > 
			cd $BLOG_PATH
			hexo new $post && mv $PENDING/$post $PUBLISHED/$post
		done
else 
    echo "Nothing to publish"
fi





