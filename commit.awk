BEGIN { }
END { }

$1 == "d" && $2 == "c" {
	if(op == "add") {
	cmd = sprintf("echo \'%s\' >> .kn2/filelist", $0)
	system(cmd)
	}
}

$1 == "f" && $2 =="d" {
	if(op == "add") {
	cmd = sprintf("echo \'%s\' >> .kn2/filelist", $0)
	system(cmd)
	}
}

$1 == "b" && $2 == "d" {
	if(op == "add") {
	cmd = sprintf("echo \'%s\' >> .kn2/filelist", $0)
	system(cmd)
	}
}

$1 == "d" && $2 == "d" {
	if(op == "add") {
	cmd = sprintf("echo \'%s\' >> .kn2/filelist", $0)
	system(cmd)
	}
}


$1 == "f" && $2 == "c" {
## 	$1 = ""; $2 = ""
## 	gsub("  ", "", $0)
	sub("^f c ", "", $0)
	cmd = sprintf("%s/commit %s f %s.v \'%s\'", lib, op, xsum, $0)
	system(cmd)
##	cmd = sprintf("diff -e .kn2/b/%s %s > .kn2/%s.v/%s.p", $3, $3, xsum, $3)
##	system(cmd)
##	cmd = sprintf("echo w >> .kn2/%s.v/%s.p", xsum, $3)
##	system(cmd)
##	cmd = sprintf("cp %s .kn2/b/%s", $3, $3)
##	system(cmd)
}

$1 == "b" && $2 == "c" {
## 	$1 = ""; $2 = ""
## 	sub("  ", "", $0)
	sub("^b c ", "", $0)
	cmd = sprintf("%s/commit %s b %s.v \'%s\'", lib, op, xsum, $0)
	system(cmd)
}
