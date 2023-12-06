#include <iostream>
#include <fstream>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <vector>
#include "processing.h"
using namespace std;

// Reference: https://www.cs.rhodes.edu/~kirlinp/courses/cs2/s17/handouts/file-reading-handout.pdf
// Reference: https://cppbyexample.com/parse_csv.html
int main() {
    Coast* Florida = new Coast();
    Florida->Load("data.txt");

    cout << "Welcome to Florida Coastal Monument Search" << endl;
    cout << "To search by county, type 'COUNTY'" << endl;
    cout << "To search by ID, type 'ID'" << endl;
    string choice;
    getline(cin, choice);

    if (choice != "COUNTY" && choice != "ID") {
        cout << "Invalid Selection" << endl;
        return 1;
    }

    if (choice == "COUNTY") {
        cout << "Please enter the county name you want to search in all caps: " << endl;
        string name;
        getline(cin, name);

        Florida->SearchCounty(name);


    }

    cout << "Please enter the ID of a monument to show data: " << endl;
    string num;
    getline(cin, num);
    Coast::Monument* M;
    M = Florida->DisplayByID(num);

    cout << "To seach all monuments withing a given radius, type 'Y'. To exit, press any key." << endl;
    string input;
    getline(cin, input);
    if (input == "y" || input == "Y") {
        cout << "Enter the radius you want to search within: " << endl;
        string radius;
        getline(cin, radius);
        Florida->SearchRadius(M, stof(radius)/111.0);
        // Citation: 1 lat or 1 long = ~111.0 km per National Geographic
    }
    else {
        return 0;
    }


    return 0;
}
