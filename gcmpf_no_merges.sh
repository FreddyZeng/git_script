echo -e "\n"
echo "select commit:"$1""
echo -e "\n"

git log $1 --first-parent --no-merges --pretty="%C(Yellow)%h %C(Cyan)%an: %C(reset)%s %C(reset)%ad" | awk -F ' ' '{$1="";print $0}' > /tmp/select_commit
git log HEAD --first-parent --no-merges --pretty="%C(Yellow)%h %C(Cyan)%an: %C(reset)%s %C(reset)%ad" | awk -F ' ' '{$1="";print $0}' > /tmp/head_commit

echo "only in select commit:"

grep -vxfF /tmp/head_commit /tmp/select_commit

echo "only in HEAD commit:"

grep -vxfF /tmp/select_commit /tmp/head_commit