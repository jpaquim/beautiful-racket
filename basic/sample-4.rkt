#lang basic
10 x = 3
20 if x > 0 then print x else 5 * 10
30 x = x - 1
40 goto 20
50 print "done"
60 print 2 < 4 rem 1
70 print 2 > 4 rem 0
80 print 2 = 4 rem 0
90 print 2 <> 4 rem 1
100 print 2 < 4 or 2 > 4 or 2 = 4 rem 1
110 print 2 < 4 and 2 > 4 and 2 = 4 rem 0
120 print not 2 > 4 or not 2 < 4 rem 1
130 if 2 < 4 then print "true" else print "false"
140 if 2 > 4 then print "true" else print "false"
150 if 2 > 4 then goto 170
160 print "not"
170 print "true"
180 if 2 < 4 then 40 + 160 else 190
190 print "not"
200 print "true"