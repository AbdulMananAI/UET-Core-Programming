#include <iostream>
using namespace std;
int main(){
    int size;
    cout<<"Enter the size of the array: ";
    cin>>size;
    int arr[size];
    for (int i=0; i<size; i++){
        cin>>arr[i];
        // cout<<arr[i]<<" ";
    }
    int max= INT_MIN;
    for (int i=0; i<size; i++){
        if (arr[i]>max){
            max=arr[i];
        }
    }
    cout<<"The maximum element in the array is: "<<max<<endl;
    int min= INT_MAX;
    for (int i=0; i<size; i++){
        if (arr[i]<min){
            min=arr[i];
        }
    }
    cout<<"The minimum element in the array is: "<<min<<endl;

    cout<<"The elements of the array in reverse order are: "<<endl;
     for (int i=size-1; i>=0; i--){
        cout<<arr[i]<<" ";
    }
    cout<<endl;
    cout<<"The elements of the array in sorted order are: "<<endl;
    for (int i=0; i<size-1; i++){
        for (int j=0; j<size-i-1; j++){
            if (arr[j]>arr[j+1]){
                int temp= arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
            }
        }
    }
    for (int i=0; i<size; i++){
        cout<<arr[i]<<" ";
    }
    cout<<endl;

    cout<<"The elements of array in unique order are: "<<endl;
    for (int i=0; i<size; i++){
        for (int j = i+1; j<size; j++){
            if (arr[i]==arr[j]){
                for (int k=j; k<size-1; k++){
                    arr[k]=arr[k+1];
                    cout<<arr[k]<<" ";
                }
                size--;
                j--;
            }
        }
    }
        for (int i=0; i<size; i++){
        cout<<arr[i]<<" ";
        }

    
}