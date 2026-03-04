// TASK 1 – CREATE AND USE A SIMPLE CLASS

#include <iostream>
using namespace std;
class Student {
public:
string name;
int rollNo;
void display() {
cout << "Name: " << name << endl;
cout << "Roll No: " << rollNo << endl;
}
};
int main(){
Student s1;
s1.name =
"Ali";
s1.rollNo = 101;
s1.display();
return 0;
} 