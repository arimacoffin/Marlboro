#!bin/bash

verif(){
	cookie=$(curl -s --cookie-jar cookie.txt 'https://marlboro.id' -H 'authority: www.marlboro.id' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: none' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: en-US,en;q=0.9,id;q=0.8,ja;q=0.7,ko;q=0.6' --compressed)
	veriff=$(curl -s --cookie cookie.txt ''$1'' -H 'authority: www.marlboro.id' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: none' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: en-US,en;q=0.9,id;q=0.8,ja;q=0.7,ko;q=0.6' --compressed)
	grab=$(echo $veriff | grep -c "Terima kasih")
	if [[ $grab=~"1" ]]; then
		printf "VERIFIKASI BERHASIL $1 \n"
	fi
}
echo ""
echo "List In This Directory : "
ls
echo -n "Masukan File List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi

    x=$(awk '{ print $1 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emailgblg=($x)'
	for (( i = 0; i < "${#emailgblg[@]}"; i++ )); do
    emailna="${emailgblg[$i]}"
    verif $emailna
done
