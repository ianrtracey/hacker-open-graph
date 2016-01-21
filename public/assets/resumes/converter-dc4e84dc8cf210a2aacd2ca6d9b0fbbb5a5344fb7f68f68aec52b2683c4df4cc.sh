for i in *.pdf; do
	basename="${i%.*}"
	chmod 777 $i
	pdf2svg $i "$basename.svg"
	echo $res
done