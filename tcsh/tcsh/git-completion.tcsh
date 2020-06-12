set complete = enhance
complete git "p/1/(commit branch remote merge pull push amend clone grep rebase reset bisect diff clone blame log checkout fetch status wdiff symbolic-ref reflog delete-merged)/" \
	'n/br/`git branch|cut -c 3-|xargs echo --contains`/' 'N/br/`git branch|cut -c 3-`/' \
	'n/cb/`git branch|cut -c 3-`/' \
	'n/branch/`git branch|cut -c 3-`/' 'N/branch/`git branch|cut -c 3-`/' \
	'n/co/`git branch|cut -c 3-`/' \
	'N/symbolic-ref/`git branch|cut -c 3-`/' \
	'n/merge/`git branch|cut -c 3-|xargs echo --no-ff --ff-only --squash`/' \
	'N/merge/`git branch|cut -c 3-`/' \
	'n/rebase/`git branch|cut -c 3-| xargs echo --continue --abort --onto --skip --interactive`/' \
	'N/rebase/`git branch|cut -c 3-`/' \
	'n/log/(--stat --author)/' \
	'n/lh/(--stat --author)/' \
	'n/commit/(--amend)/' \
	'n/diff/(--cached --no-prefix --color-words --name-only)/' \
	'n/pull/(--rebase --no-ff --squash)/' \
	'n/fetch/`git remote`/' \
	'n/reset/(HEAD^)/' \
	'N/reset/(HEAD^)/' \
	'n/stash/(apply list save pop clear)/' \
	'n/push/`git remote`/' 'N/push/`git branch|cut -c 3-`/' \
	'n/remote/(show add rm prune update)/' 'N/remote/`git remote`/'
