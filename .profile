
git config --global alias.logg 'log --pretty="%C(Yellow)%h %C(Cyan)%an: %C(reset)%s %C(reset)%ad (%C(Green)%cr%C(reset))%x09"'

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