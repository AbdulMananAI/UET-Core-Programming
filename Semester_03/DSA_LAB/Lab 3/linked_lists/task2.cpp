#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* next;
};

// PART 2: Write the logic to count the nodes
int countNodes(Node* n) {
    int count = 0;
    
    while (n != nullptr) {
        // ??? What do you do to the count?
        // ??? How do you move to the next node?
        count++;
        n = n->next;
    }
    
    return count;
}

int main() {
    Node* head = new Node();
    Node* second = new Node();
    Node* third = new Node();
    Node* fourth = new Node();
    
    // PART 1: Create your fourth node here
    // Node* fourth = ???

    head->data = 10;
    head->next = second;

    second->data = 20;
    second->next = third;

    third->data = 30;
    third->next = fourth;// ??? Fix the third node so it points to the fourth instead of nullptr
    
    fourth->data = 40;// ??? Set up the fourth node's data (40) and next pointer (nullptr)
    fourth->next = nullptr;

    // Let's test it!
    cout << "Total nodes: " << countNodes(head) << endl; 
    // If you did it right, this should print "Total nodes: 4"

    return 0;
}