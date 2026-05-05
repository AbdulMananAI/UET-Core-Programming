#include <iostream>
using namespace std;
class Node {
public:
 int data;
 Node* next;
};
class CircularList {
private:
 Node* head;
public:
 CircularList()

{
 head = NULL;

}
// Destructor
 ~CircularList()

{
 if(head == NULL) return;
 Node* current = head
->next;
 while(current != head)

{
 Node* temp = current;
 current = current
->next;
 delete temp;

}
 delete head;

}
// Insert at End
 void insertAtEnd(int value)

{
 Node* newNode = new Node();
 newNode
->data = value;
 newNode
->next = NULL;
 if(head == NULL)

{
 head = newNode;
 newNode
->next = head;
 return;

}

Node* current = head;
 while(current
->next != head)

{
 current = current
->next;

}
 current->next = newNode;
 newNode->next = head;

}
 void insertAtBeginning(int value)

{
 Node* newNode = new Node();
 newNode
->data = value;
 newNode
->next = NULL;
 if(head == NULL)

{
 head = newNode;
 newNode
->next = head;
 return;

}
 Node* current = head;
 while(current
->next != head)

{
 current = current
->next;

}
 current
->next = newNode;
 newNode
->next = head;
 head = newNode;

}
 void display()

{
 if(head == NULL)

{
 cout << "List is empty" << endl;
 return;

}
 Node* current = head;
 do

{
 cout << current->data << "-> ";
 current = current
->next;
 } while(current != head);
 cout << "(back to head)" << endl;

}

 // Search
 bool search(int key)
 {
 if(head == NULL) return false;
 Node* current = head;
 do
 {
 if(current->data == key)
 return true;
 current = current->next;
 } while(current != head);
 return false;
 }


 // Delete First Node
 void deleteFirst()
 {
 if(head == NULL) return;
 if(head->next == head)
 {
 delete head;
 head = NULL;
 return;
 }
 Node* temp = head;
 Node* current = head;
 while(current->next != head)
 {
 current = current->next;
 }
 head = head->next;
 current->next = head;
 delete temp;
 }

void deleteLast()
 {
 if(head == NULL) return;
 if(head->next == head)
 {
 delete head;
 head = NULL;
 return;
 }
 Node* current = head;
 while(current->next->next != head)
 {
 current = current->next;
 }
 Node* temp = current->next;
 current->next = head;
 delete temp;
 }

 int countNodes(){
    if(head == NULL)
     cout<<"List is empty"<<endl;
    int count = 0;
    Node* current = head;
    while(current->next != head){
        count++;
        current = current->next;
    }
    return count;
    }
};
int main(){
 CircularList cl;
 cl.insertAtEnd(10);
 cl.insertAtEnd(20);
 cl.insertAtEnd(30);
 cl.insertAtBeginning(5);
 cout << "List: ";
 cl.display();
 cout << "Search 20: ";
 cout << (cl.search(20) ? "Found" : "Not Found") << endl;
 cout << "Delete First:" << endl;
 cl.deleteFirst();
 cl.display();
 cout << "Delete Last:" << endl;
 cl.deleteLast();
 cl.display();


 cout<<endl;
 cout<<"Task 1"<<endl;
  CircularList cl2;
 cl2.insertAtBeginning(100);
 cl2.insertAtEnd(200);
 cl2.insertAtEnd(300);
 cl2.insertAtBeginning(400);
 cl2.insertAtEnd(500);
 cl2.insertAtEnd(600);
 cl2.insertAtEnd(700);
 cout << "List: ";
 cl2.display();


 cout<<endl;
 cout<<"Task 2"<<endl;
 cl2.countNodes();
 cout<<"Number of nodes in the list: "<<cl2.countNodes()<<endl;

 cout<<endl;
 cout<<"Task 3"<<endl;
 cout << (cl2.search(500) ? "Found" : "Not Found") << endl;
 cout << (cl2.search(1000) ? "Found" : "Not Found") << endl;
}
