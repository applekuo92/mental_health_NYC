from __future__ import print_function
log1 = open("/Users/jchazin/Columbia/Capstone/mental_health_NYC/depress_output.txt", "w")
log2 = open("/Users/jchazin/Columbia/Capstone/mental_health_NYC/other_output.txt", "w")

dep = range(781)
other = range(824)

## create depress_output.txt
for corp in dep:
	print('<comment date-time="2011-08-15 03:36 PM EDT" parent-url="1" parent-id="1" url="2">',file = log1)
	print("<user>dep_corpus_%d</user>" % dep[corp], file = log1)
	direc = "/Users/jchazin/Columbia/Capstone/mental_health_NYC/depress_corpus/corpus_%d" % corp
	x_file = open(direc)
	print("<text>", file = log1)
	for line in x_file:
		print(line,file=log1)
	print("</text>",file = log1)
	print("</comment>",file = log1)


## create other_output.txt
for corp in other:
	print('<comment date-time="2011-08-15 03:36 PM EDT" parent-url="1" parent-id="1" url="2">',file = log2)
	print("<user>dep_corpus_%d</user>" % other[corp], file = log2)
	direc = "/Users/jchazin/Columbia/Capstone/mental_health_NYC/other_corpus/corpus_%d" % corp
	x_file = open(direc)
	print("<text>", file = log2)
	for line in x_file:
		print(line,file=log2)
	print("</text>",file = log2)
	print("</comment>",file = log2)
	