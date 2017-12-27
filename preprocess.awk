BEGIN{first=1}
{
 if (first) {
	first = 0
 } else {
	 n = split($0, a, /,/)
	 m = split($0, b, /: /)
	 full_description = substr($0, length(b[1]) + 3, length($0) - length(b[1]) - 5) 
	 l = split(full_description, c, /1./)
	 title = c[1]
	 abstract = substr(full_description, length(title) + 1)
	 gsub(/\\/, "\\\\", title)
	 gsub(/\\/, "\\\\", abstract)
	 gsub(/\"/, "", title)
	 gsub(/\"/, "", abstract)
	 id = a[1]
	 if (a[n] == 0)
		security = "NSBR"
	 else 
		security = "SBR"
	 if (abstract == "")
		abstract = "SKIPPED"
	 if (title == "")
		title = "SKIPPED"
	 printf("{ \"paperAbstract\": \"%s\", \"title\": \"%s\", \"venue\" : \"%s\"}\n", abstract, title, security)
  }
}
