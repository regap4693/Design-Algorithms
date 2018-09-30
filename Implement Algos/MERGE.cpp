#include <stdio.h>
#include <stdlib.h>
 
#define MAXARRAY 100
 
void mergesort(int a[], int low, int high);
 
int main(void) {
 int array[MAXARRAY],n;
 int i = 0;
 
 /* reading the elements form the users*/
  printf("Enter the number of elements to be sorted:");
  scanf("%d",&n);
  printf("Enter the elements to be sorted:\n");
   for(i = 0; i < n; i++ ){
       scanf("%d",&array[i]);
   }
 
 /* array before mergesort */
 printf("Before sorting:");
 for(i = 0; i < n; i++)
  printf(" %d", array[i]);
 
 printf("\n");
 
 mergesort(array, 0, n - 1);
 
 /* array after mergesort */
 printf("After Mergesort:");
 for(i = 0; i < n; i++)
  printf(" %d", array[i]);
 
 printf("\n");
 system("PAUSE");
 return 0;
}
 
void mergesort(int a[], int low, int high) {
 int i = 0;
 int length = high - low + 1;
 int pivot  = 0;
 int merge1 = 0;
 int merge2 = 0;
 int working[length];
 
 if(low != high)
 { 
 pivot  = (low + high) / 2;
 
 mergesort(a, low, pivot);
 mergesort(a, pivot + 1, high);
  
 for(i = 0; i < length; i++)
  working[i] = a[low + i];
 
 merge1 = 0;
 merge2 = pivot - low + 1;
 
 for(i = 0; i < length; i++) {
  if(merge2 <= high - low)
   if(merge1 <= pivot - low)
    if(working[merge1] > working[merge2])
     a[i + low] = working[merge2++];
    else
     a[i + low] = working[merge1++];
   else
    a[i + low] = working[merge2++];
  else
   a[i + low] = working[merge1++];
 }
}
}
