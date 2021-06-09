git fetch -p && for branch in `LANG=en_US git branch -vv | grep -P '\[origin/.*?: gone\]' | awk '{print $1}'`; do git branch -D $branch; done

