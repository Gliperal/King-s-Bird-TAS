CATEGORY=$1
if [[ -z "$CATEGORY" ]]
then
	CATEGORY='Any%.txt'
fi
FILES=$(grep '^\w' "$CATEGORY" | sort | uniq)
RERECORDS=$(grep -hoP '(?<=rerecords=")\d*(?=".*)' $FILES)
echo "$RERECORDS" | awk '{s+=$1} END {print s}'
