
git config --global alias.logg 'log --pretty="%C(Yellow)%h %C(Cyan)%an: %C(reset)%s %C(reset)%ad (%C(Green)%cr%C(reset))%x09"'

# git speed http://source.technology/speed-up-git-bash-on-windows
git config --global core.preloadIndex true
git config core.fscache true
git config --global gc.auto 256

# https://stackoverflow.com/a/56877430
#git config core.ignoreStat true

gcmp() {
	~/git_script/gcmp.sh $1;
}

gcmpf() {
	~/git_script/gcmpf.sh $1;
}

gcmpf_no_merges() {
	~/git_script/gcmpf_no_merges.sh $1;
}

gitgrep() {
	git log --all -p -S $1  | grep -iE "(^commit\b|^diff\b|v-on)" -A 3 -B 3 -m $2
}

gitpulldev() {
	cur_branch=`git branch --show-current`
	git fetch && git checkout 'dev' && git pull --rebase
	git switch "$cur_branch"
	# echo "switch to $cur_branch"
}

gitpulltest() {
	cur_branch=`git branch --show-current`
	git fetch && git checkout dev && git pull --rebase && git checkout 'test' && git pull --rebase
	git switch "$cur_branch"
	# echo "switch to $cur_branch"
}

gitpullrelease() {
	cur_branch=`git branch --show-current`
	git fetch && git checkout dev && git pull --rebase && git checkout 'test' && git pull --rebase && git checkout 'release' && git pull --rebase 
	git switch "$cur_branch"
	# echo "switch to $cur_branch"
}


gitmergetodev() {
	cur_branch=`git branch --show-current`
	git fetch && git checkout 'dev' && git pull --rebase
	git merge $cur_branch
	git switch "$cur_branch"
	# echo "switch to $cur_branch"
}

gitmergetotest() {
	cur_branch=`git branch --show-current`
	git fetch && git checkout 'dev' && git pull --rebase
	git merge $cur_branch
	git checkout 'test' && git pull --rebase
	git merge $cur_branch
	git switch "$cur_branch"
	# echo "switch to $cur_branch"
}

gitmergetorelease() {
	cur_branch=`git branch --show-current`
	git fetch && git checkout 'dev' && git pull --rebase
	git merge $cur_branch
	git checkout 'test' && git pull --rebase
	git merge $cur_branch
	git checkout 'release' && git pull --rebase
	git merge $cur_branch
	git switch "$cur_branch"
	# echo "switch to $cur_branch"
}