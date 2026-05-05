#include <iostream>
using namespace std;

class Node {
public:
    int data;
    Node* prev;
    Node* next;
    Node(int value) {
        data = value;
        prev = nullptr;
        next = nullptr;
    }
};

class DoublyLinkedList {
private:
    Node* head;
    Node* tail;
public:
    DoublyLinkedList() {
        head = nullptr;
        tail = nullptr;
    }

    void insertAtBeginning(int value) {
        Node* newNode = new Node(value);
        if (head == nullptr) {
            head = tail = newNode;
        } else {
            newNode->next = head;
            head->prev = newNode;
            head = newNode;
        }
    }

    void insertAtEnd(int value) {
        Node* newNode = new Node(value);
        if (tail == nullptr) {
            head = tail = newNode;
        } else {
            tail->next = newNode;
            newNode->prev = tail;
            tail = newNode;
        }
    }

    void displayForward() {
        Node* current = head;
        cout << "Forward: ";
        while (current != nullptr) {
            cout << current->data << " ";
            current = current->next;
        }
        cout << endl;
    }

    void displayPrevPointer() {
        if (head != nullptr && head->next != nullptr) {
            Node* current = head;
            current = current->next; 
            cout << "PrevPointer Address: " << current->prev << endl;
        } else {
            cout << "No second node to display prev pointer." << endl;
        }
    }

    void displayBackward() {
        Node* current = tail;
        cout << "Backward: ";
        while (current != nullptr) {
            cout << current->data << " ";
            current = current->prev;
        }
        cout << endl;
    }

    void deleteFromBeginning() {
        if (head == nullptr) return;
        Node* temp = head;
        if (head == tail) {
            head = tail = nullptr;
        } else {
            head = head->next;
            head->prev = nullptr;
        }
        delete temp;
    }

    void deleteFromEnd() {
        if (tail == nullptr) return;
        Node* temp = tail;
        if (head == tail) {
            head = tail = nullptr;
        } else {
            tail = tail->prev;
            tail->next = nullptr;
        }
        delete temp;
    }

    void deleteByValue(int value) {
        if (head == nullptr) return;
        Node* current = head;
        while (current != nullptr && current->data != value) {
            current = current->next;
        }
        if (current == nullptr) return;
        if (current == head) deleteFromBeginning();
        else if (current == tail) deleteFromEnd();
        else {
            current->prev->next = current->next;
            current->next->prev = current->prev;
            delete current;
        }
    }

    void deletemiddle() {
        if (head == nullptr) return;

        Node* slow = head;
        Node* fast = head;

        while (fast != nullptr && fast->next != nullptr) {
            slow = slow->next;
            fast = fast->next->next;
        }
        
        if (slow->prev != nullptr) {
            slow->prev->next = slow->next;
        }
        if (slow->next != nullptr){
            slow->next->prev = slow->prev;
        } 
        if (slow == head){
           head = slow->next;
        } 
        if (slow == tail){
        tail = slow->prev;
        } 
        
        delete slow;
    }

    ~DoublyLinkedList() {
        while (head != nullptr) deleteFromBeginning();
    }
};

int main() {

    DoublyLinkedList list;
    cout << "Task 1:" << endl;
    list.insertAtBeginning(20);
    list.insertAtBeginning(10);
    list.insertAtEnd(30);
    list.insertAtEnd(40);
    list.displayForward();
    list.deleteFromBeginning();
    list.deleteFromEnd();
    list.deleteByValue(30);
    list.displayForward();


    DoublyLinkedList list2; 
    cout << "Task 2:" << endl;
    list2.insertAtEnd(5);
    list2.insertAtEnd(15);
    list2.insertAtEnd(25);
    list2.insertAtEnd(35);
    list2.displayForward();
    list2.displayBackward();

    cout << "\nTask 3:" << endl;
    list2.deleteFromBeginning();
    list2.displayForward();

    cout << "\nTask 4:" << endl;
    list2.deleteFromEnd();
    list2.displayForward();

    cout << "\nTask 5:" << endl;
    list2.insertAtBeginning(100);
    list2.displayForward();
    list2.displayPrevPointer();
     
    cout << "\nTask 6:" << endl;
    list2.deletemiddle();
    list2.displayForward();

    return 0;
}