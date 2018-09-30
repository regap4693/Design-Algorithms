void lcs_length()
{
     char str1[12],str2[15];
     m=strlen(str1);
     n=strlen(str2);
     int i,j;char c[m,n];
     for(i=0;i<m;i++)
     c[i,0]=0;
     for(j=0;j<n;j++)
     c[0,j]=0;
     for(i=0;i<m;i++)
     {
                     for(j=0;j<n;j++)
                     {
                                 if(str1[i]==str2[j])
                                 {
                                                     c[i,j]=c[i-1,j-1]+1;
                                                     b[i,j]=10;
                                                     }
                                                     else if(c[i-1,j]>=c[i,j-1])
                                                     {
                                                          c[i,j]=c[i-1,j];
                                                          b[i,j]=11;
                                                          }
                                                          else
                                                          {
                                                              c[i,j]=c[i,j-1];
                                                              b[i,j]=12;
                                                              }
                                                              }
                                                              }
                                                              }
          void print_lcs(                                                                                                                                                    
