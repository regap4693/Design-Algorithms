#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
 
#define MAXARRAY 100
struct stud
{
       int roll;
       char name[30];
       float sub01,sub02,sub03,sub04,total;
       
       };
 
void mergesort(struct stud a[], int low, int high);
 
int main(void) 
{
 struct stud list
 [MAXARRAY];int n;
 int i = 0;char ch;
 
 /* reading the elements form the users*/
  printf("Enter the number of students");
  scanf("%d",&n);
  printf("Enter the the rollno. name marks of 4 subjects:\n");
   for(i = 0;i < n; i++ ){
         printf("\nstudent no. %d",i+1);
       scanf("%d",&list[i].roll);
       scanf("%c",&ch);
       scanf("%s",list[i].name);
       scanf("%f,%f,%f,%f",&list[i].sub01,&list[i].sub02,&list[i].sub03,&list[i].sub04);
       list[i].total=list[i].sub01+list[i].sub02+list[i].sub03+list[i].sub04;
   }
 
 /* array before mergesort */
 
 for(i = 0; i < n; i++)
  {
       printf("\nstudent no.%d =>roll- %d",i+1,list[i].roll);
       printf("\nname-%s",list[i].name);
       printf("\nsub1-%f,sub2-%f,sub3-%f,sub4-%f,total-%f",list[i].sub01,list[i].sub02,list[i].sub03,list[i].sub04,list[i].total);
       }
 
 mergesort(list, 0, n - 1);
 
 /* array after mergesort */
 printf("\nAfter Mergesort:");
 for(i = 0; i < n; i++)
  {
       printf("\nstudent no.%d =>roll- %d",i+1,list[i].roll);
       printf("\nname-%s",list[i].name);
       printf("\nsub1-%f,sub2-%f,sub3-%f,sub4-%f,total-%f",list[i].sub01,list[i].sub02,list[i].sub03,list[i].sub04,list[i].total);
       }
       
 
 printf("\n");
 system("PAUSE");
 return 0;
}
 
void mergesort(struct stud a[], int low, int high) {
 int i = 0;
 int length = high - low + 1;
 int pivot  = 0;
 int merge1 = 0;
 int merge2 = 0;
 struct stud working[length];
 
 if(low != high)
 { 
 pivot  = (low + high) / 2;
 
 mergesort(a, low, pivot);
 mergesort(a, pivot + 1, high);
  
 for(i = 0; i < length; i++)
  {
       working[i].roll = a[low + i].roll;
       strcpy(working[i].name,a[low+i].name);
       working[i].sub01=a[low+i].sub01;
       working[i].sub02=a[low+i].sub02;
       working[i].sub03=a[low+i].sub03;
       working[i].sub04=a[low+i].sub04;       
       working[i].total=a[low+i].total;
       }
       
 
 merge1 = 0;
 merge2 = pivot - low + 1;
 
 for(i = 0; i < length; i++) {
  if(merge2 <= high - low)
  {
   if(merge1 <= pivot - low)
{
                 if(working[merge1].roll > working[merge2].roll)
     
                            
                            {a[i + low].roll = working[merge2].roll;
                          merge2++;
                          }
                            
                            
    else
     
                            
                            {a[i + low].roll = working[merge1].roll;
                            merge1++;
                            }
}
                            
                            
                            
   else                     { a[i + low].roll = working[merge2].roll;
                            merge2++;
                            }
                            }
                            
                            
  else
  
                            {a[i + low].roll = working[merge1].roll;
                           merge1++;
                           }
                            
                            
                            
   
 }
}
}


