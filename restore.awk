BEGIN { done = 0 }
END { }


/^@@/ {
	if( xsum != sum) xsum = $2
	else done = 1
## 	cmd = sprintf("%s/restore %s >> /tmp/kn2.log", lib, xsum)
## 	system(cmd)
}

done == 1 { next }

$1 == "d" && $2 == "c" {
## 	$1 = ""; $2 = "";
## 	gsub("  ", "", $0)
	sub("^d c ", "", $0)
	cmd = sprintf("mkdir \'%s\'", $0)
	system(cmd)
}

$1 == "b" && $2 == "c" {
	## print restore binary file
## 	$1 = ""; $2 = "";
## 	gsub("  ", "", $0)
	sub("^b c ", "", $0)
		cmd = sprintf("tar xzvf .kn2/%s.v/\'%s.z\'", xsum, $0)
		system(cmd)
}

$1 == "f" && $2 == "c" {
## 	$1 = ""; $2 = "";
## 	gsub("  ", "", $0)
	sub("^f c ", "", $0)
		cmd = sprintf("cat .kn2/%s.v/\'%s.p\' | ed \'%s\'", xsum, $0, $0)
		system(cmd)
}


$1 == "f" && $2 == "d" {
## 	$1 = ""; $2 = "";
## 	gsub("  ", "", $0)
	sub("^f d ", "", $0)
		cmd = sprintf("rm \'%s\'", $0)
		system(cmd)
}

$1 == "d" && $2 == "d" {
## 	$1 = ""; $2 = "";
## 	gsub("  ", "", $0)
	sub("^d d ", "", $0)
		cmd = sprintf("rmdir \'%s\'", $0)
		system(cmd)
}

