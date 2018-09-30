You probably  never heard of the painter peer. He is not well known , much to his regret. Peer was one of the inventor of monochromy , which means that each of his painting has a single colour, but in different shades.he also believed in the use of simple geometric forms.
During his triangle period , peer drew triangle on a rectangular canvas , making sure their borders did not intersect . he would then choose a colour   ,  and fill the region. Peer would paint the outermost region (the canvas itself) with the lightest shade of colour chosen. then step by step , he would fill more inner region with a darker shade of the same colour. The image below is one of his “forms in green” paintings.
In a way the process as quite mechanical.the only thing peer considered difficult was to decide ,after drawing the triangles, how many different shades he would need. You must write a program  to do that calculation for him. Your program will have a collection of triangles as its input . it should calculate the number of different shades needed to paint the region according to the given rule.
Your program must also detect the rate times that peer  make a mistake and draw triangle that intersect. Two triangle are considered intersecting if the edges of the edges of  one triangle have at least one point in common with the edges of the other. In that case , the collection triangle is invalid.
Input
The input file contains multiple test case. The first line of each test case contains a single non negative integer n (n <=100000),which is the number of triangle in the test case.the following n lines of the test case contain the description of triangle iin the format x1,y1,x2,y2,x3,y3 where xi,yi are integer (-100000<xi,yi< 1000000)that are the coordinate of the vertices of the triangles.the three points are guaranteed not to be collinear.
 
 The last test case is followed by -1 on line by itself.
Output
For each test case, print the case number (beginning with 1) and the number of shades needed to fill the region if the test case is valid. print  the word TERRORT if the test is invalid (two or more triangles in the test case intetrsect).
Sample input                                                                                                         output for the sample input
8
8 3 8 4 7 4                                                                                                                   case 1: 5 shades 
14  13 -1  9 9 0                                                                                                           case 2: error 
1 8 7 7 4  10
5 10 11  8 13 12
9 10 11 8 13 12
2  7  9  1  10 6
5 5 5 6 8 6
 9 2 9 5 6 4 
2
0 0 1 0 0 1
2 0 1 1 1 -1
 -1
  
