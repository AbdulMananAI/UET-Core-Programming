#include <iostream>
using namespace std;

class Node {
public:
    int data;
    Node* next;

    Node(int value) {
        data = value;
        next = nullptr;
    }
};

class LinkedListQueue {
private:
    Node* front;
    Node* rear;

public:
    LinkedListQueue() {
        front = NULL;
        rear = NULL;
    }

bool isEmpty() {
        return front == NULL;
    }

void enqueue(int x) {
        Node* newNode = new Node(x);
        newNode->data = x;
        newNode->next = NULL;

        if (rear == NULL) {
            front = rear = newNode;
        } else {
            rear->next = newNode;
            rear = newNode;
            cout << "enqueued: " << x << endl;
        }
    }

int dequeue() {
        if (isEmpty()) {
            cout << "Queue is empty!\n";
            return -1;
        }
        Node* temp = front;
        int val = temp->data;
        
        front = front->next;
        delete temp; 
        
        if (front == NULL) {
            rear = NULL;
        } 
        cout << "dequeued: " << val << endl;
    }

int Front() {
        if (isEmpty()) return -1;
        cout<<"front of que is: "<<front->data<<endl;
    }

void display() {
        if (isEmpty()) {
            cout << "Queue is empty.\n";
            return;
        }
        
        Node* temp = front;
        cout << "Queue (Front to Rear): ";
        while (temp != NULL) {
            cout << temp->data << " ";
            temp = temp->next;
        }
    }
};

int main() {
    LinkedListQueue q;
    cout << "\nIs queue empty? " << (q.isEmpty() ? "Yes" : "No") << endl;
    cout<<endl;

    q.enqueue(10);
    q.enqueue(20);
    q.enqueue(30);
    q.enqueue(40);
    q.enqueue(50);
    q.enqueue(60);
    q.enqueue(70);
    q.enqueue(80);
    q.enqueue(90);
    q.enqueue(100);

    cout << "\nIs queue empty? " << (q.isEmpty() ? "Yes" : "No") << endl;
    q.display(); 
    cout<<endl;

    q.Front();

    cout<<endl;
    q.dequeue();
    q.dequeue();
    q.display(); 

    q.Front();

    return 0;
}
