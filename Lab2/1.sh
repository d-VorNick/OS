!#bin/bash
processes=$(ps -u user -o pid,command | awk '{print $1" "$2}')
count=$(echo "$processes" | wc -l)
let count--
echo "Col-vo processov: $count"
echo "$processes"