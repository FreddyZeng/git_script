echo -e "\n"
echo "select commit:"$1""
echo -e "\n"

git log $1 --pretty="%C(Yellow)%h %C(Cyan)%an: %C(reset)%s %C(reset)%ad" | awk -F ' ' '{print $0}' > /tmp/select_commit
git log HEAD --pretty="%C(Yellow)%h %C(Cyan)%an: %C(reset)%s %C(reset)%ad" | awk -F ' ' '{print $0}' > /tmp/head_commit

echo -e "\n"
echo "only in select commit:"
echo -e "\n"

grep -vxf /tmp/head_commit /tmp/select_commit

echo -e "\n"
echo "only in HEAD commit:"
echo -e "\n"

grep -vxf /tmp/select_commit /tmp/head_commit