#include <iostream>
#include <fstream>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <vector>
#include <cmath>
using namespace std;

class Coast {
public:
    struct Monument {
        float x = 0.0;
        float y  = 0.0;
        int objectID = 0;
        string county;
        string uniqueID;
        string monumentName;
        string range;
        string statePlaneZone;
        float easting = 0.0;
        float northing = 0.0;
        float longitude = 0.0;
        float latitude = 0.0;
    };
private:
    vector<Monument*> storage;

public:
    void Load(string filename);
    Monument* DisplayByID(string ID);
    void SearchCounty(string countyName);
    void SearchRadius(Coast::Monument*, float r);
};

void Coast::Load(string filename) {
    ifstream file;
    file.open(filename);

    if(!file.is_open()) {
        cout << "Could not open file: " << filename << endl;
        return;
    }

    // Bypass the header line
    string header;
    getline(file, header);

    while(!file.eof()){
    //for (int i = 0; i < 3; i++) {
        string line;
        getline(file, line);
        //cout << line << endl;
        Monument* temp = new Monument();
        istringstream ss(line);
        string point;
        vector<string> rawData;
        while(getline(ss, point, ',')) {
            rawData.push_back(point);
        }
        try {
            temp->x = stof(rawData.at(0));
            temp->y = stof(rawData.at(1));
            temp->objectID = stoi(rawData.at(2));
            temp->county = rawData.at(3);
            temp->uniqueID = rawData.at(4);
            temp->monumentName = rawData.at(5);
            temp->range = rawData.at(6);
            temp->statePlaneZone = rawData.at(7);
            temp->easting = stof(rawData.at(8));
            temp->northing = stof(rawData.at(9));
            temp->longitude = stof(rawData.at(10));
            temp->latitude = stof(rawData.at(11));
            storage.push_back(temp);
        }
        catch (...) {
        }
    }
}

Coast::Monument* Coast::DisplayByID(string ID) {
    for (int i = 0; i < storage.size(); i++) {
        if (storage.at(i)->uniqueID == ID) {
            cout << "County: " << storage.at(i)->county << endl;
            cout << "Unique ID: " << storage.at(i)->uniqueID << endl;
            cout << "Monument Name: " << storage.at(i)->monumentName << endl;
            cout << "Range: " << storage.at(i)->range << endl;
            cout << "State Plane Zone: " << storage.at(i)->statePlaneZone << endl;
            cout << "Easting: " << storage.at(i)->easting << endl;
            cout << "Northing: " << storage.at(i)->northing << endl;
            cout << "Longitude: " << storage.at(i)->longitude << endl;
            cout << "Latitude: " << storage.at(i)->latitude << endl;
            return storage.at(i);
        }
    }
    return nullptr;
}

void Coast::SearchCounty(string countyName) {
    cout << "Please select a monument in " << countyName << " county:" << endl;
    for (int i = 0; i < storage.size(); i++) {
        if (storage.at(i)->county == countyName) {
            cout << "Monument name: ";
            cout << storage.at(i)->monumentName;
            cout << " | ID: " << storage.at(i)->uniqueID << endl;
        }
    }
}

void Coast::SearchRadius(Coast::Monument* M, float r) {
    float x = M->latitude;
    float y = M->longitude;
    for (int i = 0; i < storage.size(); i++) {
        float distX = x - storage.at(i)->latitude;
        float distY = y - storage.at(i)->longitude;
    float radius = sqrt((distX * distX) + (distY * distY));
        if (radius <= r) {
            cout << "Monument name: ";
            cout << storage.at(i)->monumentName;
            cout << " | ID: " << storage.at(i)->objectID;
            cout << " | Distance: " << radius * 111.0 << " km" << endl;
        }
    }
}