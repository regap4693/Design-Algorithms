#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#define MAXARRAY 100
struct stud
{
       int roll;
       char name[30];
       float marks;
       };
 
void mergesort(struct stud a[], int low, int high);
 
int main(void) 
{
 struct stud list[MAXARRAY];int n;
 int i = 0;
 
 /* reading the elements form the users*/
  printf("Enter the number of students");
  scanf("%d",&n);
  printf("Enter the elements to be sorted:\n");
   for(i = 0;i < n; i++ ){
       scanf("%d,%f,%s",&list[i].roll,&list[i].marks,list[i].name);
   }
 
 /* array before mergesort */
 
 
 
 mergesort(list, 0, n - 1);
 
 /* array after mergesort */
 printf("After Mergesort:");
 for(i = 0; i < n; i++)
  printf("student no.%d => ,%d ,%f ,%s\n",i+1,list[i].roll,list[i].marks,list[i].name);
 
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
       working[i].marks=a[low + i].marks;
       strcpy(working[i].name,a[low + i].name);
       }
       
 
 merge1 = 0;
 merge2 = pivot - low + 1;
 
 for(i = 0; i < length; i++) {
  if(merge2 <= high - low)
   if(merge1 <= pivot - low)
    if(working[merge1].roll > working[merge2].roll)
     
                            {
                            a[i + low].roll = working[merge2+1].roll;
                          strcpy(a[i + low].name,working[merge2+1].name);
                            a[i+low].marks=working[merge2+1].marks;
                            merge2++;
                            }
    else
     
                            {
                            a[i + low].roll = working[merge1+1].roll;
                            strcpy(a[i + low].name,working[merge1+1].name);
                            a[i+low].marks=working[merge1+1].marks;
                            merge1++;
                            }
                            
   else
    {
                            a[i + low].roll = working[merge2+1].roll;
                            strcpy(a[i + low].name,working[merge2+1].name);
                            a[i+low].marks=working[merge2+1].marks;
                            merge2++;
                            }
  else
  {
                            a[i + low].roll = working[merge1+1].roll;
                            strcpy(a[i + low].name,working[merge1+1].name);
                            a[i+low].marks=working[merge1+1].marks;
                            merge1++;
                            }
   
 }
}
}
